<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inputPro</title>
	<style>
		#complete{
			margin:auto;
			margin-top:50px;
			width:500px;
			height:50px;
			display:flex;
			align-items:center;
			justify-content:center;
			font-size:24px;
			font-weight:700;
		}
	</style>
</head>
<body>
	<jsp:useBean id="dto" class="member.MemberDTO">
		<jsp:setProperty name="dto" property="*"/>
	</jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		MemberDAO dao = new MemberDAO();
		dao.signIn(dto);
	%>
	<div id="complete">축하합니다 가입이 완료되었습니다.</div>
</body>
</html>