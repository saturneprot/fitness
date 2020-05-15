<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>signIn.jsp</title>
	<style>
		#loginForm{
			margin:auto;
			width:500px;
			height:450px;
			border:3px solid #aaaaaa;
			border-radius:15px;
			display:flex;
			justify-content:center;
			align-items:center;
		}
.outer {
	width:300px;
	height:35px;
	border:1px solid #aaaaaa;
	margin-top:12px;
}

.icon {
	width:35px;
	height:35px;
	float:left;
	display:flex;
	align-items:center;
	justify-content:center;
	background:#eeeeee;
	border-right:1px solid #aaaaaa;
}

.input {
	width:240px;
	height:30px;
	font-size:15px;
	border:none;
	float:right;
}
#last{
	display:flex;
	justify-content:center;
	align-items:center;
}
#btn {
	width:100px;
	height:35px;
	margin-top:20px;
	background:#0074e9;
	border:1px solid #0074e9;
	color:white;
	font-weight:900;
	display:flex;
	align-items:center;
	justify-content:center;
}

#bback {
	width:100px;
	height:35px;
	margin-top:20px;
	margin-left:20px;
	background:#0074e9;
	border:1px solid #0074e9;
	color:white;
	font-weight:900;
	display:flex;
	align-items:center;
	justify-content:center;
}

.message {
	color:red;
	font-size:12px;
	margin-top:8px;
}
</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<script>
		// coupang_ex.html
		var mess = ["아이디를", "비밀번호를 ", "비밀번호가 일치하지 않습니다.", "이름을 ", "휴대폰 번호를", "이메일 주소를" ];
		var checkOverlap=0;
		function confirmId(n){
			if(document.getElementById("id").value==""){
				document.getElementsByClassName("outer")[n].style.borderColor="red";
				document.getElementsByClassName("message")[n].innerText=mess[n]+"입력하세요";
			}else{
				$.ajax({
					type:"POST",
					url:"confirmId.jsp",
					data:"id="+$("#id").val(),
					dataType:'JSON',
					success:function(data){
						if(data.check==1){//허가 받은 아이디
							document.getElementsByClassName("outer")[n].style.borderColor="#aaaaaa";
							document.getElementsByClassName("message")[n].innerText="";
							checkOverlap=1;
							$("#pwd").focus();
						}else{//불허받음
							document.getElementsByClassName("outer")[n].style.borderColor="red";
							document.getElementsByClassName("message")[n].innerText="사용중인 아이디입니다.";
							checkOverlap=-1;
						}//end else
					}//end success
				});//end ajax		
			}//end else
		}//end confirmId() function;
		function checkIt(my, n) {
			// 이름이 없으면 테두리 빨강, 아래쪽에 메세지를 출력
			if (my.value.trim() == "") {
				document.getElementsByClassName("outer")[n].style.borderColor = "red";
				document.getElementsByClassName("message")[n].innerText = mess[n]
						+ "입력하세요";
			} else {
				document.getElementsByClassName("outer")[n].style.borderColor="#aaaaaa";
				document.getElementsByClassName("message")[n].innerText = "";
			}//end else
		}//end check()
		function check2(my) {
			var pwd1 = document.getElementsByClassName("input")[1].value;//비밀번호 입력칸
			var pwd2 = my.value//비밀번호 확인칸
			if (pwd1 != pwd2 || pwd1.length == 0) {
				document.getElementsByClassName("outer")[1].style.borderColor = "red";
				document.getElementsByClassName("outer")[2].style.borderColor = "red";
				document.getElementsByClassName("message")[2].innerText = mess[2];
			} else {
				document.getElementsByClassName("outer")[1].style.borderColor = "#aaaaaa";
				document.getElementsByClassName("outer")[2].style.borderColor = "#aaaaaa";
				document.getElementsByClassName("message")[2].innerText = "";
			}//end else
		}//end check2() function
		function submitSign(){
			if(document.getElementById("id").value==""){
				//console.log("HI");
				document.getElementsByClassName("outer")[0].style.borderColor="red";
				document.getElementsByClassName("message")[0].innerText=mess[0]+"입력하세요";			
				return false;
			}
			
			if(document.getElementById("pwd").value==""){
				document.getElementsByClassName("outer")[1].style.borderColor="red";
				document.getElementsByClassName("message")[1].innerText=mess[1]+"입력하세요";			
				return false;
			}
			if(document.getElementById("pwdc").value==""){
				document.getElementsByClassName("outer")[2].style.borderColor="red";
				document.getElementsByClassName("message")[2].innerText=mess[2]+"입력하세요";			
				return false;
			}
			if(document.getElementById("name").value==""){
				document.getElementsByClassName("outer")[3].style.borderColor="red";
				document.getElementsByClassName("message")[3].innerText=mess[3]+"입력하세요";			
				return false;
			}
			if(document.getElementById("pn").value==""){
				document.getElementsByClassName("outer")[4].style.borderColor="red";
				document.getElementsByClassName("message")[4].innerText=mess[4]+"입력하세요";			
				return false;
			}
			if(document.getElementById("mail").value==""){
				document.getElementsByClassName("outer")[5].style.borderColor="red";
				document.getElementsByClassName("message")[5].innerText=mess[4]+"입력하세요";			
				return false;
			}
			if(checkOverlap!=1){
				document.getElementsByClassName("outer")[0].style.borderColor="red";
				document.getElementsByClassName("message")[0].innerText="중복되는 아이디입니다!";
				
				return false;
			}
			
			document.pkc.submit();
			
			//document.pkc.submit();
		}//end submitSign() function;
	</script>
</head>
<body>
	<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
	<div id="loginForm">
	<form method="post" name="pkc" action="${ctxpath}/main/authenticateEmail.do">	
		<div class="outer">
			<!-- 아이디 -->
			<div class="icon"><img src="../img/user.png" width="90%" height="90%"></div>
			<input id="id" type="text" name="mid" onblur="confirmId(0)" class="input"
				placeholder="아이디">
		</div>
		<div class="message"></div>
		<div class="outer">
			<!-- 비밀번호 -->
			<div class="icon"><img src="../img/lock2.png" width="90%" height="90%"></div>
			<input id="pwd" type="password" name="mpwd" onblur="checkIt(this,1)" class="input"
				placeholder="비밀번호">
		</div>
		<div class="message"></div>
		<div class="outer">
			<!-- 비밀번호 확인 -->
			<div class="icon"><img src="../img/lock.png" width="90%" height="90%"></div>
			<input id="pwdc" type="password" onblur="check2(this)" class="input"
				placeholder="비밀번호 확인">
		</div>
		<div class="message"></div>
		<div class="outer">
			<!-- 이름 -->
			<div class="icon"><img src="../img/name.png" width="90%" height="90%"></div>
			<input id="name" type="text" name="mname" onblur="checkIt(this,3)" class="input"
				placeholder="이름">
		</div>
		<div class="message"></div>
		<div class="outer">
			<!-- 휴대폰 번호 -->
			<div class="icon"><img src="../img/phone.png" width="90%" height="90%"></div>
			<input id="pn" type="text" name="mnumber" onblur="checkIt(this,4)" class="input"
				placeholder="휴대폰 번호">
		</div>
		<div class="message"></div>
		
		<div class="outer">
			<!-- 이메일 -->
			<div class="icon"><img src="../img/mail.png" width="90%" height="90%"></div>
			<input id="mail" type="email" name="memail" onblur="checkIt(this,5)" class="input"
				placeholder="이메일 주소">
		</div>
		<div class="message"></div>
		<!-- <div id="btn">동의하고 가입하기</div> -->
		<div id ="last">
		<input id="btn" type="button" value="다음" onclick="submitSign()">	<input id="bback" type="button" value="돌아가기" onclick="javascript:history.back()">
		</div>
	</form>
	</div>
</body>
</html>