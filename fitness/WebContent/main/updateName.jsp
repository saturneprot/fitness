<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- updateName.jsp --%>
<%
	String mid = request.getParameter("mid");
	String mname = request.getParameter("mname");
	MemberDAO dao = MemberDAO.getInstance();
	int check = dao.updateName(mid, mname);
%>
{
"check":<%= check %>
}