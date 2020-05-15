<%@page import="cart.CartDAO"%>
<%@page import="cart.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	int p_num = Integer.parseInt(request.getParameter("p_num"));
	int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
	
	//System.out.println("p_num : " + p_num + " / mid : " + mid + " / cart_quantity : " + cart_quantity);
	////int check=1;
	CartDTO dto = new CartDTO();
	dto.setMid(mid);
	dto.setP_num(p_num);
	dto.setCart_quantity(cart_quantity);
	//System.out.println("mid : " + mid + "/ p_num : " + p_num + "/ cart_quantity : " + cart_quantity);
	CartDAO dao = CartDAO.getInstance();
	dao.insertProductIntoCart(dto);
	int check = dao.getTotalCart(mid);
%>
{
"check":<%= check %>
}