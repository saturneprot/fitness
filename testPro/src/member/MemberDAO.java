package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDAO {
	public MemberDAO() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e) {
			System.out.println("driver연동 실패 : " + e);
		}
	}
	
	private Connection getConn() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "1234");//DB 연결
			System.out.println("DB 연결성공");
		}catch(SQLException e) {
			System.out.println("DB 연결실패");
		}
		return conn;
	}//end getCon()
	
	public void signIn(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = getConn();
			sql = "INSERT INTO member VALUES(?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("signIn() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}
}
