<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>adminLogin</title>
	<style>
		#aa {
			margin:auto;
			width:500px;
			height:400px;
			border:3px solid #346aff;
			border-radius:5px;
		}
		#bb{
			margin:auto;
			margin-top:50px;
			width:300px;
			height:300px;
		}
		#cc{
			color:red;
			font-weight:600;
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
			position:fixed;
			margin-top:20px;
		}
		#btn{
			width:300px;
			height:30px;
			border:1px solid #808080;
			background:white;
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
							location.href="/fitness/admin/index.do"
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
		}
	</script>
</head>
<body>
	<div id="aa">
	<div id="bb">
	<div id="cc">Were you not even an administrator, please get back !<br>This is only for administrator(성진)</div>
		<form name="pkc" >
			<div class="outer">
				<!-- 아이디 -->
				<div class="icon">
					<img src="../img/user.png" width="90%" height="90%">
				</div>
				<input id="id" type="text" name="id" onblur="checkcheck(this,0)" 	class="input" placeholder="아이디">
			</div>
			<div class="message"></div>
			<div class="outer">
				<!-- 비밀번호 -->
				<div class="icon">
					<img src="../img/lock2.png" width="90%" height="90%">
				</div>
				<input id="pwd" type="password" name="pwd" onblur="checkcheck(this,1)"	class="input" placeholder="비밀번호">
			</div>
			<div class="message"></div>
			
			<div id ="last">
			<input id="btn" type="button" value="로그인" onclick="return logIn()">	
			</div>
		</form>
	
	</div>
	</div>
</body>
</html>