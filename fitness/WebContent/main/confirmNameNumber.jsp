<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- confirmNameNumber.jsp --%>
<%
	String mname=request.getParameter("mname");
	String mnumber=request.getParameter("mnumber");
	MemberDAO dao = MemberDAO.getInstance();
	int check = dao.confirmNameNumber(mname, mnumber);
%>
{
"check":<%=check %>
}