<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>ui</title>
	<style>
		#main{
			width:800px;
			height:600px;
			margin:auto;
			margin-top:20px;
			/* border-bottom:1px solid #cccccc; */
		}
		.floor{
			clear:both;
			width:800px;
			height:30px;
			border-bottom:1px solid #cccccc;
		}
		.floorT{
			clear:both;
			width:800px;
			height:30px;
			display:flex;
			align-items:center;
			justify-content:center;
			font-weight:700;
			font-size:26px;
			/* border-bottom:1px solid #cccccc; */
		}
		.floorL{
			clear:both;
			
			width:800px;
			height:30px;
			display:flex;
			align-items:center;
			justify-content:center;
			font-weight:700;
			font-size:26px;
			margin-top:15px;
			/* border-bottom:1px solid #cccccc; */
		}
		.floorS{
			font-weight:600;
			background:#f2f2f2;
		}
		.floor2{
			clear:both;
			width:800px;
			height:60px;
			border-bottom:1px solid #cccccc;
		}
		.float-left{
			float:left;
		}
		.itemI{
			width:100px;
			height:30px;
			font-weight:600;
			padding-left:10px;
			display:flex;
			align-items:center;
		}
		.item1{
			width:110px;
			height:30px;
			/* border:1px solid #cccccc; */
			font-weight:600;
			padding-left:10px;
			display:flex;
			align-items:center;
		}
		.item11{
			width:110px;
			height:60px;
			/* border:1px solid #cccccc; */
			font-weight:600;
			padding-left:10px;
			display:flex;
			align-items:center;
		}
		.item2{
			width:355px;
			height:30px;
			/* border:1px solid #cccccc; */
		}
		.item3{
			width:120px;
			height:30px;
		}
		.input{
			width:350px;
			height:30px;
			border:1px solid #cccccc;
		}
		.input2{
			width:100px;
			height:30px;
			border:1px solid #cccccc;
		}
		.button{
			width:100px;
			height:30px;
			background:white;
			border:1px solid #808080;
			font-weight:600;
		}
		.button2{
			width:100px;
			height:30px;
			background:white;
			border:1px solid #808080;
			margin-left:10px;
			font-weight:600;
		}
		#prefix{
			width:50px;
			height:30px;
		}
	</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		//var prefix = document.getElementById("prefix");
		var chk=0;
		function checkAll(){
			var prefix = document.pkc.prefix22;
			if(!document.pkc.id.value){
				alert("ID를 입력하시오");
				document.pkc.id.focus();
				return false;
			}
			if(!document.pkc.pwd1.value){
				alert("pwd1을 입력하시오");
				document.pkc.pwd1.focus();
				return false;
			}
			if(!document.pkc.pwd2.value){
				alert("pwd2를 입력하시오");
				document.pkc.pwd2.focus();
				return false;
			}
			if(document.pkc.pwd1.value!=document.pkc.pwd2.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.pkc.pwd1.value="";
				document.pkc.pwd2.value="";
				document.pkc.pwd1.focus();
				return false;
			}
			if(!document.pkc.name.value){
				alert("이름을 입력하시오");
				document.pkc.name.focus();
				return false;
			}
			if(!document.pkc.birth.value){
				alert("생년월일을 입력하시오");
				document.pkc.birth.focus();
				return false;
			}
			if(!document.pkc.email.value){
				alert("email을 입력하시오");
				document.pkc.email.focus();
				return false;
			}
			if(!document.pkc.post.value){
				alert("우편번호를 입력하시오");
				document.pkc.post.focus();
				return false;
			}
			if(!document.pkc.addr1.value){
				alert("주소1을 입력하시오");
				document.pkc.addr1.focus();
				return false;
			}
			if(!document.pkc.addr2.value){
				alert("주소2를 입력하시오");
				document.pkc.addr2.focus();
				return false;
			}
			if(prefix.options[prefix.selectedIndex].value==999){
				alert("전화번호 앞자리를 선택해주세요");
				return false;
			}
			if(!document.pkc.ph1.value){
				alert("전화번호1을 입력해주세요");
				document.pkc.ph1.focus();
				return false;
			}
			if(!document.pkc.ph2.value){
				alert("전화번호2를 입력해주세요");
				document.pkc.ph2.focus();
				return false;
			}
			if(chk==0){
				alert("ID중복확인을 해주세요");
				return false;
			}
			if(chk==-1){
				alert("중복되는 ID입니다.");
				return false;
			}
			document.pkc.action="main.jsp";
			document.pkc.submit();
			
		}//end checkAll() function;
		function checkId(){
			$.ajax({
				type:"POST",
				url:"confirmId.jsp",
				data:"id="+$("#id").val(),
				dataType:'JSON',
				success:function(data){
					if(data.check==1){//허가 받은 아이디
						alert("사용가능한 ID입니다.");
						chk=1;
					}else{//불허받음
						alert("중복되는 ID입니다.");
						chk=-1;
					}//end else
				}//end success
			});//end ajax	
		}
		function changedId(){
			chk=0;
		}
	</script>
</head>
<body>
	<form name="pkc" method="post">
	<div id="main">
		<div class="floor floorT">
			회원가입
		</div>
		<div class="floor floorS">
			<div class="itemI">아이디</div>
		</div>
		<div class="floor">
			<div class="float-left item1">사용자ID</div>
			<div class="float-left item2"><input id="id" name="id" class="input" type="text" size="12" placeholder="id" onchange="changedId()"></div>
			<div class="float-left item3"><input class="button" type="button" value="ID 중복체크" onclick="checkId()"></div>
		</div>
		<div class="floor">
			<div class="float-left item1">비밀번호</div>
			<div class="float-left item2"><input name="pwd1" class="input" type="password" size="12" placeholder="passwd1"></div>
		</div>
		<div class="floor">
			<div class="float-left item1">비밀번호 확인</div>
			<div class="float-left item2"><input name="pwd2" class="input" type="password" size="12" placeholder="passwd2"></div>
		</div>
		<div class="floor floorS">
			<div class="itemI">개인정보입력</div>
		</div>
		<div class="floor">
			<div class="float-left item1">사용자이름</div>
			<div class="float-left item2"><input name="name" class="input" type="text" placeholder="name"></div>
		</div>
		<div class="floor">
			<div class="float-left item1">생년월일</div>
			<div class="float-left item2"><input name="birth" class="input" type="text" placeholder="birth"></div>
		</div>
		<div class="floor">
			<div class="float-left item1">이메일</div>
			<div class="float-left item2"><input name="email" class="input" type="email" placeholder="email"></div>
		</div>
		<div class="floor">
			<div class="float-left item1">우편번호</div>
			<div class="float-left item2"><input name="post" class="input" type="text" placeholder="zipcode"></div>
			<div class="float-left item3"><input class="button" type="button" value="주소검색"></div>
		</div>
		<div class="floor2">
			<div class="float-left item11">주소</div>
			<div class="float-left item2"><input name="addr1" class="input" type="text" placeholder="addr"></div>
			<div class="float-left item2"><input name="addr2" class="input" type="text" placeholder="addr2"></div>
		</div>
		<div class="floor">
			<div class="float-left item1">전화</div>
			<div class="float-left item2">
				<select id="prefix" name="prefix22">
					<option value="999">선택</option>
					<option value="010">010</option>
					<option value="017">017</option>
				</select>-
				<input name="ph1" class="input2" type="text" placeholder="hp2">-
				<input name="ph2" class="input2" type="text" placeholder="hp3">
			</div>
		</div>
		<div class="floorL">
			<input class="button2" type="button" value="회원가입" onclick="checkAll()">
			<input class="button2" type="reset" value="초기화">
			<input class="button2" type="button" value="가입안함" onclick="document.location=main.jsp">
		</div>
	</div>
	</form>
</body>
</html>