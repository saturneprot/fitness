<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>findPwdPro</title>
	<style>
		#resultPage{
			margin:auto;
			width:600px;
			height:1000px;
		}
		#logo{
			margin-top:10px;
			font-size:30px;
			font-weight:700;
			border-bottom:1px solid #cccccc;
			padding-bottom:10px;
			cursor:pointer;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#logo0{color:#550002}
		#logo1{color:#d72f2d}
		#logo2{color:#e99730}
		#logo3{color:#94b940}
		#logo4{color:#4fa6dd}
		#contentR{
			margin:auto;
			margin-top:20px;
			width:500px;
			height:500px;
			border:1px solid #cccccc;
		}
		#txt{
			margin-top:120px;
			display:flex;
			justify-content:center;
			align-items:center;
			font-size:24px;
			font-weight:600;
		}
		#infrom{
			margin:auto;
			margin-top:30px;
			width:500px;
			height:30px;
			display:flex;
			justify-content:center;
			align-items:center;
			font-weight:600;
		}
	</style>
</head>
<body>
	<c:set var="ctxpath" value="<%=request.getContextPath() %>"/>
	<div id="resultPage">	
	<div id="logo" onclick="document.location='${ctxpath}/main/main.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
		<div id="contentR">
			<div id="txt">비밀번호 찾기</div>
			<div id="infrom">임시 비밀번호를 이메일로 보내드렸습니다.</div>
		</div>
	</div>
</body>
</html>