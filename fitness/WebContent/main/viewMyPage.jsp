<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>viewMyPage</title>
	<style>
		#mainCart{
			margin:auto;
			width:800px;
			height:1000px;
		}
		#logo{
			margin-left:0px;
			margin-top:30px;
			width:800px;
			height:50px;
			font-size:24px;
			font-weight:700;
			border-bottom:1px solid #cccccc;
			cursor:pointer;
			
		}
		#logo0{color:#550002}
		#logo1{color:#d72f2d}
		#logo2{color:#e99730}
		#logo3{color:#94b940}
		#logo4{color:#4fa6dd}
		#firstF{
			padding-top:15px;
			width:800px;
			height:50px;
		}
		.firstF-item{
			font-size:20px;
			font-weight:600;
			float:left;			
		}
		#modifyInfo{
			color:black;
			cursor:pointer;
		}
		#signOut{
			margin-left:30px;
			color:#cccccc;
			cursor:pointer;
		}
		#floor3Table{
			margin-top:10px;
			width:900px;
			height:300px;
			border-top:3px solid #808080;
		}
		.tableR{
			width:900px;
			height:85px;
			border-bottom:1px solid #cccccc;
		}
		.tableR-2{
			width:900px;
			height:205px;
			border-bottom:1px solid #cccccc;
		}
		.tableR-3{
			width:900px;
			height:85px;
			border-bottom:1px solid #cccccc;
		}
		.tableClass{
			display:inline-block;
			float:left;
		}
		#table1C{
			width:110px;
			height:85px;
			display:flex;
			align-items:center;
			justify-content:center;
			border-right:1px solid #cccccc;
			background:#eef1f8;
			font-weight:600;
		}
		#table1C-2{
			width:110px;
			height:205px;
			display:flex;
			align-items:center;
			justify-content:center;
			border-right:1px solid #cccccc;
			background:#eef1f8;
			font-weight:600;
		}
		#table2C{
			padding-left:15px;
			width:750px;
			height:85px;
			display:flex;
			align-items:center;
			font-size:16px;
			font-weight:600;
		}
		#table2C-3{
			padding-left:15px;
			width:750px;
			height:85px;
			/* display:flex;
			align-items:center; */
			font-size:16px;
			font-weight:600;
		}
		#table2C-1{
			padding-left:15px;
			width:750px;
			height:85px;
			display:flex;
			align-items:center;
			font-size:16px;
			font-weight:600;
		}
		#table2C-2{
			padding-left:15px;
			width:750px;
			height:205px;
			/* display:flex;
			align-items:center; */
			font-size:16px;
		}
		#formB{
			width:900px;
			height:50px;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#messageR{
			margin-left:10px;
			color:red;
			
		}
		#cancelB{
			margin-left:10px;
		}
		.pwdArea{
			clear:both;
			margin-top:30px;
		}
		.pwdLeft{
			float:left;
			width:130px;
			height:30px;
			font-size:14px;
		}
		.pwdRight{
			float:left;
			width:130px;
			height:30px;
		}
		#pwdMessage{
			/* border:1px solid black; */
			color:red;
			font-size:14px;
			width:250px;
		}
		#pwdButton{
			background:#eeeeee;
			border:1px solid #cccccc;
			cursor:pointer;
			display:flex;
			align-items:center;
			justify-content:center;
			width:100px;
			height:25px;
			font-size:14px;
			font-weight:600;
		}
		#nameButton{
			background:#eeeeee;
			border:1px solid #cccccc;
			cursor:pointer;
			display:flex;
			align-items:center;
			justify-content:center;
			width:200px;
			height:25px;
			font-size:14px;
			font-weight:600;
			margin-left:10px;
		}
		#numberButton{
			background:#eeeeee;
			border:1px solid #cccccc;
			cursor:pointer;
			display:flex;
			align-items:center;
			justify-content:center;
			width:100px;
			height:25px;
			font-size:14px;
			font-weight:600;
			margin-left:10px;
			
		}
		#emailButton{
			background:#eeeeee;
			border:1px solid #cccccc;
			cursor:pointer;
			display:flex;
			align-items:center;
			justify-content:center;
			width:100px;
			height:25px;
			font-size:14px;
			font-weight:600;
			margin-left:10px;
			
		}
		#nameAreaR{
			margin-top:20px;
			margin-left:15px;
			display:flex;
			justify-content:center;
			align-items:center;
		}
		#numberAreaR{
			margin-top:20px;
			margin-left:15px;
			width:500px;
			height:30px;
			display:flex;
			/* justify-content:center; */
			align-items:center;
		}
		#emailAreaR{
			margin-top:20px;
			margin-left:15px;
			width:500px;
			height:30px;
			display:flex;
			/* justify-content:center; */
			align-items:center;
		}
		#nameMessage{
			margin-top:5px;
			margin-left:135px;
			width:200px;
			height:20px;
			/* border:1px solid black; */
			color:red;
			font-size:14px;
		}
		#numberMessage{
			margin-top:5px;
			margin-left:135px;
			width:200px;
			height:20px;
			/* border:1px solid black; */
			color:red;
			font-size:14px;
		}
		#emailMessage{
			margin-top:5px;
			margin-left:135px;
			width:200px;
			height:20px;
			/* border:1px solid black; */
			color:red;
			font-size:14px;
		}
	</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		function checkPwd(){
			//var currentPwd = document.getElementById("mpwd").value;
			//alert($("#mpwd").val());
			if(!$("#mpwd").val()){
				//alert("HIHIHI");
				$("#pwdMessage").text("비밀번호를 입력하세요");
				$("#mpwd").focus();
				return false;
			}
			if(!$("#newPwd").val()){
				$("#pwdMessage").text("신규 비밀번호를 입력하세요");
				$("#newPwd").focus();
				return false;
			}
			if(!$("#checkPwd").val()){
				$("#pwdMessage").text("비밀번호 확인을 해주세요");
				$("#checkPwd").focus();
				return false;
			}
			if($("#newPwd").val() != $("#checkPwd").val()){
				$("#pwdMessage").text("신규 비밀번호가 일치하지 않습니다.");
				$("#newPwd").val();
				$("#checkPwd").val();
				return false;
			}
			if($("#mpwd").val() == $("#newPwd").val()){
				$("#pwdMessage").text("신규 비밀번호는 기존과 다르게 해야합니다.");
				return false;
			}
			if(($("#mpwd").val()!="") && ($("#newPwd").val()!="") && ($("#checkPwd").val()!="") && ($("#newPwd").val()==$("#checkPwd").val())){
				//alert("HIHI");
				$.ajax({
					type:"POST",
					url:"updatePassword.jsp",
					data:"mid="+$("#mid").val()+"&curPwd="+$("#mpwd").val()+"&newPwd="+$("#newPwd").val(),
					dataType:'JSON',
					success:function(data){
						if(data.check==1){
							$("#pwdMessage").text("비밀번호가 변경되었습니다.");
						}else if(data.check==-1){
							$("#pwdMessage").text("현재 비밀번호가 틀렸습니다.");
						}
					}//end success
				});//end ajax
			}
		}//end checkPwd() function;
		
		function checkName(){
			if(!$("#mname").val()){
				$("#nameMessage").text("이름을 입력해주세요");
				return false;
			}else{
				$.ajax({
					type:"POST",
					url:"updateName.jsp",
					data:"mid="+$("#mid").val()+"&mname="+$("#mname").val(),
					dataType:'JSON',
					success:function(data){
						if(data.check==1){
							$("#nameMessage").text("이름이 변경되었습니다.");
						}
					}//end success
				});//end ajax
			}
			
		}//end checkName() function;
		
		function checkNumber(){
			if(!$("#mnumber").val()){
				$("#numberMessage").text("이메일을 입력해주세요");
				return false;
			}else{
				$.ajax({
					type:"POST",
					url:"updateNumber.jsp",
					data:"mid="+$("#mid").val()+"&mnumber="+$("#mnumber").val(),
					dataType:'JSON',
					success:function(data){
						if(data.check==1){
							$("#numberMessage").text("연락처가 변경되었습니다.");
						}
					}//end success
				});//end ajax
			}
		}//end checkNumber() function;
		
		function checkEmail(){
			if(!$("#memail").val()){
				$("#emailMessage").text("이메일을 입력해주세요");
				return false;
			}else{
				$.ajax({
					type:"POST",
					url:"updateEmail.jsp",
					data:"mid="+$("#mid").val()+"&memail="+$("#memail").val(),
					dataType:'JSON',
					success:function(data){
						if(data.check==1){
							$("#emailMessage").text("이메일이 변경되었습니다.");
						}
					}//end success
				});//end ajax
			}
		}//end checkNumber() function;
	</script>
</head>
<body>
	<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
	<div id="mainCart">
	
	<div id="logo" onclick="document.location='${ctxpath}/main/main.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	<div id="firstF"><span class="firstF-item" id="modifyInfo">회원정보수정</span><span class="firstF-item" id="signOut" onclick="document.location='${ctxpath}/main/signOut.do?mid=${dto.mid}'">탈퇴</span></div>
	<div id="floor3Table">
			<form name="pkc">
				<div class="tableR"><div id="table1C" class="tableClass">아이디</div><div id="table2C-1" class="tableClass"><input id="mid" name="mid" type="text" value="${dto.mid}" readonly style="border:none;"></div></div>
				<div class="tableR-2">
					<div id="table1C-2" class="tableClass">비밀번호</div>
					<div id="table2C-2" class="tableClass">
						<div class="pwdArea"><div class="pwdLeft">현재 비밀번호</div><div class="pwdRight"><input id="mpwd" name="mpwd" type="password" size="20" style="border:1px solid #cccccc" ></div></div>
						<div class="pwdArea"><div class="pwdLeft">신규 비밀번호</div><div class="pwdRight"><input id="newPwd" name="mp" type="password" size="20" style="border:1px solid #cccccc"></div></div>
						<div class="pwdArea"><div class="pwdLeft">비밀번호 다시입력</div><div class="pwdRight"><input id="checkPwd" name="mpw" type="password" size="20" style="border:1px solid #cccccc"></div></div>
						<div class="pwdArea"><div class="pwdLeft"></div><div class="pwdRight" id="pwdMessage"></div></div>
						<div class="pwdArea"><div class="pwdLeft"></div><div class="pwdRight" id="pwdButton" onclick="checkPwd()">비밀번호변경</div></div>
					</div>
				</div>
				<div class="tableR-3">
					<div id="table1C" class="tableClass">이름</div>
					<div class="tableClass">
						<div id="nameAreaR"><input id="mname" name="mname" type="text" value="${dto.mname}" style="border:none;" size="12">
						<div id="nameButton" onclick="checkName()">개명하셨다면? 이름변경</div></div>
						<div id="nameMessage"></div>
					</div>
					
				</div>
				<div class="tableR-3">
					<div id="table1C" class="tableClass">연락처</div>
					<div class="tableClass">
						<div id="numberAreaR"><input id="mnumber" name="mnumber" type="text" value="${dto.mnumber}" style="border:none;" size="13">
						<div id="numberButton" onclick="checkNumber()">연락처 변경</div></div>
						<div id="numberMessage"></div>
					</div>
					
				</div>
				
				<div class="tableR-3">
					<div id="table1C" class="tableClass">이메일</div>
					<div class="tableClass">
						<div id="emailAreaR"><input id="memail" name="memail" type="text" value="${dto.memail}" style="border:none;" size="13">
						<div id="emailButton" onclick="checkEmail()">이메일 변경</div></div>
						<div id="emailMessage"></div>
					</div>
					
				</div>
				
				<div id="formB"><input id="cancelB" type="button" value="나가기" onclick="javascript:history.back()"></div>
			</form>
		</div>
	</div>
</body>
</html>