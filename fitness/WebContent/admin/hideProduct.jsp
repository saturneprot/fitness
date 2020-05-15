<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- hideProduct.jsp --%>
<%
	request.setCharacterEncoding("utf-8");
	int p_num = Integer.parseInt(request.getParameter("p_num"));
	String p_hide = request.getParameter("newS");
	System.out.println("p_num : " + p_num + " p_hide : " + p_hide);
	ProductDAO dao = ProductDAO.getInstance();
	dao.hideProduct(p_num, p_hide);
%>