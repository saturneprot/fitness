package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartDAO {
	

	private static CartDAO dao = new CartDAO();

	//jsp에서 dao객체 얻기
	public static CartDAO getInstance() {
		return dao;
	}

	//디폴트 생성자, private한 이유는 외부에서 객체생성 못하게 하려고
	private CartDAO() {}

	//커넥션 얻기
	private Connection getConn() throws Exception {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//end
	
	//0.장바구니의 총 상품의 수를 가져온다.
	public int getTotalCart(String mid) {
		int x= 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn=getConn();
			sql="SELECT count(*) FROM cart WHERE mid='"+mid+"'";
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				x=rs.getInt(1);
			}else {
				x=0;
			}
		}catch(Exception e) {
			System.out.println("getTotalCart() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return x;
	}
	
	
	//1. 주문목록을 가져온다.
	public List<CartDTO> getCartList(String mid) {
		List<CartDTO> list = new ArrayList<CartDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CartDTO dto = null;
		String sql = null;
		try {
			conn = getConn();
			sql = "SELECT * FROM cart c join product p on(c.p_num=p.p_num) WHERE mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new CartDTO();
				dto.setCart_num(rs.getInt("cart_num"));
				dto.setMid(rs.getString("mid"));
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_name(rs.getString("p_name"));
				dto.setCart_quantity(rs.getInt("cart_quantity"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_price(rs.getString("p_price"));
				list.add(dto);
			}
		}catch(Exception e) {
			System.out.println("getCartList() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return list;
	}//end getCartList() method;
	
	//2. 주문을 입력하고 장바구니에 담는다. 기존 장바구니에 물건이 있으면 수정하고 없으면 추가함 
	public void insertProductIntoCart(CartDTO dto) {
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = getConn();
			
			sql="SELECT * FROM cart WHERE p_num="+dto.getP_num()+" and mid='"+dto.getMid()+"'";
			//System.out.println(sql);
			stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);
			//System.out.println("여기 들어와?");
			if(rs.next()) {
				sql="UPDATE cart SET cart_quantity=cart_quantity+? WHERE p_num = ? and mid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getCart_quantity());
				pstmt.setInt(2, dto.getP_num());
				pstmt.setString(3, dto.getMid());
				pstmt.executeUpdate();
			}else {				
				sql = "INSERT INTO cart VALUES(0, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getMid());
				pstmt.setInt(2, dto.getP_num());
				pstmt.setInt(3, dto.getCart_quantity());
				pstmt.executeUpdate();
			}
			
		}catch(Exception e) {
			System.out.println("insertProductIntoCart() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}//end insertProductIntoCart() method;
	
	//3. 장바구니에서 삭제한다.
	public void deleteProductFromCart(int cart_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = getConn();
			sql = "DELETE FROM cart WHERE cart_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart_num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("deleteProductFromCart() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}//end deleteProductFromCart() method;
	
	
	//4.  장바구니에서 수량을 수정하고자 한다.
	public int updateProductFromCart(int cart_num, String ud) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String sql = null;
		int x=0;
		try {
			conn = getConn();
//			sql = "UPDATE cart SET cart_quantity=? WHERE cart_num=?";
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setInt(1, newQ);
//			pstmt.setInt(2, cart_num);
//			pstmt.executeUpdate();
			if(ud.equals("u")) {
				sql="UPDATE cart SET cart_quantity=cart_quantity+1 WHERE cart_num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, cart_num);
				pstmt.executeUpdate();
				x=1;
			}else if(ud.equals("d")) {
				sql="UPDATE cart SET cart_quantity=cart_quantity-1 WHERE cart_num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, cart_num);
				pstmt.executeUpdate();
				x=1;
			}
		}catch(Exception e) {
			System.out.println("updateProductFromCart() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return x;
	}
	
	//5. 주문 결제창에서 목록을 보내주고자 한다.
	public List<CartDTO> getOrderList2(String[] cart_nums) {
		List<CartDTO> list = new ArrayList<CartDTO>();
		CartDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int len = cart_nums.length;
		//System.out.println(len);
		try {
			//System.out.println("*****11");
			conn=getConn();
			sql="SELECT * FROM cart c join product p on(c.p_num=p.p_num) WHERE cart_num in ";
			String imsi="(";
			for(int i=0; i<len; i++) {
				if(i!=len-1) {
					imsi+="?,";
				}else if(i==len-1) {
					imsi+="?)";
				}
			}
			//System.out.println("*****22");
			sql+=imsi;
			//System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			for(int j=1; j<=len; j++) {
				pstmt.setString(j, cart_nums[j-1]);
			}
			//System.out.println("*****33");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto = new CartDTO();
				dto.setCart_num(rs.getInt("cart_num"));
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getString("p_price"));
				dto.setCart_quantity(rs.getInt("cart_quantity"));
				list.add(dto);
			}
		}catch(Exception e) {
			System.out.println("getOrderList2() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}		
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return list;
	}
	
//	public int getNumFromCart(int cart_num) {
//		int num=0;
//		Connection conn = null;
//		Statement stmt = null;
//		PreparedStatement pstmt =null;
//		ResultSet rs = null;
//		String sql = null;
//		try {
//			conn=getConn();
//			sql = "SELECT cart_quantity FROM cart WHERE cart_num="+cart_num;
//			stmt = conn.createStatement();
//			rs=stmt.executeQuery(sql);
//		}catch(Exception e) {
//			System.out.println("getNumFromCart() 예외 : " + e);
//		}finally {
//			try {
//				if(pstmt!=null) {pstmt.close();}
//				if(conn!=null) {conn.close();}
//			}catch(Exception e2) {}
//		}
//		return num;
//	}
}//end class
