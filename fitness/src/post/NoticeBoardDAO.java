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

public class NoticeBoardDAO {
	//싱글톤 객체생성, 메모리 절약이 된다.
	private static NoticeBoardDAO dao = new NoticeBoardDAO();

	//jsp에서 dao객체 얻기
	public static NoticeBoardDAO getInstance() {
		return dao;
	}

	//디폴트 생성자, private한 이유는 외부에서 객체생성 못하게 하려고
	private NoticeBoardDAO() {}

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
				sql="SELECT COUNT(*) FROM boardcategory bc join noticeboard nb on(bc.bc_num=nb.bc_num) join admin ad on(nb.id=ad.id)";
			}else {
				sql="SELECT COUNT(*) FROM boardcategory bc join noticeboard nb on(bc.bc_num=nb.bc_num) join admin ad on(nb.id=ad.id) WHERE "+ keyField + " LIKE '%" + keyWord + "%'";
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
		
		List<NoticeBoardDTO> boardList = new ArrayList<NoticeBoardDTO>();
		
		try {
			conn = getConn();
			stmt = conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				sql="SELECT * FROM boardcategory bc join noticeboard nb on(bc.bc_num=nb.bc_num) join admin ad on(nb.id=ad.id) ORDER BY nb.nb_num desc LIMIT " + startRecord + ", 15";
			}else {//keyword가 있다면				
				sql="SELECT * FROM boardcategory bc join noticeboard nb on(bc.bc_num=nb.bc_num) join admin ad on(nb.id=ad.id) WHERE " + keyField + " LIKE '%" + keyWord + "%' ORDER BY nb.nb_num desc LIMIT " + startRecord + ", 15";
			}
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				NoticeBoardDTO dto = new NoticeBoardDTO();
				/*
				 * dto.setPro_no(rs.getInt("pro_no")); dto.setCode(rs.getString("code"));
				 * dto.setName(rs.getString("name")); dto.setPrice(rs.getInt("price"));
				 * dto.setStock(rs.getInt("stock")); dto.setDetail(rs.getString("detail"));
				 * dto.setComp(rs.getString("comp")); //NOW(); 년월일 시분초, rs.getTimestamp()로 읽어온다.
				 * dto.setRegdate(rs.getTimestamp("regdate"));
				 * dto.setImage(rs.getString("image"));
				 */
				
				dto.setNb_num(rs.getInt("nb_num"));
				dto.setBc_num(rs.getInt("bc_num"));
				dto.setId(rs.getString("id"));
				dto.setNb_subject(rs.getString("nb_subject"));
				dto.setNb_content(rs.getString("nb_content"));
				dto.setNb_date(rs.getDate("nb_date"));
				dto.setNb_time(rs.getDate("nb_time"));
				dto.setNb_count(rs.getInt("nb_count"));
				
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
	
	public void insertBoard(NoticeBoardDTO dto) {
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt =null;
		try {
			conn=getConn();
			sql="INSERT INTO noticeboard(nb_num, bc_num, id, nb_subject, nb_content, nb_date, nb_time) values(0, ?, 'admin', ?,?,now(),now())";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBc_num());
			pstmt.setString(2, dto.getNb_subject());
			pstmt.setString(3, dto.getNb_content());
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
	
	public void deleteNBoard(int nb_num) {
		String sql= "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConn();
			sql="DELETE FROM noticeboard WHERE nb_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nb_num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("deleteNBoard() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}//end deleteNBoard() method;
	
	public NoticeBoardDTO viewNoticeBoard(int nb_num) {
		NoticeBoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		
		try {
			conn=getConn();
			sql ="SELECT * FROM noticeboard WHERE nb_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nb_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new NoticeBoardDTO();
				dto.setNb_num(rs.getInt("nb_num"));
				dto.setBc_num(rs.getInt("bc_num"));
				dto.setId(rs.getString("id"));
				dto.setNb_subject(rs.getString("nb_subject"));
				dto.setNb_content(rs.getString("nb_content").replaceAll("\n", "<br>"));
				dto.setNb_date(rs.getDate("nb_date"));
				dto.setNb_count(rs.getInt("nb_count"));
			}
		}catch(Exception e) {
			System.out.println("viewNoticeBoard() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return dto;
	}
	public NoticeBoardDTO viewNoticeBoard2(int nb_num) {
		NoticeBoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		
		try {
			conn=getConn();
			sql ="SELECT * FROM noticeboard WHERE nb_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nb_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new NoticeBoardDTO();
				dto.setNb_num(rs.getInt("nb_num"));
				dto.setBc_num(rs.getInt("bc_num"));
				dto.setId(rs.getString("id"));
				dto.setNb_subject(rs.getString("nb_subject"));
				dto.setNb_content(rs.getString("nb_content"));
				dto.setNb_date(rs.getDate("nb_date"));
				dto.setNb_count(rs.getInt("nb_count"));
			}
		}catch(Exception e) {
			System.out.println("viewNoticeBoard() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return dto;
	}
	public void increaseCount(int nb_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn=getConn();
			sql="UPDATE noticeboard SET nb_count=nb_count+1 WHERE nb_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nb_num);
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
	
	public NoticeBoardDTO clickNoticeName(int nb_num) {
		NoticeBoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		
		try {
			conn=getConn();
			sql ="SELECT * FROM noticeboard WHERE nb_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nb_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new NoticeBoardDTO();
				dto.setNb_num(rs.getInt("nb_num"));
				dto.setBc_num(rs.getInt("bc_num"));
				dto.setId(rs.getString("id"));
				dto.setNb_subject(rs.getString("nb_subject"));
				dto.setNb_content(rs.getString("nb_content").replaceAll("\n", "<br>"));
				dto.setNb_date(rs.getDate("nb_date"));
				dto.setNb_count(rs.getInt("nb_count"));
			}
		}catch(Exception e) {
			System.out.println("clickNoticeName() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return dto;
	}
	
	public NoticeBoardDTO clickNoticeName2(int nb_num) {
		NoticeBoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		
		try {
			conn=getConn();
			sql ="SELECT * FROM noticeboard WHERE nb_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nb_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new NoticeBoardDTO();
				dto.setNb_num(rs.getInt("nb_num"));
				dto.setBc_num(rs.getInt("bc_num"));
				dto.setId(rs.getString("id"));
				dto.setNb_subject(rs.getString("nb_subject"));
				dto.setNb_content(rs.getString("nb_content"));
				dto.setNb_date(rs.getDate("nb_date"));
				dto.setNb_count(rs.getInt("nb_count"));
			}
		}catch(Exception e) {
			System.out.println("clickNoticeName() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return dto;
	}
	
	public NoticeBoardDTO viewNoticeName(int nb_num) {
		NoticeBoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		
		try {
			conn=getConn();
			sql ="SELECT * FROM noticeboard WHERE nb_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nb_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				
				dto=new NoticeBoardDTO();
				dto.setNb_num(rs.getInt("nb_num"));
				dto.setBc_num(rs.getInt("bc_num"));
				dto.setId(rs.getString("id"));
				dto.setNb_subject(rs.getString("nb_subject"));
				dto.setNb_content(rs.getString("nb_content").replaceAll("\n", "<br>"));
				dto.setNb_date(rs.getDate("nb_date"));
				dto.setNb_count(rs.getInt("nb_count"));
			}
		}catch(Exception e) {
			System.out.println("viewNoticeName() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return dto;
	}
	
	public NoticeBoardDTO getModifyForm(int nb_num) {
		NoticeBoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		
		try {
			conn=getConn();
			sql ="SELECT * FROM noticeboard WHERE nb_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nb_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new NoticeBoardDTO();
				dto.setNb_num(rs.getInt("nb_num"));
				dto.setBc_num(rs.getInt("bc_num"));
				dto.setId(rs.getString("id"));
				dto.setNb_subject(rs.getString("nb_subject"));
				dto.setNb_content(rs.getString("nb_content"));
			}
		}catch(Exception e) {
			System.out.println("getModifyForm() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return dto;
	}
	
	public void modifyNotice(int nb_num, String nb_subject, String nb_content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = getConn();
			sql="UPDATE noticeboard SET nb_subject=?, nb_content=? WHERE nb_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nb_subject);
			pstmt.setString(2, nb_content);
			pstmt.setInt(3, nb_num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("modifyNotice() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}
	
	//0. 전체 게시판목록 수
	public int getTotalNF(String keyField, String keyWord, int bc_num) {
		String sql=null;
		int total=0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn=getConn();
			stmt=conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				sql="SELECT COUNT(*) FROM boardcategory bc join noticeboard nb on(bc.bc_num=nb.bc_num) join admin ad on(nb.id=ad.id) WHERE bc.bc_num="+bc_num;
			}else {
				sql="SELECT COUNT(*) FROM boardcategory bc join noticeboard nb on(bc.bc_num=nb.bc_num) join admin ad on(nb.id=ad.id) WHERE "+ keyField + " LIKE '%" + keyWord + "%' and bc.bc_num="+bc_num;
			}
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				total=rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("getTotalNF() 예외 : " + e);
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
	public List getNFBoardList(String keyField, String keyWord, int startRecord, int bc_num) {
		String sql=null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<NoticeBoardDTO> boardList = new ArrayList<NoticeBoardDTO>();
		
		try {
			conn = getConn();
			stmt = conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				sql="SELECT * FROM boardcategory bc join noticeboard nb on(bc.bc_num=nb.bc_num) join admin ad on(nb.id=ad.id) WHERE bc.bc_num="+bc_num+" ORDER BY nb.nb_num desc LIMIT " + startRecord + ", 15";
			}else {//keyword가 있다면				
				sql="SELECT * FROM boardcategory bc join noticeboard nb on(bc.bc_num=nb.bc_num) join admin ad on(nb.id=ad.id) WHERE bc.bc_num="+bc_num+" and "+ keyField + " LIKE '%" + keyWord + "%' ORDER BY nb.nb_num desc LIMIT " + startRecord + ", 15";
			}
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				NoticeBoardDTO dto = new NoticeBoardDTO();
				/*
				 * dto.setPro_no(rs.getInt("pro_no")); dto.setCode(rs.getString("code"));
				 * dto.setName(rs.getString("name")); dto.setPrice(rs.getInt("price"));
				 * dto.setStock(rs.getInt("stock")); dto.setDetail(rs.getString("detail"));
				 * dto.setComp(rs.getString("comp")); //NOW(); 년월일 시분초, rs.getTimestamp()로 읽어온다.
				 * dto.setRegdate(rs.getTimestamp("regdate"));
				 * dto.setImage(rs.getString("image"));
				 */
				
				dto.setNb_num(rs.getInt("nb_num"));
				dto.setBc_num(rs.getInt("bc_num"));
				dto.setId(rs.getString("id"));
				dto.setNb_subject(rs.getString("nb_subject"));
				dto.setNb_content(rs.getString("nb_content"));
				dto.setNb_date(rs.getDate("nb_date"));
				dto.setNb_time(rs.getDate("nb_time"));
				dto.setNb_count(rs.getInt("nb_count"));
				
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
}
