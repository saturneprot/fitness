<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String sql="";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		out.clear();
		out=pageContext.pushBody();
		OutputStream output = response.getOutputStream();
		InputStream input = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/fitness";
			String id="root";
			String pass="1234";
			con=DriverManager.getConnection(url, id, pass);
			Statement stmt = con.createStatement();
			sql="select thumb from image where id=3";
			rs=stmt.executeQuery(sql);
			if(rs.next()){
				input=rs.getBinaryStream("thumb");
				int byteRead;
				while((byteRead=input.read())!=-1){
					output.write(byteRead);
				}
				input.close();
			}
		}catch(Exception e){
			out.println(e);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
				
			}catch(Exception e2){}
		}
		
		output.flush();
		output.close();
	%>
	
</body>
</html>