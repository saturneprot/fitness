<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNoticeForm</title>
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
			width:800px;
			height:40px;
			border-bottom:1px solid #cccccc;
			/* border:1px solid black; */
			
		}
		.itemRR{
			margin:auto;
			width:800px;
			height:400px;
			border-bottom:1px solid #cccccc;
			/* border:1px solid black; */
			
		}
		.contentR{
			float:left;
		}
		.conL{
			width:100px;
			height:40px;
			font-weight:600;
			display:flex;
			align-items:center;
			background:#f2f2f2;
			padding-left:10px;
			/* border:1px solid black; */
		}
		.conL2{
			width:100px;
			height:400px;
			font-weight:600;
			display:flex;
			align-items:center;
			background:#f2f2f2;
			padding-left:10px;
			/* border:1px solid black; */
		}
		.conR{
			width:285px;
			height:40px;
			
			/* border:1px solid black; */
		}
		.conR2{
			width:690px;
			height:400px;
			
			/* border:1px solid black; */
		}
		.input{
			border:none;
			height:40px;
		}
		.bottom{
			margin:auto;
			margin-top:10px;
			width:700px;
			height:30px;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#submit{
			width:100px;
			height:30px;
			font-weight:600;
			border:1px solid #808080;
			background:white;
			color:#808080;
			font-size:16px;
			cursor:pointer;
		}
		#back{
			margin-left:10px;
			width:100px;
			height:28px;
			border:1px solid #808080;
			background:white;
			display:flex;
			align-items:center;
			justify-content:center;
			font-size:16px;
			cursor:pointer;
		}
	</style>
	<script>
		function checkAll(){
			if(!document.pkc.nb_subject.value){
				alert("제목을 입력해주세요");
				document.pkc.nb_subject.focus();
				return false;
			}
			if(!document.pkc.nb_content.value){
				alert("내용을 입력해주세요");
				document.pkc.nb_content.focus();
				return false;
			}
			return true;
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
	<div id="subT">*게시글 수정</div>
	<form name="pkc" action="${ctxpath}/admin/modifyNoticePro.do" onsubmit="return checkAll();">
		<div id="mainFF">
			<div class="itemR">
				<div class="contentR conL">게시글번호</div>
				<div class="contentR conR"><input name="nb_num" class="input" type="text" value="${dto.nb_num}" readonly></div>
				<div class="contentR conL">카테고리</div>
				<div class="contentR conR"><input class="input" type="text" value="${dto.bc_num}" readonly></div>
			</div>
			
			<div class="itemR">
				<div class="contentR conL">ID</div>
				<div class="contentR conR"><input class="input" type="text" value="${dto.id}" readonly></div>
			</div>
			
			<div class="itemR">
				<div class="contentR conL">제목</div>
				<div class="contentR conR"><input name="nb_subject" class="input" type="text" value="${dto.nb_subject}"></div>
			</div>
			
			<div class="itemRR">
				<div class="contentR conL2">내용</div>
				<div class="contentR conR2">
					<textarea name="nb_content" style="width:100%; height:400px; border:none;">${dto.nb_content}</textarea>
				</div>
			</div>
			
			<div class="bottom"><input id="submit" type="submit" value="제출"><span id="back" onclick="javascript:history.back()">나가기</span></div>
			
		</div>
	</form>
</body>
</html>