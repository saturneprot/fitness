<%@page import="java.util.ArrayList"%>
<%@page import="cart.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="cart.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- deleteProductFromCart --%>
<%
	//System.out.println("?????????????");
	int cart_num = Integer.parseInt(request.getParameter("cart_num"));

	String mid = request.getParameter("mid");
	CartDAO dao = CartDAO.getInstance();
	dao.deleteProductFromCart(cart_num);
	List<CartDTO> list = dao.getCartList(mid);
	System.out.println(list.size());
%>
{
"result":<%= 1 %>
}