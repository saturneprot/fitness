<%@page import="cart.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- updateProductFromCart.jsp --%>
<%
	int cart_num = Integer.parseInt(request.getParameter("cart_num"));
	//int newQ = Integer.parseInt(request.getParameter("newQ"));
	String ud = request.getParameter("ud");
	//System.out.println("num : " + cart_num + " newQ : "+newQ);
	CartDAO dao = CartDAO.getInstance();
	int result=dao.updateProductFromCart(cart_num, ud);
%>
{
"check":<%=result %>
}
