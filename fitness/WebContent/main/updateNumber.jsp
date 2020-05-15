<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- updateNumber.jsp --%>
<%
	String mid = request.getParameter("mid");
	String mnumber = request.getParameter("mnumber");
	MemberDAO dao = MemberDAO.getInstance();
	int check = dao.updateNumber(mid, mnumber);
%>
{
"check":<%= check %>
}