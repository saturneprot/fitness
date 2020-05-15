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

public class OrderDetailDAO {
	//싱글톤 객체생성, 메모리 절약이 된다.
	private static OrderDetailDAO dao = new OrderDetailDAO();

	//jsp에서 dao객체 얻기
	public static OrderDetailDAO getInstance() {
		return dao;
	}

	//디폴트 생성자, private한 이유는 외부에서 객체생성 못하게 하려고
	private OrderDetailDAO() {}

	//커넥션 얻기
	private Connection getConn() throws Exception {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//end
	
	public void insertOrderDetail(OrderDetailDTO dto) {
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt =null;
		String sql=null;
		try {
			conn=getConn();
			sql="INSERT INTO orders_detail VALUES(?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getP_num());
			pstmt.setString(2, dto.getOrder_num());
			pstmt.setInt(3, dto.getOrder_quantity());
			pstmt.executeUpdate();
			sql="DELETE FROM cart WHERE cart_num="+dto.getCart_num();
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
		}catch(Exception e) {
			System.out.println("insertOrderDetail() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}//end insertOrderDetail() method;
	
	public List<OrderDetailDTO> getOrderDetailList(String order_num){
		List<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		OrderDetailDTO dto = null;
		try {
			conn = getConn();
			sql = "SELECT * FROM orders_detail d join product p on(d.p_num=p.p_num) WHERE d.order_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new OrderDetailDTO();
				dto.setOrder_num(rs.getString("order_num"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_name(rs.getString("p_name"));
				dto.setOrder_quantity(rs.getInt("order_quantity"));
				dto.setP_price(rs.getInt("p_price"));
				list.add(dto);
			}
		}catch(Exception e) {
			System.out.println("getOrderDetailList 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return list;
	}
	public void insertOrderDetail22(int p_num, String order_num, int order_quantity) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn=getConn();
			sql="INSERT INTO orders_detail VALUES(?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			pstmt.setString(2, order_num);
			pstmt.setInt(3, order_quantity);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("insertOrderDetail22() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}
}//end class
