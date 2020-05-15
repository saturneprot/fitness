<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>insertNotice</title>
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
		
		.input {
			width:600px;
			height:100%;
			border:none;
		}
		#container{
			paddin-left:10px;
			margin:auto;
			margin-top:30px;
			width:800px;
			height:550px;
			border:1px solid #cccccc;
			align-content:center;			
		}
		#subTitle{
			width:800px;
			height:50px;
			margin:auto;
			margin-top:30px;
			font-weight:600;
			font-size:22px;
		}
		.rowR{
			width:800px;
			height:30px;
			border-bottom:1px solid #cccccc;
		}
		.rowRR{
			width:800px;
			height:400px;
			border-bottom:1px solid #cccccc;
		}
		.rowrow{
			float:left;
		}
		.conL{
			width:100px;
			height:30px;
			background:#f2f2f2;
			display:flex;
			align-items:center;
			padding-left:10px;
			font-weight:600;
		}
		.conL2{
			width:100px;
			height:400px;
			background:#f2f2f2;
			display:flex;
			align-items:center;
			padding-left:10px;
			font-weight:600;
		}
		.conR2{
			width:690px;
			height:400px;
		}
		#select{
			height:30px;
		}
		.message{
			margin-left:15px;
			color:red;
		}
		#submit{
			width:100px;
			height:30px;
			border:1px solid #808080;
			background:white;
			font-weight:600;
		}
		#back{
			width:100px;
			height:30px;
			border:1px solid #808080;
			background:white;
			font-weight:600;
		}
		.bottom{
			width:800px;
			height:40px;
			display:flex;
			align-items:center;
			justify-content:center;
		}
	</style>
	<script>
		function checkIt(){
			var imsi=document.pkc.bc_num;
			if(document.pkc.nb_subject.value==""){
				alert("글제목을 입력하세요");
				document.pkc.nb_subject.focus();
				return false;
			}
			if(!document.pkc.nb_content.value){
				alert("글내용을 입력하세요");
				document.pkc.nb_content.focus();
				return false;
			}
			if(imsi.options[imsi.selectedIndex].value==9){
				document.getElementsByClassName("message")[0].innerText="카테고리를 선택하세요";
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
	<div id="subTitle">*공지사항 작성</div>
	<div id="container">
	
	<!-- <div style="margin:auto; margin-botton:0px; width:460px; height:35px; color:red;">공지사항:2, FAQ:3</div> -->
	<form method="get" name="pkc" action="${ctxpath}/admin/insertNoticePro.do" onsubmit="return checkIt();">
		<!-- 
		<div class="icon">
			카테고리
			<img src="../img/user.png" width="90%" height="90%">
		</div>
		<select id="select" name="bc_num">
			<option value="9">선택</option>
			<option value="2">공지사항</option>
			<option value="3">FAQ</option>
		</select>
	</div>
	<div class="message"></div>
	
	<div class="outer">
		글 제목
		<div class="icon">
			글제목
			<img src="../img/user.png" width="90%" height="90%">
		</div>
		<input type="text" name="nb_subject" onblur="checkcheck(this,2)"
			class="input" placeholder="글제목 입력">
	</div>
	<div class="message"></div>
	<div style="margin:auto; margin-top:12px; width:460px; height:300px">
		<span>글내용</span><br>
		<textarea name="nb_content" rows="10" cols="50"></textarea>
	</div> -->
		<div class="rowR">
			<div class="rowrow conL">제목</div>
			<div class="rowrow conR"><input name="nb_subject" class="input" type="text"></div>
		</div>
		<div class="rowRR">
			<div class="rowrow conL2">글내용</div>
			<div class="rowrow conR2"><textarea name="nb_content" style="width:100%; height:100%; border:none;"></textarea></div>
		</div>
		<div class="rowR">
			<div class="rowrow conL">카테고리</div>
			<div class="rowrow conR">
				<select id="select" name="bc_num">
					<option value="9">선택</option>
					<option value="2">공지사항</option>
					<option value="3">FAQ</option>
				</select>
			</div>
		</div>
		<div class="message"></div>
		<div class="bottom">
			<input id="submit" type="submit" value="제출">&nbsp;<input id="back" type="button" value="나가기" onclick="javascript:history.back()">
		</div>
	</form>
	</div>
</body>
</html>