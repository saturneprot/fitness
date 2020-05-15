<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>authenticateEmail</title>
	<style>
		#mainCart{
			margin:auto;
			width:800px;
			height:50px;
		}
		#logo{
			margin-top:20px;
			font-size:36px;
			font-weight:700;
			border-bottom:1px solid #cccccc;
			padding-bottom:30px;
			cursor:pointer;
			z-index:1;
		}
		#logo0{color:#550002}
		#logo1{color:#d72f2d}
		#logo2{color:#e99730}
		#logo3{color:#94b940}
		#logo4{color:#4fa6dd}
		
		#contentR{
			margin:auto;
			margin-top:100px;
			width:800px;
			height:180px;
			border:1px solid #cccccc;
		}
		#informText{
			margin:auto;
			margin-top:10px;
			font-weight:600;
			width:300px;
			height:25px;
		}
		#key{
			margin:auto;
			margin-top:20px;
			width:300px;
			height:30px;
		}
		#submitF{
			margin:auto;
			margin-top:10px;
			width:300px;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#submitB{
			width:50px;
			border:1px solid #cccccc;
			border-radius:5px;
			background:white;
			color:#808080;
			font-weight:600;
		}
	</style>
	<script>
		function checkIt(){
			if(document.pkc.authenticationKey.value!=document.pkc.key.value){
				alert("인증번호가 일치하지 않습니다.");
				return false;
			}
			alert("축하합니다 가입이 완료되었습니다.");
			document.pkc.submit();
		}
	</script>
</head>
<body>
	<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
	<div id="mainCart">
	<div id="logo" onclick="document.location='${ctxpath}/main/main.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	</div>
	<div id="contentR">
	<form method="post" name="pkc" action="${ctxpath}/main/signInPro.do">
	
		<input name="mid" type="hidden" value="${mid}">
		<input name="mpwd" type="hidden" value="${mpwd}">
		<input name="mname" type="hidden" value="${mname}">
		<input name="mnumber" type="hidden" value="${mnumber}">
		<input name="memail" type="hidden" value="${memail}">
		<input name="authenticationKey" type="hidden" value="${authenticationKey}">
		<div id="informText">발송된 인증번호를 입력해주세요</div>
		<div id="key">인증번호 :&nbsp;<input name="key" type="text"></div>
		<div id="submitF"><input id="submitB" type="button" value="제출" onclick="checkIt();"></div>
	</form>
	</div>
</body>
</html>