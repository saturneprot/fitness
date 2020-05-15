<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
	<style>
		#mainCart{
			margin:auto;
			margin-top:30px;
			width:800px;
			height:50px;
			position:relaive;
		}
		#logo{
			margin-left:0px;
			margin-top:0px;
			font-size:24px;
			font-weight:700;
			border-bottom:1px solid #cccccc;
			display:inline-block;
			position:relative;
			left:50px;
			cursor:pointer;
		}
		#logo0{color:#550002}
		#logo1{color:#d72f2d}
		#logo2{color:#e99730}
		#logo3{color:#94b940}
		#logo4{color:#4fa6dd}
		#aa{
			margin:auto;
			width:500px;
			height:350px;
			display:flex;
			align-items:center;
			justify-content:center;
			color:white;
			font-weight:bolder;
			/* border:1px solid black; */
		}
		
		
		.pk{
			margin-left:20px;
			height:100px;
			width:100px;
			border:1px solid #eeeeee;
			display:flex;
			align-items:center;
			justify-content:center;
			cursor:pointer;
		}
		#aa .pk:nth-child(1){
			background:#0066ff;
		}
		#aa .pk:nth-child(2){		
			background:#0033cc;
		}
		#aa .pk:nth-child(3){
			background:#000099;
		}
		#aa .pk:nth-child(4){
			background:red;
		}
		
		#cc{
			width:70px;
			height:20px;
			border:1px solid #eeeeee;
			background:red;
			color:white;
			margin-left:30px;
			display:inline-block;
			position:relative;
			left:300px;
			cursor:pointer;
		}
		#dd{
			font-size:24px;
			font-weight:700;
			margin-left:30px;
			display:inline-block;
			position:relative;
			left:160px;
		}
		#container{
			width:500px;
			height:600px;
			margin:auto;
			/* border:1px solid black; */
		}
	</style>
	
</head>
<body>
	<c:set var="sessionid" value="${sessionScope.admin}"/>
	<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
	<c:if test='${sessionid!="admin" }'>
		<c:redirect url="/admin/loginForm.jsp" context="${ctxpath}"/>
	</c:if>
	<div id="mainCart">
	<div id="logo"  onclick="document.location='${ctxpath}/admin/index.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	<div id="dd">관리자모드</div>
	<div id="cc" onclick="document.location='${ctxpath}/admin/logout.do'">로그아웃</div>
	</div>
	<div id="container">
	<%-- <div id="bb">		
		<span id="dd"><b>관리자 모드</b></span>
		<span id="cc" onclick="document.location='${ctxpath}/admin/logout.do'">로그아웃</span>
	</div> --%>
	<div id="aa">
		<%-- onclick="javascript:alert('hi')" --%>
		<div class="pk" onclick="document.location='${ctxpath}/admin/boardList.do?flag=members'">회원관리</div>
		<div class="pk" onclick="document.location='${ctxpath}/admin/productList.do'">상품관리</div>
		<div class="pk" onclick="document.location='${ctxpath}/admin/boardList.do?flag=mem'">게시판관리</div>
		<div class="pk" onclick="document.location='${ctxpath}/admin/boardList.do?flag=notice'">공지 관리</div>		
	</div>
	</div>
</body>
</html>