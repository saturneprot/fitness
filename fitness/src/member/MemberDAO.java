package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	String sql=null;
	//싱글톤 객체생성, 메모리 절약이 된다.
	private static MemberDAO dao = new MemberDAO();

	//jsp에서 dao객체 얻기
	public static MemberDAO getInstance() {
		return dao;
	}

	//디폴트 생성자, private한 이유는 외부에서 객체생성 못하게 하려고
	private MemberDAO() {}

	//커넥션 얻기
	private Connection getConn() throws Exception {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	//0. 전체 회원 수 구하기(admin)
	public int getTotalMember(String keyField, String keyWord) {
		String sql=null;
		int total=0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn=getConn();
			stmt=conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				sql="SELECT COUNT(*) FROM members";
			}else {
				sql="SELECT COUNT(*) FROM members WHERE "+ keyField + " LIKE '%" + keyWord + "%'";
			}
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				total=rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("getTotalMember() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return total;
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	//1. 회원 목록리스트(admin)**********************
	public List getMemberList(String keyField, String keyWord, int startRecord) {
		String sql=null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<MemberDTO> goodList = new ArrayList<MemberDTO>();
		MemberDTO dto=null;
		try {
			conn = getConn();
			stmt = conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				sql="SELECT * FROM members ORDER BY msignindate desc LIMIT " + startRecord + ", 15";
			}else {//keyword가 있다면				
				sql="SELECT * FROM members WHERE " + keyField + " LIKE '%" + keyWord + "%' ORDER BY msignindate desc LIMIT " + startRecord + ", 15";
			}
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				dto = new MemberDTO();
				dto.setMno(rs.getInt("mno"));
				dto.setMid(rs.getString("mid"));
				dto.setMpwd(rs.getString("mpwd"));
				dto.setMname(rs.getString("mname"));
				dto.setMnumber(rs.getString("mnumber"));
				dto.setMemail(rs.getString("memail"));
				dto.setMsignindate(rs.getDate("msignindate"));
				goodList.add(dto);				
			}//end while
		}catch(Exception e) {
			System.out.println("getMemberList() 예외 : " + e);
		}finally {
			try {
				if(rs!= null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				if(conn!= null) {conn.close();}
			}catch(SQLException e2) {}
		}
		return goodList;
	}//end getGoodList() method;
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//1. 회원가입이다.////////////////////////////////////////////////////////////////////////
	public void insertMember(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		sql=null;
		try {

			conn=getConn();

			sql="INSERT INTO members(mno, mid, mpwd, mname, mnumber, memail,msignindate) VALUES(0,?,?,?,?,?,now())";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMpwd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getMnumber());
			pstmt.setString(5, dto.getMemail());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("insertMember() 예외발생 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}//end insertMember() method;

	//2. 가입할 때 아이디 중복 확인한다.//////////////////////////////////////////////////////////////////////
	public int confirmId(String id) {
		int x = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql = null;
		try {
			conn = getConn();
			sql="SELECT mid FROM members WHERE mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {//기존에 ID가 존재하면
				x=-1;
			}else {//기존에 ID가 존재하지 않는다면
				x=1;
			}
			
		}catch(Exception e) {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return x;
	}//end 
	
	//3. 로그인할 때 유효한 유저인지 확인한다.///////////////////////////////////////////////////////////////////
	public int confirmUser(String id, String pwd) {
		int x = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql = null;
		try {
			conn = getConn();
			sql="SELECT mid FROM members WHERE mid=? and mpwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {//로그인 성공
				x=1;
			}else {//로그인 실패
				x=-1;
			}
		}catch(Exception e) {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return x;
	}
	
	//4. 장바구니에서 구매버튼을 클릭하였을 때 구매자정보를 가져온다.
	public MemberDTO getUserInfo(String mid) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn=getConn();
			sql = "SELECT mid, mname, memail, mnumber FROM members WHERE mid =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto=new MemberDTO();
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				dto.setMemail(rs.getString("memail"));
				dto.setMnumber(rs.getString("mnumber"));
			}
		}catch(Exception e) {
			System.out.println("getUserInfo() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return dto;
	}//end getUserInfo() method;
	
	public MemberDTO viewMyPage(String mid) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn=getConn();
			sql="SELECT * FROM members WHERE mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new MemberDTO();
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				dto.setMnumber(rs.getString("mnumber"));
				dto.setMemail(rs.getString("memail"));
				dto.setMpwd(rs.getString("mpwd"));
			}
		}catch(Exception e) {
			System.out.println("viewMyPage() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return dto;
	}//end viewMyPage() method;
	
	public int updatePassword(String mid, String curpwd, String newpwd) {
		System.out.println("mid : " + mid + " curpwd : " + curpwd + " newpwd : " + newpwd);
		int x=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn=getConn();
			sql = "SELECT * FROM members WHERE mid='"+mid+"' and mpwd='"+curpwd+"'";
			//pstmt=conn.prepareStatement(sql);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				sql="UPDATE members SET mpwd=? WHERE mid=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, newpwd);
				pstmt.setString(2, mid);
				pstmt.executeUpdate();
				x=1;
			}else {
				x=-1;
			}
		}catch(Exception e) {
			System.out.println("updatePassword() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return x;
	}//end updatePassword() method;
	
	public int updateName(String mid, String mname) {
		int x=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn=getConn();
			sql = "UPDATE members set mname=? WHERE mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			pstmt.setString(2, mid);
			x=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("updateName() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return x;
	}//end updateName() method;
	public int updateNumber(String mid, String mnumber) {
		int x=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn=getConn();
			sql = "UPDATE members set mnumber=? WHERE mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mnumber);
			pstmt.setString(2, mid);
			x=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("updateNumber() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return x;
	}//end updateNumber() method;
	
	public int updateEmail(String mid, String memail) {
		int x=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn=getConn();
			sql = "UPDATE members set memail=? WHERE mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memail);
			pstmt.setString(2, mid);
			x=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("updateEmail() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return x;
	}//end updateNumber() method;
	
	public int signOut(String mid, String mpwd) {
		int x = 0;
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		sql = null;
		try {
			conn = getConn();
			stmt=conn.createStatement();
			sql="SELECT mid FROM members WHERE mid='"+ mid+"' and mpwd='"+mpwd+"'";
			rs=stmt.executeQuery(sql);
			
			if(rs.next()) {//본인확인이 되었으므로 탈퇴시켜준다.
				sql="DELETE FROM members WHERE mid=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.executeUpdate();
				x=1;
			}else {//본인확인이 실패됨
				x=-1;
			}
		}catch(Exception e) {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return x;
	}
	
	public int confirmNameNumber(String mname, String mnumber) {
		int x=0;
		String sql =null;
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			conn=getConn();
			sql="SELECT mid FROM members WHERE mname=? and mnumber=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			pstmt.setString(2, mnumber);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=1;
			}else {
				x=-1;
			}
		}catch(Exception e) {
			System.out.println("confirmNameNumber 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return x;
		
	}
	public int confirmNameIdEmail(String mname, String mid, String memail) {
		int x=0;
		String sql =null;
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			conn=getConn();
			sql="SELECT mid FROM members WHERE mname=? and mid=? and memail=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			pstmt.setString(2, mid);
			pstmt.setString(3, memail);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=1;
			}else {
				x=-1;
			}
		}catch(Exception e) {
			System.out.println("confirmNameIdEmail 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return x;
		
	}
	
	public String getId(String mname, String mnumber) {
		String id=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn=getConn();
			sql="SELECT mid FROM members WHERE mname=? and mnumber=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			pstmt.setString(2, mnumber);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				id=rs.getString("mid");
			}
		}catch(Exception e) {
			System.out.println("getId() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return id;
	}
	public void changePwd(String mname, String mid, String memail, String mpwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn=getConn();
			sql="UPDATE members set mpwd=? WHERE mname=? and mid=? and memail=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mpwd);
			pstmt.setString(2, mname);
			pstmt.setString(3, mid);
			pstmt.setString(4, memail);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("changePwd() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}
}//end class
