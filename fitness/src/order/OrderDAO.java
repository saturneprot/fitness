package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderDAO {
	//싱글톤 객체생성, 메모리 절약이 된다.
	private static OrderDAO dao = new OrderDAO();

	//jsp에서 dao객체 얻기
	public static OrderDAO getInstance() {
		return dao;
	}

	//디폴트 생성자, private한 이유는 외부에서 객체생성 못하게 하려고
	private OrderDAO() {}

	//커넥션 얻기
	private Connection getConn() throws Exception {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//end
	
	public void insertOrder(OrderDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = getConn();
			sql = "INSERT INTO orders(order_num, mid, o_name, o_number, o_email, o_addr1, o_addr2, o_comment,o_pay,o_date) VALUES(?,?,?,?,?,?,?,?,?,NOW())";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getOrder_num());
			pstmt.setString(2, dto.getMid());
			pstmt.setString(3, dto.getO_name());
			pstmt.setString(4, dto.getO_number());
			pstmt.setString(5, dto.getO_email());
			pstmt.setString(6, dto.getO_addr1());
			pstmt.setString(7, dto.getO_addr2());
			pstmt.setString(8, dto.getO_comment());
			pstmt.setString(9, dto.getO_pay());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("insertOrder() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}
	public List<OrderDTO> getOrdersList(String mid){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		OrderDTO dto = null;
		try {
			conn = getConn();
			sql = "SELECT o.order_num, o.o_date, o_status, p.p_image, p.p_name, p.p_price, od.order_quantity FROM orders o join orders_detail od ON(o.order_num=od.order_num) join product p ON(od.p_num=p.p_num) WHERE o.mid=? ORDER BY o.o_date desc";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			//System.out.println(rs);
			while(rs.next()) {
				dto = new OrderDTO();
				dto.setOrder_num(rs.getString("order_num"));
				dto.setO_date(rs.getTimestamp("o_date"));
				dto.setO_status(rs.getString("o_status"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setOrder_quantity(rs.getInt("order_quantity"));
				list.add(dto);
			}
		}catch(Exception e) {
			System.out.println("getOrdersList() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return list;
	}
	
	public OrderDTO getDetail(String order_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderDTO dto = null;
		String sql = null;
		try {
			conn=getConn();
			sql="SELECT * FROM orders WHERE order_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, order_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new OrderDTO();
				dto.setOrder_num(rs.getString("order_num"));
				dto.setO_name(rs.getString("o_name"));
				dto.setO_number(rs.getString("o_number"));
				dto.setO_email(rs.getString("o_email"));
				dto.setO_addr1(rs.getString("o_addr1"));
				dto.setO_addr2(rs.getString("o_addr2"));
				dto.setO_comment(rs.getString("o_comment"));
				dto.setO_pay(rs.getString("o_pay"));
				dto.setO_date(rs.getDate("o_date"));
				dto.setO_status(rs.getString("o_status"));
			}
		}catch(Exception e) {
			System.out.println("getDetail() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return dto;
	}
	
	public int getTotalOrder(String mid, String keyField, String keyWord) {
		String sql=null;
		int total=0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn=getConn();
			stmt=conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				sql="SELECT COUNT(*) FROM orders WHERE mid='"+mid+"'";
			}else {
				sql="SELECT COUNT(*) FROM orders WHERE mid='"+mid+"' and "+ keyField + " LIKE '%" + keyWord + "%'";
			}
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				total=rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("getTotalOrder() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return total;
	}
	
	public List<OrderDTO> viewOrdersList(String mid, String keyField, String keyWord, int startRecord){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		OrderDTO dto = null;
		try {
			conn = getConn();
			stmt = conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				sql="SELECT * FROM orders WHERE mid='"+mid+"' ORDER BY o_date desc LIMIT " + startRecord + ", 15";
			}else {//keyword가 있다면				
				sql="SELECT * FROM orders WHERE mid='"+mid+"' and " + keyField + " LIKE '%" + keyWord + "%' ORDER BY o_date desc LIMIT " + startRecord + ", 15";
			}
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				dto=new OrderDTO();
				dto.setOrder_num(rs.getString("order_num"));
				dto.setMid(rs.getString("mid"));
				dto.setO_name(rs.getString("o_name"));
				dto.setO_number(rs.getString("o_number"));
				dto.setO_email(rs.getString("o_email"));
				dto.setO_addr1(rs.getString("o_addr1"));
				dto.setO_addr2(rs.getString("o_addr2"));
				dto.setO_comment(rs.getString("o_comment"));
				dto.setO_pay(rs.getString("o_pay"));
				dto.setO_date(rs.getDate("o_date"));
				dto.setO_status(rs.getString("o_status"));
				list.add(dto);
			}
		}catch(Exception e) {
			System.out.println("viewOrdersList() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return list;
	}//end viewOrdersList() method;
	
	public void changeStatus(String order_num, String o_status) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn=getConn();
			sql="UPDATE orders SET o_status=? WHERE order_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, o_status);
			pstmt.setString(2, order_num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("changeStatus() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}
}//end class
