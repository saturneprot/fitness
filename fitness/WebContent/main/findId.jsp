<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>findId</title>
	<style>
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
		#contentR{
			margin:auto;
			margin-top:20px;
			width:500px;
			height:500px;
			border:1px solid #cccccc;
		}
		#txt{
			margin-top:20px;
			display:flex;
			justify-content:center;
			align-items:center;
			font-size:24px;
			font-weight:600;
		}
		.idR{
			margin:auto;
			margin-top:50px;
			width:300px;
			height:30px;
			font-weight:600;
		}
		.idR2{
			margin:auto;
			margin-top:10px;
			width:300px;
			height:30px;
			font-weight:600;
		}
		.idR3{
			margin:auto;
			margin-top:30px;
			width:300px;
			height:30px;
			
		}
		.idRR{
			margin:auto;
			margin-top:10px;
			width:300px;
			height:40px;
			/* border:1px solid black; */
		}
		#confirmR{
			
			width:300px;
			height:30px;
			border:1px solid #808080;
			background:#346aff;
			color:white;
			font-weight:600;
			cursor:pointer;
		}
		.message{
			width:300px;
			height:30px;
			margin:auto;
			font-size:12px;
			color:red;
		}
		.input{
			width:100%;
			height:100%;
		}
	</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		var mess=["이름을 입력해주세요", "전화번호를 입력해주세요"];
		function checkcheck(my,n){
			if(!my.value.trim()){
				document.getElementsByClassName("message")[n].innerText = mess[n];				
			}else{
				document.getElementsByClassName("message")[n].innerText="";
			}
		}
		function checkIt(){
			if(!document.pkc.mname.value){
				document.getElementsByClassName("message")[0].innerText="이름을 입력해주세요";
				document.pkc.mname.focus();
				return false;
			}
			if(!document.pkc.mnumber.value){
				document.getElementsByClassName("message")[1].innerText="전화번호를 입력해주세요";
				document.pkc.mnumber.focus();
				return false;
			}
			if(document.pkc.mname.value!="" && document.pkc.mnumber.value!=""){
				$.ajax({
					type:"POST",
					url:"confirmNameNumber.jsp",
					data:"mname="+$("#mname").val()+"&mnumber="+$("#mnumber").val(),
					dataType:'JSON',
					success:function(data){
						if(data.check==1){//유효한 아이디와 패스워드
							document.pkc.action="/fitness/main/findIdPro.do";
							document.pkc.submit();
						}else{//불허받음
							alert("존재하지 않는 유저입니다.");	
						}//end else
					}//end success
				});//end ajax
			}
		}
	</script>
	
</head>
<body>
	<c:set var="ctxpath" value="<%=request.getContextPath() %>"/>
	<div id="resultPage">	
	<div id="logo" onclick="document.location='${ctxpath}/main/main.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
		<div id="contentR">
			<form name="pkc" method="post">
			<div id="txt">아이디찾기</div>
			<div class="idR">이름</div>
			<div class="idRR"><input id="mname" class="input" onblur="checkcheck(this,0)" name="mname" type="text" placeholder="이름을 입력해주세요"></div>
			<div class="message"></div>
			<div class="idR2">전화번호</div>
			<div class="idRR"><input id="mnumber" class="input" onblur="checkcheck(this,1)" name="mnumber" type="text" placeholder="전화번호를 입력해주세요"></div>
			<div class="message"></div>
			<div class="idR3">
				<input id="confirmR" type="button" value="확인" onclick="checkIt();">
			</div>
			</form>
		</div>
	</div>
</body>
</html>