<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>viewProducts</title>
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
		
		#cc{
			width:68px;
			height:20px;
			border:1px solid #eeeeee;
			background:red;
			color:white;
			margin-left:30px;
			display:inline-block;
			position:relative;
			left:300px;
			cursor:pointer;
			font-weight:600;
		}
		#dd{
			font-size:24px;
			font-weight:700;
			margin-left:30px;
			display:inline-block;
			position:relative;
			left:160px;
		}
		#subTitle{
			margin:auto;
			width:800px;
			paddin-left:50px;
			font-size:24px;
			font-weight:600;
		}
		#itemF{
			margin:auto;
			margin-top:30px;
			width:800px;
			height:100px;
			border:1px solid #cccccc;			
		}
		.item{
			float:left;
		}
		#item-imageR{
			width:100px;
			height:100px;
		}
		#item-subjectR{
			margin-left:15px;
			width:380px;
			height:100px;
			display:flex;
			align-items:center;
			font-size:15px;
			font-weight:600;
		}
		#item-quantityR{
			margin-left:15px;
			width:70px;
			height:100px;
			display:flex;
			align-items:center;
			justify-content:center;
			font-size:15px;
			font-weight:600;
		}
		#item-priceR{
			margin-left:15px;
			width:70px;
			height:100px;
			display:flex;
			align-items:center;
			justify-content:center;
			font-size:15px;
			font-weight:600;
			color:#ae0000;
		}
	</style>
</head>
<body>
	<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
	<div id="mainCart">
	<div id="logo"  onclick="document.location='${ctxpath}/admin/index.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	<div id="dd">관리자모드</div>
	<div id="cc" onclick="document.location='${ctxpath}/admin/logout.do'">로그아웃</div>
	</div>
	<div id="subTitle">주문이력보기 / 주문번호 : ${order_num}</div>
	
	<c:forEach var="dto" items="${list}">
		<div id="itemF"><div id="item-imageR" class="item"><img src="${ctxpath}/productImgs/${dto.p_image}" width="100%" height="100%"></div><div id="item-subjectR" class="item">${dto.p_name}</div><div id="item-quantityR" class="item">${dto.order_quantity}개</div><div id="item-priceR" class="item"><fmt:formatNumber value="${dto.p_price}" pattern="#,###" />원</div></div>
	</c:forEach>
</body>
</html>