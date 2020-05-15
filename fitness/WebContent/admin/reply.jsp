<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>reply</title>
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
			margin-bottom:30px;
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
			margin-top:40px;
			width:800px;
			height:800px;
			border:1px solid #cccccc;
		}
		.rowR{
			margin:auto;
			width:800px;
			height:30px;
			border-bottom:1px solid #cccccc;
			/* border:1px solid #cccccc; */
		}
		.rowRR{
			margin:auto;
			width:800px;
			height:300px;
			border-bottom:1px solid #cccccc;
			/* border:1px solid #cccccc; */
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
			height:300px;
			font-weight:600;
			display:flex;
			align-items:center;
			background:#f2f2f2;
			padding-left:10px;
		}
		
		.rowR11{
			width:290px;
			height:30px;
			display:flex;
			align-items:center;
		}
		.rowR111{
			width:690px;
			height:300px;
			display:flex;
			align-items:center;
		}
		.rowRT{
			width:520px;
			height:550px;
			border:1px solid #cccccc;	
		}
		.rowBottom{
			margin:auto;
			margin-top:20px;
			width:800px;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#submitB{
			width:100px;
			height:30px;
			background:white;
			border:1px solid #cccccc;
			border-radius:5px;
			font-weight:600;
		}
		#backB{
			width:100px;
			height:30px;
			background:white;
			border:1px solid #cccccc;
			border-radius:5px;
			font-weight:600;
			margin-left:10px;
		}
	</style>
	<script>
		function checkRe(){
			if(!document.pkc.b_re.value){
				alert("답글을 작성하셔야 합니다");
				document.pkc.b_re.focus();
				return false;
			}
			document.pkc.action="/fitness/admin/replyPro.do";
			document.pkc.submit();
		}
	</script>
</head>
<body>
	<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
	<div id="mainCart">
	<div id="logo"  onclick="document.location='${ctxpath}/admin/index.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	<div id="dd">관리자모드</div>
	<div id="cc" onclick="document.location='${ctxpath}/admin/logout.do'">로그아웃</div>
	</div>
	<div id="subTitle"><span id="subText">*답글달기</span></div>
	<div id="contentRR">
	<form name="pkc">
		<div class="rowR">
			<div class="rowrow rowL1">글제목</div>
			<div class="rowrow rowR11">${dto.b_subject}</div>
			<div class="rowrow rowL1">작성일</div>
			<div class="rowrow rowR11">${dto.b_date}</div>
		</div>
		<div class="rowR">
			<div class="rowrow rowL1">작성자</div>
			<div class="rowrow rowR11">${dto.mid}</div>
			<div class="rowrow rowL1">게시번호</div>
			<div class="rowrow rowR11">${dto.b_num}</div>
		</div>
		<div class="rowRR">
			<div class="rowrow rowL111">글내용</div>
			<div class="rowrow rowR111">
				<textarea name="b_content" style="width:100%; height:300px; border:none;" readonly>${dto.b_content}</textarea>
			</div>
		</div>
		
		<div class="rowRR">
			<div class="rowrow rowL111">답하기</div>
			<div class="rowrow rowR111">
				<textarea name="b_re" style="width:100%; height:300px; border:none;" ></textarea>
			</div>
		</div>
		
		<input type="hidden" name="b_num" value="${dto.b_num}">
		<input type="hidden" name="bc_num" value="${dto.bc_num }">
		<input type="hidden" name="b_subject" value="${dto.b_subject}">
		<input type="hidden" name="mid" value="${dto.mid}">
		<div class="rowBottom">
			<input id="submitB" type="button" value="제출" onclick="checkRe()"><input id="backB" type="button" value="나가기" onclick="javascript:history.back()">
		</div>
	</form>
	</div>
</body>
</html>