package post;

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

public class BoardDAO {
	String sql=null;
	//싱글톤 객체생성, 메모리 절약이 된다.
	private static BoardDAO dao = new BoardDAO();

	//jsp에서 dao객체 얻기
	public static BoardDAO getInstance() {
		return dao;
	}

	//디폴트 생성자, private한 이유는 외부에서 객체생성 못하게 하려고
	private BoardDAO() {}

	//커넥션 얻기
	private Connection getConn() throws Exception {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//end
	
	//0. 전체 게시판목록 수
	public int getTotal(String keyField, String keyWord) {
		String sql=null;
		int total=0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn=getConn();
			stmt=conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				//sql="SELECT COUNT(*) FROM boardcategory bc join board b on(bc.bc_num=b.bc_num) join members m on(b.mid=m.mid)";
				sql="SELECT COUNT(*) FROM boardcategory bc join board b on(bc.bc_num=b.bc_num) ";
			}else {
				//sql="SELECT COUNT(*) FROM boardcategory bc join board b on(bc.bc_num=b.bc_num) join members m on(b.mid=m.mid) WHERE "+ keyField + " LIKE '%" + keyWord + "%'";
				sql="SELECT COUNT(*) FROM boardcategory bc join board b on(bc.bc_num=b.bc_num)  WHERE "+ keyField + " LIKE '%" + keyWord + "%'";
			}
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				total=rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("getTotal() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return total;
	}//end getTotal() method;
	
	//1. 상품목록리스트**********************
	public List getBoardList(String keyField, String keyWord, int startRecord) {
		String sql=null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		try {
			conn = getConn();
			stmt = conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				//sql="SELECT * FROM boardcategory bc join board b on(bc.bc_num=b.bc_num) join members m on(b.mid=m.mid) ORDER BY b.b_pos asc LIMIT " + startRecord + ", 15";
				sql="SELECT * FROM boardcategory bc join board b on(bc.bc_num=b.bc_num) ORDER BY b.b_pos asc LIMIT " + startRecord + ", 15";
			}else {//keyword가 있다면				
				//sql="SELECT * FROM boardcategory bc join board b on(bc.bc_num=b.bc_num) join members m on(b.mid=m.mid) WHERE " + keyField + " LIKE '%" + keyWord + "%' ORDER BY b.b_pos asc LIMIT " + startRecord + ", 15";
				sql="SELECT * FROM boardcategory bc join board b on(bc.bc_num=b.bc_num)  WHERE " + keyField + " LIKE '%" + keyWord + "%' ORDER BY b.b_pos asc LIMIT " + startRecord + ", 15";
			}
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				/*
				 * dto.setPro_no(rs.getInt("pro_no")); dto.setCode(rs.getString("code"));
				 * dto.setName(rs.getString("name")); dto.setPrice(rs.getInt("price"));
				 * dto.setStock(rs.getInt("stock")); dto.setDetail(rs.getString("detail"));
				 * dto.setComp(rs.getString("comp")); //NOW(); 년월일 시분초, rs.getTimestamp()로 읽어온다.
				 * dto.setRegdate(rs.getTimestamp("regdate"));
				 * dto.setImage(rs.getString("image"));
				 */
				
				dto.setB_num(rs.getInt("b_num"));
				dto.setBc_name(rs.getString("bc_name"));
				dto.setBc_num(rs.getInt("bc_num"));
				//dto.setMname(rs.getString("mname"));
				dto.setMid(rs.getString("mid"));
				dto.setB_subject(rs.getString("b_subject"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_date(rs.getDate("b_date"));
				dto.setB_time(rs.getDate("b_time"));
				dto.setB_count(rs.getInt("b_count"));
				dto.setB_re(rs.getString("b_re"));
				dto.setB_sup(rs.getString("b_sup"));
				boardList.add(dto);				
			}//end while
		}catch(Exception e) {
			System.out.println("getBoardList() 예외 : " + e);
		}finally {
			try {
				if(rs!= null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				if(conn!= null) {conn.close();}
			}catch(SQLException e2) {}
		}
		return boardList;
	}//end getBoardList() method;
	
	
	//2. 게시글 삭제하기
	public void deleteBoard(int b_num) {
		String sql = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConn();
			sql="DELETE FROM board WHERE b_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			pstmt.executeUpdate();			
		}catch(Exception e) {
			System.out.println("deleteBoard() 예외 : " + e);
		}finally{
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}//end deleteBoard() method;
	
	//increase position;
	public void increasePosition() {
		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		try {
			conn = getConn();
			stmt = conn.createStatement();
			sql = "UPDATE board SET b_pos=b_pos+1";
			stmt.executeUpdate(sql);
		}catch(Exception e) {
			System.out.println("increasePosition() 예외 : " + e);
		}finally {
			try {
				if(stmt!=null) {stmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}//end increasePosition() method;
	
	public void insertBoard(BoardDTO dto) {
		increasePosition();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConn();
			sql="INSERT INTO board(b_num, bc_num, mid, b_subject, b_content, b_date, b_time, b_pwd, b_pos, b_depth) ";
			sql+="VALUES(0,?,?,?,?,NOW(),NOW(),?,0,0)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBc_num());
			pstmt.setString(2, dto.getMid());
			pstmt.setString(3, dto.getB_subject());
			pstmt.setString(4, dto.getB_content());
			pstmt.setString(5, dto.getB_pwd());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("insertBoard() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}
	
	public void increaseCount(int b_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql=null;
		try {
			conn = getConn();
			sql = "UPDATE board SET b_count=b_count+1 WHERE b_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("increaseCount() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}//end increaseCount() method;
	
	public BoardDTO viewBoard(int b_num) {
		BoardDTO dto = new BoardDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = getConn();
			sql="SELECT * FROM board WHERE b_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto.setMid(rs.getString("mid"));
				dto.setB_num(rs.getInt("b_num"));
				dto.setBc_num(rs.getInt("bc_num"));
				dto.setB_subject(rs.getString("b_subject"));
				dto.setB_content(rs.getString("b_content").replaceAll("\n", "<br>"));
				dto.setB_date(rs.getDate("b_date"));
				dto.setB_time(rs.getDate("b_time"));
				dto.setB_count(rs.getInt("b_count"));
				dto.setB_re(rs.getString("b_re"));
			}
		}catch(Exception e) {
			System.out.println("viewBoard() 예외 : " + e);
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			}catch(Exception e2) {}
		}
		return dto;
	}//end viewBoard() method;
	
	public BoardDTO viewBoard2(int b_num) {
		BoardDTO dto = new BoardDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = getConn();
			sql="SELECT * FROM board WHERE b_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto.setMid(rs.getString("mid"));
				dto.setB_num(rs.getInt("b_num"));
				dto.setBc_num(rs.getInt("bc_num"));
				dto.setB_subject(rs.getString("b_subject"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_date(rs.getDate("b_date"));
				dto.setB_time(rs.getDate("b_time"));
				dto.setB_count(rs.getInt("b_count"));
				dto.setB_re(rs.getString("b_re"));
			}
		}catch(Exception e) {
			System.out.println("viewBoard() 예외 : " + e);
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			}catch(Exception e2) {}
		}
		return dto;
	}//end viewBoard() method;
	
	public void updateBoard(BoardDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConn();
			sql="UPDATE board SET b_subject=?, b_content=? WHERE b_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getB_subject());
			pstmt.setString(2, dto.getB_content());
			pstmt.setInt(3, dto.getB_num());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("updateBoard() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}//end updateBoard() method;
	public void raise(int b_pos) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn=getConn();
			sql="UPDATE board SET b_pos=b_pos+1 WHERE b_pos>?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_pos);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("raise() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();
				if(conn!=null) {conn.close();}
				}
			}catch(Exception e2) {}
		}//end finally
	}//end raise
	
	public void insertReply(BoardDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn=getConn();
			sql="INSERT INTO board(b_num,bc_num,mid,b_subject,b_content,b_date,b_time,b_pwd,b_pos,b_depth, b_re, b_sup) ";
			sql+="VALUES(0,?,?,?,?,NOW(),NOW(),?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBc_num());
			pstmt.setString(2, dto.getMid());
			pstmt.setString(3, dto.getB_subject());
			pstmt.setString(4, dto.getB_content());
			pstmt.setString(5, dto.getB_pwd());
			pstmt.setInt(6, dto.getB_pos()+1);
			pstmt.setInt(7, dto.getB_depth()+1);
			pstmt.setString(8, dto.getB_re());
			pstmt.setString(9, dto.getB_sup());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("insertReply() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}
	public int checkBoardPwd(int b_num, String b_pwd) {
		int x = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		try {
			conn=getConn();
			sql="SELECT b_num FROM board WHERE b_num=? and b_pwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			pstmt.setString(2, b_pwd);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=1;
			}else {
				x=-1;
			}
		}catch(Exception e) {
			System.out.println("checkBoardPwd() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return x;
	}
	
	
	public BoardDTO getPosDepth(int b_num) {
		BoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			dto = new BoardDTO();
			conn = getConn();
			sql="SELECT b_pos, b_depth FROM board WHERE b_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setB_pos(rs.getInt("b_pos"));
				dto.setB_depth(rs.getInt("b_depth"));
			}
		}catch(Exception e) {
			System.out.println("getPostDepth() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return dto;
	}
	public void updateRe(int b_num, String b_re) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn=getConn();
			sql="UPDATE board SET b_re=? WHERE b_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b_re);
			pstmt.setInt(2, b_num);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("updateRe() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}
}//end class
