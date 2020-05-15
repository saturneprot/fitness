<%@page import="order.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- changeStatus.jsp --%>
<%
	request.setCharacterEncoding("utf-8");
	String order_num = request.getParameter("order_num");
	String newS = request.getParameter("newS");
	//System.out.println("order_num : " + order_num + " / newS : " + newS);
	OrderDAO dao = OrderDAO.getInstance();
	dao.changeStatus(order_num, newS);
%>