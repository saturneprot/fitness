package adminmember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDAO {
	String sql=null;
	//싱글톤 객체생성, 메모리 절약이 된다.
	private static LoginDAO dao = new LoginDAO();

	//jsp에서 dao객체 얻기
	public static LoginDAO getInstance() {
		return dao;
	}

	//디폴트 생성자, private한 이유는 외부에서 객체생성 못하게 하려고
	private LoginDAO() {}

	//커넥션 얻기
	private Connection getConn() throws Exception {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//end
	
	//1. 로그인하려고한다.
	public int confirmUser(String id, String pwd) {
		int x=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql = null;
		try {
			conn=getConn();
			sql="SELECT id FROM admin WHERE id=? and pwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x=1;//로그인 성공
			}else {
				x=-1;//로그인 실패
			}
		}catch(Exception e) {
			System.out.println("confirmUser() 예외발생 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return x;
	}//end confirmUser() method;
}//end class;
