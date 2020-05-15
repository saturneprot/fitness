package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemDAO {
	//싱글톤 객체생성, 메모리 절약이 된다.
	private static MemDAO dao = new MemDAO();

	//jsp에서 dao객체 얻기
	public static MemDAO getInstance() {
		return dao;
	}

	//디폴트 생성자, private한 이유는 외부에서 객체생성 못하게 하려고
	private MemDAO() {}

	//커넥션 얻기
	private Connection getConn() throws Exception {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	public int confirmId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int check = 0;
		try {
			conn = getConn();
			sql = "SELECT id FROM members WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				check=-1;
			}else {
				check=1;
			}
		}catch(Exception e) {
			System.out.println("confirmId() 예외 : " + e);
		}finally {
			try {
				if(rs!=null){rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return check;
	}//end confirmId() method;
}
