<%@page import="cart.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- getTotalCart --%>
<%
	String mid = request.getParameter("mid");
	CartDAO dao = CartDAO.getInstance();
	
	int total = 0;
	
	total=dao.getTotalCart(mid);
	
	//System.out.println(total);
%>
{
"total":<%= total %>
}