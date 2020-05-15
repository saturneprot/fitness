<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- updatePassword --%>
<%
	String mid = request.getParameter("mid");
	String curpwd = request.getParameter("curPwd");
	String newPwd = request.getParameter("newPwd");
	MemberDAO dao = MemberDAO.getInstance();
	int check=dao.updatePassword(mid, curpwd, newPwd);
	//session.invalidate();
%>
{
"check":<%= check %>
}