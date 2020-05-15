<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
	<style>
		#container{
			width:400px;
			height:180px;
			border:1px solid #cccccc;
			margin:auto;
			margin-top:30px;
		}
		#loginTxt{
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
			width:400px;
			height:30px;
		}
		#idL, #pwdL{
			margin-left:80px;
			width:100px;
			height:30px;
			float:left;
			
		}
		#inputId, #inputPwd{
			
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
			return true;
		}
	</script>
</head>
<body>
	<div id="container">
	<form name="loginForm" action="loginPro.jsp" onsubmit="return check();">
		<div id="loginTxt">로그인</div>
		<div id="secondF"><div id="secondSub"><div id="idL">아이디</div><input id="inputId" type="text" placeholder="여기에 id 입력" size="20"></div></div>
		<div id="thirdF"><div id="secondSub"><div id="pwdL">패스워드</div><input id="inputPwd" type="password" placeholder="여기에 암호 입력" size="20"></div></div>
		<div id="buttonF"><input id="loginB" type="submit" value="로그인" ><div id="signIn" onclick="document.location='inputForm.jsp'">회원가입</div></div>
	</form>
	</div>
</body>
</html>