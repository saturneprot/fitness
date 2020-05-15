<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- updateEmail.jsp --%>
<%
	String mid = request.getParameter("mid");
	String memail = request.getParameter("memail");
	MemberDAO dao = MemberDAO.getInstance();
	int check = dao.updateEmail(mid, memail);
%>
{
"check":<%= check %>
}