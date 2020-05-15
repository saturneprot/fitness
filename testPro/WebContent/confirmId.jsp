<%@page import="member.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- confirmId.jsp --%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	MemDAO dao = MemDAO.getInstance();
	int check=dao.confirmId(id);
%>
{
"check":<%= check %>
}