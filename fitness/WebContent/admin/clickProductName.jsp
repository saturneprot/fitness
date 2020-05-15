<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>clickProductName</title>
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
		
		#subT{
			margin:auto;
			margin-top:20px;
			width:800px;
			height:50px;
			font-size:20px;
			font-weight:600;
		}
		#mainFF{
			margin:auto;
			margin-top:10px;
			width:800px;
			height:600px;
			border:1px solid #cccccc;
		}
		.itemR{
			margin:auto;
			margin-top:0px;
			width:800px;
			height:40px;
			border-bottom:1px solid #cccccc; 
			
		}
		.itemR1{
			margin:auto;
			margin-top:0px;
			width:800px;
			height:60px;
			border-bottom:1px solid #cccccc; 
			
		}
		.contentR{
			float:left;
		}
		.conL1{
			width:100px;
			height:40px;
			font-weight:600;
			background:#f2f2f2;
			display:flex;
			align-items:center;
			padding-left:10px;
			/* border:1px solid black; */
		}
		.conL11{
			width:100px;
			height:60px;
			font-weight:600;
			background:#f2f2f2;
			display:flex;
			align-items:center;
			padding-left:10px;
			/* border:1px solid black; */
		}
		.conR1{
			width:240px;
			height:40px;
			display:flex;
			align-items:center;
			padding-left:10px;
			/* border:1px solid black; */
		}
		.conL2{
			width:100px;
			height:40px;
			font-weight:600;
			margin-left:5px;
			background:#f2f2f2;
			display:flex;
			align-items:center;
			padding-left:10px;
			/* border:1px solid black; */
		}
		.conR2{
			width:240px;
			height:40px;
			display:flex;
			align-items:center;
			padding-left:10px;
			/* border:1px solid black; */
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
	<div id="subT">*상품</div>
	<div id="mainFF">
		<div class="itemR">
			<div class="contentR conL1">상품번호</div>
			<div class="contentR conR1">${dto.p_num}</div>
			<div class="contentR conL2">상품코드</div>
			<div class="contentR conR2">${dto.p_code}</div>
		</div>
		
		<div class="itemR">
			<div class="contentR conL1">상품이름</div>
			<div class="contentR conR1">${dto.p_name}</div>
			<div class="contentR conL2">등록일</div>
			<div class="contentR conR2">${dto.p_regdate}</div>
		</div>
		
		<div class="itemR">
			<div class="contentR conL1">상품가격</div>
			<div class="contentR conR1"><fmt:formatNumber value="${dto.p_price}" pattern="#,###" />&nbsp;원</div>
			<div class="contentR conL2">상품수량</div>
			<div class="contentR conR2">${dto.p_stock}</div>
		</div>
		
		<div class="itemR">
			<div class="contentR conL1">제조사</div>
			<div class="contentR conR1">${dto.p_company}</div>
			<div class="contentR conL2">카테고리</div>
			<div class="contentR conR2">${dto.c_name}</div>
		</div>
		
		
		
		<div class="itemR1">
			<div class="contentR conL11">내용</div>
			<div style="margin-left:50px;">${dto.p_comment}</div>
		</div>
		<div style="margin-left:50px; margin-top:20px;">
			<img src="${ctxpath}/productImgs/${dto.p_image}" width="300px;" height="300px">
		</div>
	</div>
</body>
</html>