<%@page import="adminmember.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- confirmLogin.jsp --%>
<%
	String id=request.getParameter("id");
	String pwd = request.getParameter("pwd");
	LoginDAO dao = LoginDAO.getInstance();
	int check=dao.confirmUser(id, pwd);
	if(check==1){
		session.setAttribute("admin", id);
	}
%>
{
"check":<%= check %>
}