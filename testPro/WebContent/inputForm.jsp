<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
	<style>
		#container{
			width:500px;
			height:200px;
			border:1px solid #cccccc;
			margin:auto;
			margin-top:30px;
		}
		#signTxt{
			margin-top:10px;
			width:100%;
			height:30px;
			font-size:24px;
			font-weight:600;
			display:flex;
			align-items:center;
			justify-content:center;
			margin-bottom:20px;
		}
		
		#secondF, #thirdF, #buttonF{
			width:100%;
			height:30px;
		}
		#secondSub{
			width:500px;
			height:30px;
		}
		#idL, #pwdL{
			margin-left:80px;
			width:100px;
			height:30px;
			float:left;
			
		}
		#inputId, #inputPwd, #inputName{
			
			float:left;
		}
		#loginB{
			width:100px;
			height:30px;
			border:1px solid #cccccc;
		}
		#signIn{
			width:100px;
			height:30px;
			border:1px solid #cccccc;
			margin-left:10px;
			display:flex;
			align-items:center;
			justify-content:center;
			background:#f2f2f2;
			font-size:13px;
		}
		#buttonF{
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#tryAgain{
			margin-left:10px;
			width:100px;
			height:30px;
			border:1px solid #cccccc;
		}
	</style>
	<script>
		function check(){
			if(!document.getElementById("inputId").value){
				alert("아이디를 입력하세요");
				document.getElementById("inputId").focus();
				return false;
			}
			if(!document.getElementById("inputPwd").value){
				alert("암호를 입력하세요");
				document.getElementById("inputPwd").focus();
				return false;
			}
			if(!document.getElementById("inputName").value){
				alert("이름을 입력하세요");
				document.getElementById("inputName").focus();
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
	<div id="container">
	<form name="pkc" action="inputPro.jsp" onsubmit="return check();">
		<div id="signTxt">회원가입</div>
		<div id="secondF"><div id="secondSub"><div id="idL">사용자ID</div><input id="inputId" name="id" type="text" placeholder="ID 입력 id" size="30"></div></div>
		<div id="thirdF"><div id="secondSub"><div id="pwdL">비밀번호</div><input id="inputPwd" name="passwd" type="password" placeholder="암호 입력 pwd" size="30"></div></div>
		<div id="fourthF"><div id="secondSub"><div id="pwdL">사용자이름</div><input id="inputName" name="name" type="text" placeholder="이름 입력 name" size="30"></div></div>
		<div id="buttonF"><input id="loginB" type="submit" value="회원가입" ><input id="tryAgain" type="reset" value="다시입력"><div id="signIn" onclick="javascript:history.back()'">가입안함</div></div>
	</form>
	</div>
</body>
</html>