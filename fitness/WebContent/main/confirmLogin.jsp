<%@page import="cart.CartDAO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- confirmLogin.jsp --%>
<%
	String id=request.getParameter("id");
	String pwd = request.getParameter("pwd");
	MemberDAO dao = MemberDAO.getInstance();
	int check=dao.confirmUser(id, pwd);
	//System.out.println("id : " + id + " pwd : " + pwd + " check : " + check);
	CartDAO dao2 = CartDAO.getInstance();
	int total=0;
	if(check==1){
		session.setAttribute("mid", id);
		total =dao2.getTotalCart(id);
		session.setAttribute("cartT", total);
	}
%>
{
"check":<%= check %>
}