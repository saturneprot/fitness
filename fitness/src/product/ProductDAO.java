package product;

import java.io.File;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



public class ProductDAO {
	
	//싱글톤 객체생성, 메모리 절약이 된다.
	private static ProductDAO dao = new ProductDAO();

	//jsp에서 dao객체 얻기
	public static ProductDAO getInstance() {
		return dao;
	}

	//디폴트 생성자, private한 이유는 외부에서 객체생성 못하게 하려고
	private ProductDAO() {}

	//커넥션 얻기
	private Connection getConn() throws Exception {
		Context ct = new InitialContext();
		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//end
	
	//0. 전체 상품목록 수(admin)
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
				sql="SELECT COUNT(*) FROM product p join category c on(p.c_num=c.c_num)";
			}else {
				sql="SELECT COUNT(*) FROM product p join category c on(p.c_num=c.c_num) WHERE "+ keyField + " LIKE '%" + keyWord + "%'";
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
	}
	
	//1. 상품목록리스트(admin)**********************
	public List getGoodList(String keyField, String keyWord, int startRecord) {
		String sql=null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<ProductDTO> goodList = new ArrayList<ProductDTO>();
		
		try {
			conn = getConn();
			stmt = conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				sql="SELECT * FROM product p join category c on(p.c_num=c.c_num) ORDER BY p_num desc LIMIT " + startRecord + ", 15";
			}else {//keyword가 있다면				
				sql="SELECT * FROM product p join category c on(p.c_num=c.c_num) WHERE " + keyField + " LIKE '%" + keyWord + "%' ORDER BY p_num desc LIMIT " + startRecord + ", 15";
			}
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				/*
				 * dto.setPro_no(rs.getInt("pro_no")); dto.setCode(rs.getString("code"));
				 * dto.setName(rs.getString("name")); dto.setPrice(rs.getInt("price"));
				 * dto.setStock(rs.getInt("stock")); dto.setDetail(rs.getString("detail"));
				 * dto.setComp(rs.getString("comp")); //NOW(); 년월일 시분초, rs.getTimestamp()로 읽어온다.
				 * dto.setRegdate(rs.getTimestamp("regdate"));
				 * dto.setImage(rs.getString("image"));
				 */
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_stock(rs.getInt("p_stock"));
				dto.setP_comment(rs.getString("p_comment"));
				dto.setP_company(rs.getString("p_company"));
				dto.setP_image(rs.getString("p_image"));
				dto.setC_name(rs.getString("c_name"));
				dto.setP_regdate(rs.getDate("p_regdate"));
				dto.setP_regdate2(rs.getDate("p_regdate2"));
				dto.setP_hide(rs.getString("p_hide"));
				goodList.add(dto);				
			}//end while
		}catch(Exception e) {
			System.out.println("getGoodList() 예외 : " + e);
		}finally {
			try {
				if(rs!= null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				if(conn!= null) {conn.close();}
			}catch(SQLException e2) {}
		}
		return goodList;
	}//end getGoodList() method;
	
	//2. 상품 입력
	public boolean insertProduct(HttpServletRequest request) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql=null;
		boolean result = false;
		int maxSize=5*1024*1024;
		
		try {
			conn=getConn();
			String real_path=request.getSession().getServletContext().getRealPath("/");
			//System.out.println(real_path);
			//String upload_dir=real_path+"/productImgs/";
			
			//String upload_dir="E:\\myWorkspace\\web\\fitness\\WebContent\\productImgs";			 
			String upload_dir="/home/eprot/servlet/fitness/WebContent/productImgs";
			//System.out.println(upload_dir);
			MultipartRequest multi
			=new MultipartRequest(request, upload_dir, maxSize, "utf-8",new DefaultFileRenamePolicy());
			
			sql	="INSERT INTO product(p_num, p_code, p_name, p_price, p_stock, p_company, ";
			sql+="c_num, p_comment, p_image, p_regdate) ";
			sql+="VALUES(0,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, multi.getParameter("p_code"));
			pstmt.setString(2, multi.getParameter("p_name"));
			pstmt.setInt(3, Integer.parseInt(multi.getParameter("p_price")));
			pstmt.setInt(4, Integer.parseInt(multi.getParameter("p_stock")));
			pstmt.setString(5, multi.getParameter("p_company"));
			pstmt.setString(6, multi.getParameter("c_num"));
			pstmt.setString(7, multi.getParameter("p_comment"));
			
			if(multi.getFilesystemName("p_image")!=null) {//그림파일이 있다
				pstmt.setString(8, multi.getFilesystemName("p_image"));
				String ii = multi.getFilesystemName("p_image");
				//System.out.println(ii);
			}else {//그림파일이 없을때
				pstmt.setString(8, "img");
			}
			String year=multi.getParameter("year");
			String month=multi.getParameter("month");
			String day=multi.getParameter("day");
			//String hour=multi.getParameter("hour");
			//String imsi=year+"-"+month+"-"+day+" "+hour+":00:00";
			String imsi=year+"-"+month+"-"+day;
			//Timestamp.valueOf(imsi);
			//System.out.println(imsi);
			//System.out.println(sdf1.format(imsi));
			//Timestamp ts = Timestamp.valueOf(imsi);
			//pstmt.setString(9, sdf1.format(imsi));
			pstmt.setDate(9, Date.valueOf(imsi));
			int count = pstmt.executeUpdate();//쿼리 실행한다.
			if(count==1) {
				result=true;
			}
			
		}catch(Exception e) {
			System.out.println("insertProduct() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e) {}
		}//end finally		
		
		return result;
	}//end insertProduct() method;
	
	//3. 상품 삭제
	public boolean deleteProduct(HttpServletRequest request, int p_num) {
		String sql=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn=getConn();
			sql = "SELECT p_image FROM product WHERE p_num="+p_num;
			String real_path=request.getServletContext().getRealPath("/");
			String upload_Dir=real_path+"/productImgs/";
			//upload_Dir="E:\\myWorkspace\\web\\fitness\\WebContent\\productImgs\\";
			upload_Dir="/home/eprot/servlet/fitness/WebContent/productImgs/";
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				File f = new File(upload_Dir+rs.getString("p_image"));
				if(f.isFile()) {
					f.delete();
				}
			}
			rs.close();
			stmt.close();
			
			sql = "delete FROM product WHERE p_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			int count=pstmt.executeUpdate();
			if(count>0) {
				result=true;
			}
			
		}catch(Exception e) {
			System.out.println("deleteProduct() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		
		return result;
	}
	
	public ProductDTO clickProductName(int p_num) {
		ProductDTO dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		
		try {
			conn = getConn();
			sql="SELECT * FROM product p join category c on(p.c_num=c.c_num) WHERE p.p_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto=new ProductDTO();
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_stock(rs.getInt("p_stock"));
				dto.setC_name(rs.getString("c_name"));
				dto.setP_company(rs.getString("p_company"));
				dto.setP_comment(rs.getString("p_comment").replaceAll("\n", "<br>"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_regdate(rs.getDate("p_regdate"));
			}
		}catch(Exception e) {
			System.out.println("clickProductName() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return dto;
	}
	
	//4. retrieve modifyForm;
	public ProductDTO getModifyForm(int p_num) {
		ProductDTO dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		
		try {
			conn = getConn();
			sql="SELECT * FROM product p join category c on(p.c_num=c.c_num) WHERE p.p_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto=new ProductDTO();
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_stock(rs.getInt("p_stock"));
				//dto.setC_name(rs.getString("c_name"));
				dto.setP_company(rs.getString("p_company"));
				dto.setP_hide(rs.getString("p_hide"));
				dto.setP_comment(rs.getString("p_comment"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_regdate2(rs.getDate("p_regdate2"));
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
	
	//5. dealing with data from modifyForm
	public String modifyProduct(HttpServletRequest request) {
		String str=null;
		String sql=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConn();
			
			String real_path=request.getServletContext().getRealPath("/");
			//String upload_Dir=real_path+"/productImgs/";
			//String upload_Dir="E:\\myWorkspace\\web\\fitness\\WebContent\\productImgs\\";
			String upload_Dir="/home/eprot/servlet/fitness/WebContent/productImgs/";
			//System.out.println(upload_Dir);
			int size=5*1024*1024;
			
			MultipartRequest multi =				
					new MultipartRequest(request, upload_Dir, size, "utf-8", new DefaultFileRenamePolicy());
			if(multi.getParameter("keyField").equals("") || multi.getParameter("keyWord").equals("")) {
				str="100|"+multi.getParameter("block")+"|"+multi.getParameter("page");
			}else {
				str="200|"+multi.getParameter("keyField")+"|"+multi.getParameter("keyWord")+"|"+multi.getParameter("block")+"|"+multi.getParameter("page");
			}
			String year = multi.getParameter("year");
			String month=multi.getParameter("month");
			String day = multi.getParameter("day");
			String imsi = null;
			if((!year.equals("")) && (!month.equals("")) && (!day.equals(""))) {
				imsi = year+"-"+month+"-"+day;
			}
			//System.out.println(imsi);
			//System.out.println("여기 들어오냐");
			//새로운 파일로 업데이트하지 않았다면
			if(multi.getFilesystemName("p_image22")==null) {
				//System.out.println("새로운 파일로 업데이트 하지 않을거야");
				sql="UPDATE product SET p_code=?, p_name=?, p_price=?, p_stock=?, p_company=?, p_hide=?, p_comment=?, p_regdate2=? WHERE p_num=? ";
				pstmt = conn.prepareStatement(sql);
				//System.out.println("??????????????????/");
				pstmt.setString(1, multi.getParameter("p_code"));
				pstmt.setString(2, multi.getParameter("p_name"));
				pstmt.setInt(3, Integer.parseInt(multi.getParameter("p_price")));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("p_stock")));
				pstmt.setString(5, multi.getParameter("p_company"));
				pstmt.setString(6, multi.getParameter("p_hide"));
				pstmt.setString(7, multi.getParameter("p_comment"));
				//System.out.println(".......................");
				if(imsi!=null) {
					//System.out.println("777777777777");
					pstmt.setDate(8, Date.valueOf(imsi));
				}else {
					//System.out.println("888888888888888888");
					pstmt.setDate(8, null);
				}
				//System.out.println("1/1/1//1/1//1/1");
				pstmt.setString(9, multi.getParameter("p_num"));
				pstmt.executeUpdate();
				//System.out.println("어디가 문제일까?");
			}else {//새로운 파일로 업데이트하고자 한다면
				//System.out.println("새로운 파일로 업데이트 한다");
				//기존 파일 먼저 지워준다
				String p_image=multi.getParameter("p_image");
				//System.out.println(p_image);
				String imsiD=upload_Dir+p_image;
				//System.out.println(imsiD);
				File f = new File(imsiD);
				if(f.isFile()) {
					//System.out.println("여기는 들어오는거니");
					f.delete();
				}
				sql="UPDATE product SET p_code=?, p_name=?, p_price=?, p_stock=?, p_company=?, p_hide=?, p_comment=?, p_regdate2=?, p_image=? WHERE p_num=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("p_code"));
				pstmt.setString(2, multi.getParameter("p_name"));
				pstmt.setInt(3, Integer.parseInt(multi.getParameter("p_price")));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("p_stock")));
				pstmt.setString(5, multi.getParameter("p_company"));
				pstmt.setString(6, multi.getParameter("p_hide"));
				pstmt.setString(7, multi.getParameter("p_comment"));
				if(imsi!=null) {
					pstmt.setDate(8, Date.valueOf(imsi));
				}else {
					pstmt.setDate(8, null);
				}
				pstmt.setString(9, multi.getFilesystemName("p_image22"));
				pstmt.setString(10, multi.getParameter("p_num"));
				pstmt.executeUpdate();
				//System.out.println("어디가 문제일까??");
			}//end else
			
			
		}catch(Exception e) {
			System.out.println("modifyProduct() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		//System.out.println(str);
		return str;
	}//end modifyProduct() method;
	public void hideProduct(int p_num, String p_hide) {
		String sql = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConn();
			sql="UPDATE product SET p_hide=? WHERE p_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, p_hide);
			pstmt.setInt(2, p_num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("hideProduct() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}
	public void decreaseCnt(int p_num, int cart_quantity) {
		String sql=null;
		Connection conn=null;
		PreparedStatement pstmt =null;
		try {
			conn=getConn();
			sql="UPDATE product SET p_stock=p_stock-? WHERE p_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cart_quantity);
			pstmt.setInt(2, p_num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("decreaseCnt() 예외 : " + e);
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////
	//6. 전체 상품목록 수(user)
	public int getMainTotal(String keyField, String keyWord, String flag) {
		String sql=null;
		int total=0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn=getConn();
			stmt=conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				sql="SELECT COUNT(*) FROM product p join category c on(p.c_num=c.c_num) WHERE p.p_hide='y' and c.c_name='"+flag+"'";
			}else {
				sql="SELECT COUNT(*) FROM product p join category c on(p.c_num=c.c_num) WHERE p.p_hide='y' and c.c_name='"+flag+"' and "+ keyField + " LIKE '%" + keyWord + "%'";
			}
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				total=rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("getMainTotal() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return total;
	}
		
	//7. 상품목록리스트(user)**********************
	public List getMainGoodList(String keyField, String keyWord, int startRecord, String flag) {
		String sql=null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<ProductDTO> goodList = new ArrayList<ProductDTO>();
		
		try {
			conn = getConn();
			stmt = conn.createStatement();
			if(keyWord.equals(null)||keyWord.equals("")) {
				sql="SELECT * FROM product p join category c on(p.c_num=c.c_num) WHERE p.p_hide='y' and c.c_name='"+flag+"' ORDER BY p_num desc LIMIT " + startRecord + ", 15";
			}else {//keyword가 있다면				
				sql="SELECT * FROM product p join category c on(p.c_num=c.c_num) WHERE p.p_hide='y' and c.c_name='"+flag+"' and " + keyField + " LIKE '%" + keyWord + "%' ORDER BY p_num desc LIMIT " + startRecord + ", 15";
			}
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				/*
				 * dto.setPro_no(rs.getInt("pro_no")); dto.setCode(rs.getString("code"));
				 * dto.setName(rs.getString("name")); dto.setPrice(rs.getInt("price"));
				 * dto.setStock(rs.getInt("stock")); dto.setDetail(rs.getString("detail"));
				 * dto.setComp(rs.getString("comp")); //NOW(); 년월일 시분초, rs.getTimestamp()로 읽어온다.
				 * dto.setRegdate(rs.getTimestamp("regdate"));
				 * dto.setImage(rs.getString("image"));
				 */
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_stock(rs.getInt("p_stock"));
				dto.setP_comment(rs.getString("p_comment"));
				dto.setP_company(rs.getString("p_company"));
				dto.setP_image(rs.getString("p_image"));
				dto.setC_name(rs.getString("c_name"));
				dto.setP_regdate(rs.getDate("p_regdate"));
				dto.setP_regdate2(rs.getDate("p_regdate2"));
				dto.setP_hide(rs.getString("p_hide"));
				goodList.add(dto);				
			}//end while
		}catch(Exception e) {
			System.out.println("getMainGoodList() 예외 : " + e);
		}finally {
			try {
				if(rs!= null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				if(conn!= null) {conn.close();}
			}catch(SQLException e2) {}
		}
		return goodList;
	}//end getGoodList() method;
	
	
	
	//8. get product information(when users click an image or subject)
	public ProductDTO clickProduct(int p_num) {
		String sql = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO dto = null;
		
		try {
			conn = getConn();
			sql = "SELECT * FROM product WHERE p_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new ProductDTO();
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_code(rs.getString("p_code"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_comment(rs.getString("p_comment"));
				dto.setP_company(rs.getString("p_company"));
				dto.setP_image(rs.getString("p_image"));
			}
		}catch(Exception e) {
			System.out.println("clickProduct() 예외 : " + e);
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch(Exception e2) {}
		}
		return dto;
	}//end clickProduct() method;
}//end class
