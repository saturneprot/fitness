<%@page import="post.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- checkBoardPwd.jsp --%>
<%
	int b_num = Integer.parseInt(request.getParameter("b_num"));
	String b_pwd = request.getParameter("b_pwd");
	BoardDAO dao = BoardDAO.getInstance();
	System.out.println("b_num : " + b_num + "// b_pwd : " + b_pwd);
	int check=dao.checkBoardPwd(b_num, b_pwd);
%>
{
"check":<%= check %>
}