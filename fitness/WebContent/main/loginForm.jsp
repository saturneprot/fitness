<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxpath" value="<%=request.getContextPath()%>"/>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
	<style>
		#aa {
			margin:auto;
			margin-top:20px;
			width:500px;
			height:400px;
			border:3px solid #346aff;
			border-radius:5px;
			
		}
		#loginA{
			margin:auto;
			margin-top:50px;
			width:300px;
			height:300px;
		}
		#loginB{
			margin:auto;
			margin-top:0px;
			width:100px;
			height:50px;
			font-size:34px;
			font-weight:600;
		}
		#resultPage{
			margin:auto;
			width:600px;
			height:1000px;
		}
		#logo{
			margin-top:10px;
			font-size:30px;
			font-weight:700;
			border-bottom:1px solid #cccccc;
			padding-bottom:10px;
			cursor:pointer;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#logo0{color:#550002}
		#logo1{color:#d72f2d}
		#logo2{color:#e99730}
		#logo3{color:#94b940}
		#logo4{color:#4fa6dd}
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
		.message {
			color:red;
			font-size:12px;
			margin-top:8px;
		}
		.input {
			width:240px;
			height:30px;
			font-size:15px;
			border:none;
			float:right;
		}
		#last{
			margin-top:20px;
		}
		.btn{
			margin-top:10px;
			width:300px;
			height:30px;
			font-weight:600;
			border:1px solid #808080;
			background:white;
			cursor:pointer;
		}
		#bback{
			width:300px;
			height:30px;
			font-weight:600;
			border:1px solid #808080;
			background:white;
			cursor:pointer;
		}
		.realLast{
			margin:auto;
			margin-top:10px;
		}
		#findId{
			width:150px;
			height:30px;
			font-weight:600;
			border:1px solid #808080;
			background:white;
			cursor:pointer;
		}
		#findPwd{
			width:150px;
			height:30px;
			font-weight:600;
			border:1px solid #808080;
			background:white;
			cursor:pointer;
		}
		.btbt{
			float:left;
		}
	</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		var validLogin=0;
		var mess = ["아이디를", "비밀번호를 "];
		function checkcheck(my, n) {
			// 이름이 없으면 테두리 빨강, 아래쪽에 메세지를 출력
			if(my.value.trim()=="") {
				document.getElementsByClassName("outer")[n].style.borderColor = "red";
				document.getElementsByClassName("message")[n].innerText = mess[n]
						+ "입력하세요";
			}else{
				document.getElementsByClassName("outer")[n].style.borderColor="#aaaaaa";
				document.getElementsByClassName("message")[n].innerText = "";
			}//end else
		}//end check()------------------------
		
		function logIn(){
			
			if(document.getElementById("id").value.trim()==""){
				document.getElementsByClassName("outer")[0].style.borderColor="red";
				document.getElementsByClassName("message")[0].innerText="아이디를 입력하세요";
				document.getElementById("id").focus();
				return false;
			}
			if(document.getElementById("pwd").value.trim()==""){
				document.getElementsByClassName("outer")[1].style.borderColor="red";
				document.getElementsByClassName("message")[1].innerText="비밀번호를 입력해주세요";
				document.getElementById("pwd").focus();
				return false;
			}
			//alert("aaaaaa");
			if((document.getElementById("id").value.trim()!="")&&(document.getElementById("pwd").value.trim()!="")){
				//alert("bbbb");
				$.ajax({
					type:"POST",
					url:"confirmLogin.jsp",
					data:"id="+$("#id").val()+"&pwd="+$("#pwd").val(),
					dataType:'JSON',
					success:function(data){
						//alert("check:"+data.check);
						if(data.check==1){//유효한 아이디와 패스워드		
							//alert("유효한 아이디와 패스워드");
							validLogin=1;
							//return true;
							//세션 설정 하고
							//main 으로 가기 
							location.href="/fitness/main/main.do"
						}else{//불허받음
							//alert("불허받음");
							document.getElementsByClassName("outer")[0].style.borderColor="red";
							document.getElementsByClassName("outer")[1].style.borderColor="red";
							document.getElementsByClassName("message")[1].innerText="유효하지 않은 유저이거나, 비밀번호가 일치하지 않습니다.";
							validLogin=-1;
							//return false;
						}//end else
					}//end success
				});//end ajax
				
			}
			/* if(validLogin==-1){
				return false;
			}
			if(validLogin==1){
				document.pkc.submit();
			} */
			//document.pkc.submit();				
		}//end logIn() function;		
	</script>
</head>
<body>
	<div id="resultPage">	
	<div id="logo" onclick="document.location='${ctxpath}/main/main.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	
	<div id="aa">
	<div id="loginA">
	<!-- <div id="loginB"><span id="logo0">L</span><span id="logo1">O</span><span id="logo2">G</span><span id="logo3">I</span><span id="logo4">N</span></div> -->
	<div id="loginB">LOGIN</div>
		<form method="post" name="pkc">
			
			<div class="outer">
				<!-- 아이디 -->
				<div class="icon">
					<img src="../img/user.png" width="90%" height="90%">
				</div>
				<input id="id" type="text" name="mid" onblur="checkcheck(this,0)" 	class="input" placeholder="아이디">
			</div>
			<div class="message"></div>
			<div class="outer">
				<!-- 비밀번호 -->
				<div class="icon">
					<img src="../img/lock2.png" width="90%" height="90%">
				</div>
				<input id="pwd" type="password" name="mpwd" onblur="checkcheck(this,1)"	class="input" placeholder="비밀번호">
			</div>
			<div class="message"></div>
			
			<div id ="last">
				<input class="btn" type="button" value="로그인" onclick="return logIn()">
				<input class="btn" type="button" value="회원가입" onclick="document.location='${ctxpath}/main/signIn.do'">
				<!-- <input id="bback" type="button" value="돌아가기" onclick="javascript:history.back()"> -->
			</div>
			<div class="realLast">
				<input class="btbt" id="findId" type="button" value="아이디 찾기" onclick="document.location='${ctxpath}/main/findId.do'">
				<input class="btbt" id="findPwd" type="button" value="비밀번호 찾기" onclick="document.location='${ctxpath}/main/findPwd.do'">
			</div>
			
		</form>
	</div>
	</div>
	</div>
</body>
</html>