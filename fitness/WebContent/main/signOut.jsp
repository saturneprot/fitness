<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
<html>
<head>
<meta charset="UTF-8">
<title>signOut</title>
	<style>
		#mainCart{
			margin:auto;
			width:800px;
			height:100px;
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
			color:#cccccc;
			cursor:pointer;
		}
		#signOut{
			margin-left:30px;
			cursor:pointer;
		}
		#mainF{
			margin:auto;
			margin-top:30px;
			width:800px;
			height:150px;
			border:1px solid #eeeeee;
			background:#e9f4fa;
		}
		#informText{
			margin-top:15px;
			margin-left:15px;
			color:#757777;
			font-weight:600;
			font-size:14px;
		}
		#contentF{
			margin-top:15px;
			margin-left:15px;
			width:770px;
			height:50px;
			/* border:1px solid black; */
			display:flex;
			align-items:center;
			font-size:12px;
		}
		#fButton{
			border:1px solid #eeeeee;
			display:flex;
			justify-content:center;
			align-items:center;
			background:#19a8f1;
			color:white;
			width:60px;
			height:20px;
			font-weight:600;
			cursor:pointer;
		}
	</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		function checkIt(){
			if(!$("#mpwd").val()){
				alert("비밀번호를 입력해주세요");
				$("#mpwd").focus();
				return false;
			}else{
				$.ajax({
					type:"POST",
					url:"checkPassword.jsp",
					data:"mid="+$("#mid").val()+"&mpwd="+$("#mpwd").val(),
					dataType:'JSON',
					success:function(data){
						if(data.check==1){
							document.location='/fitness/main/main.do';
						}else if(data.check==-1){
							alert("비밀번호가 일치하지 않습니다.");
						}
					}//end success
				});//end ajax
			}
		}//end checkIt() function;
	</script>
</head>
<body>
	<div id="mainCart">
	
	<div id="logo" onclick="document.location='${ctxpath}/main/main.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	<div id="firstF"><span class="firstF-item" id="modifyInfo" onclick="document.location='${ctxpath}/main/viewMyPage.do?mid=${dto.mid}'">회원정보수정</span><span class="firstF-item" id="signOut" onclick="document.location='${ctxpath}/main/signOut.do?mid=${dto.mid}'">탈퇴</span></div>
	</div>
	<div id="mainF">
		<form>
			<div id="informText">보안을 위해 회원님의 이름과 계정 이메일 및 비밀번호를 확인합니다.</div>
			<div id="contentF"><div>이름 :&nbsp;</div><input id="mname" type="text" value="${dto.mname}" size="15" readonly><div>&nbsp;&nbsp;ID :&nbsp;</div><input id="mid" type="text" value="${dto.mid}" size="20" readonly><div>&nbsp;&nbsp;비밀번호 :&nbsp;</div><input type="password" id="mpwd" size="15">&nbsp;&nbsp;<div id="fButton" onclick="checkIt()">본인확인</div></div>
		</form>
	</div>
</body>
</html>