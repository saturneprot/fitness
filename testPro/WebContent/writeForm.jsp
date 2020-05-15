<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm</title>
	<style>
		#container{
			margin:auto;
			width:500px;
			height:400px;
		}
		#headline{
			margin-top:20px;
			width:500px;
			height:25px;
			display:flex;
			align-items:center;
			justify-content:center;
			font-size:32px;
			font-weight:700;
		}
		#subContainer{
			margin:auto;
			margin-top:20px;
			width:480px;
			height:350px;
			border:1px solid black;
		}
		#sc-1st{
			float:right
		}
		#sc-2nd{
			clear:both;
			margin-left:10px;
			width:470px;
			height:30px;
		}
		#sc-3rd{
			margin-left:10px;
			width:470px;
			height:30px;
		}
		#sc-4th{
			margin-left:10px;
			width:470px;
			height:100px;
		}
		#sc-5th{
			margin-left:10px;
			margin-top:70px;
			width:470px;
			height:30px;
			margin-bottom:0px;
		}
		#sc-6th{
			margin-top:0px;
			width:470px;
			height:30px;
			display:flex;
			justify-content:center;
			align-items:center;
		}
		.label0{
			float:left;
		}
		#label1{
			width:20%;
		}
		#label2{
			width:80%;
		}
		.fi{
			margin-left:10px;
		}
	</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		function check(){
			if(!$("#writer").val()){
				alert("작성자를 입력하세요");
				$("#writer").focus();
				return false;
			}
			if(!$("#subject").val()){
				alert("글제목을 입력하세요");
				$("#subject").focus();
				return false;
			}
			if(!$("#email").val()){
				alert("이메일을 입력하세요");
				$("#email").focus();
				return false;
			}
			if(!$("#content").val()){
				alert("글내용을 입력하세요");
				$("#content").focus();
				return false;
			}
			if(!$("#passwd").val()){
				alert("암호를 입력하세요");
				$("#passwd").focus();
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
	<div id="container">
		<div id="headline">글쓰기</div>
		<div id="subContainer">
		<form name="pkc" action="writeFormPro.jsp" onsubmit="return check()">
			<div id="sc-1st"><a href="list.jsp">글목록</a></div>
			<div id="sc-2nd"><div id="label1" class="label0">이름</div><div id="label2" class="label0"><input id="writer" name="writer" type="text" placeholder="작성자 입력"></div></div>
			<div id="sc-3rd"><div id="label1" class="label0">글제목</div><div id="label2" class="label0"><input id="subject" name="subject" type="text" placeholder="글제목 입력" size="30"></div></div>
			<div id="sc-3rd"><div id="label1" class="label0">이메일</div><div id="label2" class="label0"><input id="email" name="email" type="text" placeholder="hhh@abc.com" size="30"></div></div>
			<div id="sc-4th"><div id="label1" class="label0">글내용</div><textarea id="content" name="content" rows="10" cols="50" placeholder="글내용 입력"></textarea></div>
			<div id="sc-5th"><div id="label1" class="label0">비밀번호</div><div id="label2" class="label0"><input id="passwd" name="passwd" type="password" placeholder="암호 입력(4~8자)" size="30"></div></div>
			<div id="sc-6th"><input class="fi" type="submit" value="글쓰기"><input class="fi" type="reset" value="다시쓰기"><button class="fi" onclick="document.location='list.jsp'">글목록</button></div>
		</form>
		</div>
	</div>
</body>
</html>