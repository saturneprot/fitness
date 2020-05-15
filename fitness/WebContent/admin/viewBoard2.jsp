<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>viewBoard</title>
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
			margin-top:30px;
			width:800px;
			
		}
		#subText{
			float:left;
			font-size:24px;
			font-weight:600;
		}
		#rightPart{
			float:right;
		}
		.rightItems{
			float:right;
		}
		.rItem{
			width:80px;
			height:30px;
			display:flex;
			align-items:center;
			justify-content:center;
			border:1px solid #cccccc;
			background:#f2f2f2;
			font-weight:600;
			cursor:pointer;
		}
		#contentRR{
			clear:both;
			margin:auto;
			margin-top:100px;
			width:800px;
			height:695px;
			border:1px solid #cccccc;
		}
		.rowR{
			margin:auto;
			width:800px;
			height:30px;
			border-bottom:1px solid #cccccc;
		}
		.rowRR{
			margin:auto;
			width:800px;
			height:300px;
			border-bottom:1px solid #cccccc;
		}
		.rowrow{
			float:left;
		}
		.rowL1{
			width:100px;
			height:30px;
			font-weight:600;
			display:flex;
			align-items:center;
			background:#f2f2f2;
			padding-left:10px;
		}
		.rowL111{
			width:100px;
			height:30px;
			font-weight:600;
			display:flex;
			align-items:center;
			background:#f2f2f2;
			padding-left:10px;
		}
		.rowR1{
			width:200px;
			height:30px;
			display:flex;
			align-items:center;
		}
		.rowR11{
			width:300px;
			height:30px;
			display:flex;
			align-items:center;
		}
		.rowR111{
			width:90px;
			height:30px;
			display:flex;
			align-items:center;
		}
		.rowRT{
			width:520px;
			height:550px;
			border:1px solid #cccccc;	
		}
		.itemL1{
			font-weight:600;
			display:flex;
			align-items:center;
		}
		.largeI1{
			clear:both;
			width:100px;
			height:300px;
			display:flex;
			align-items:center;
			font-weight:600;
			padding-left:10px;
			background:#f2f2f2;
		}
		.largeI2{
			width:690px;
			height:300px;
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
	<div id="subTitle">
		<div id="subText"><c:if test="${dto.bc_num eq 1}">질문과답변</c:if></div>
		<div id="rightPart">
			<div class="rightItems rItem" onclick="document.location='${ctxpath}/admin/boardList.do?flag=mem'">목록보기</div>
			<div class="rightItems rItem" onclick="document.location='${ctxpath}/admin/modifyReply.do?b_num=${dto.b_num}'">수정하기</div>
		</div>
	</div>
	<div id="contentRR">
		<div class="rowR">
			<div class="rowrow rowL1">작성자</div>
			<div class="rowrow rowR11">${dto.mid}</div>
			<div class="rowrow rowL111">게시번호</div>
			<div class="rowrow rowR111">${dto.b_num}</div>
		</div>
		
		<div class="rowR">
			<div class="rowrow rowL1">카테고리</div>
			<div class="rowrow rowR11"><c:if test="${dto.bc_num eq 1}">질문과답변</c:if></div>
			<div class="rowrow rowL111">조회수</div>
			<div class="rowrow rowR111">${dto.b_count}</div>
		</div>
		<div class="rowR">
			<div class="rowrow rowL1">글제목</div>
			<div class="rowrow rowR11">${dto.b_subject}</div>
			<div class="rowrow rowL111">등록일</div>
			<div class="rowrow rowR111">${dto.b_date}</div>
		</div>
		
		<div class="rowRR">
			<div class="rowrow largeI1">글내용</div>
			<div class="rowrow largeI2"><textarea style="width:100%; height:300px; border:none;" readonly>${dto.b_content }</textarea></div>
		</div>
			
		<div class="rowRR">
			<div class="rowrow largeI1">답</div>
			<div class="rowrow largeI2"><textArea style="width:100%; height:300px; border:none;" readonly>${dto.b_re}</textArea></div>
		</div>
			
		
	</div>
</body>
</html>