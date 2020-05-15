<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- confirmId.jsp --%>
<%
	String id=request.getParameter("id");
	MemberDAO dao = MemberDAO.getInstance();
	int check=dao.confirmId(id);//1= 서버로부터 허용 메시지를 받음, -1=서버로부터 중복메시지를 받음
	
%>
{
"check":<%=check%>
}