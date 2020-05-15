<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- checkPassword.jsp --%>
<%
	String mid = request.getParameter("mid");
	String mpwd = request.getParameter("mpwd");
	MemberDAO dao = MemberDAO.getInstance();
	int check = dao.signOut(mid, mpwd);
	if(check==1){
		System.out.println("HIHIHIHIHI");
		session.invalidate();
	}
%>
{
"check":<%= check %>
}