<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>insertProduct</title>
	
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>
		#mainCart{
			margin:auto;
			margin-top:30px;
			width:800px;
			height:50px;
			position:relaive;
		}
		#logo{
			margin-left:0px;
			margin-top:0px;
			font-size:24px;
			font-weight:700;
			border-bottom:1px solid #cccccc;
			display:inline-block;
			position:relative;
			left:50px;
			cursor:pointer;
		}
		#logo0{color:#550002}
		#logo1{color:#d72f2d}
		#logo2{color:#e99730}
		#logo3{color:#94b940}
		#logo4{color:#4fa6dd}
		
		#cc{
			width:68px;
			height:20px;
			border:1px solid #eeeeee;
			background:red;
			color:white;
			margin-left:30px;
			display:inline-block;
			position:relative;
			left:300px;
			cursor:pointer;
			font-weight:600;
		}
		#dd{
			font-size:24px;
			font-weight:700;
			margin-left:30px;
			display:inline-block;
			position:relative;
			left:160px;
		}
		.outer {
			width:460px;
			height:35px;
			border:1px solid #aaaaaa;
			margin-top:12px;
			margin-left:12px;			
		}
		.txt{
			margin-left:12px;
			width:450px;
			height:50px;
			border:1px solid #aaaaaa;
			margin-top:12px;
		}
		.icon {
			width:100px;
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
			width:350px;
			height:30px;
			font-size:15px;
			border:none;
			float:right;
		}
		#container{
			paddin-left:10px;
			margin:auto;
			width:500px;
			height:750px;
			border:1px solid #eeeeee;
			align-content:center;			
		}
		#date{
			margin-left:12px;
			margin-bottom:12px;
		}
		#pimg{
			width:250px;
			height:250px;
		}
		#submit, #back{
			width:100px;
			height:30px;
			border:1px solid #808080;
			background:white;
			font-weight:600;
		}
	</style>
	<script>
	var mess = ["상품코드번호를", "상품이름을", "상품가격을", "상품수량을", "제조사를", "상품카테고리를"];
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
	function checktxt(my){
		if(!my.value.trim()){
			document.getElementsByClassName("txtt")[0].style.borderColor = "red";
			document.getElementsByClassName("message")[6].innerText = "상품설명을 입력하세요";	
		}else{
			document.getElementsByClassName("txtt")[0].style.borderColor = "#aaaaaa";
			document.getElementsByClassName("message")[6].innerText = "";
		}
	}
	function checkIt(){
		var yearI = document.pkc.year.selectedIndex;
		var monthI = document.pkc.month.selectedIndex;
		var dayI = document.pkc.day.selectedIndex;
		if(document.getElementById("p_code").value==""){
			document.getElementsByClassName("outer")[0].style.borderColor = "red";
			document.getElementsByClassName("message")[0].innerText = "상품코드번호를 입력하세요";
			document.getElementById("p_code").focus();
			return false;
		}
		if(document.getElementById("p_name").value==""){
			document.getElementsByClassName("outer")[1].style.borderColor = "red";
			document.getElementsByClassName("message")[1].innerText = "상품이름을 입력하세요";	
			document.getElementById("p_name").focus();
			return false;
		}
		if(document.getElementById("p_price").value==""){
			document.getElementsByClassName("outer")[2].style.borderColor = "red";
			document.getElementsByClassName("message")[2].innerText = "상품가격을 입력하세요";	
			document.getElementById("p_price").focus();
			return false;
		}
		if(document.getElementById("p_stock").value==""){
			document.getElementsByClassName("outer")[3].style.borderColor = "red";
			document.getElementsByClassName("message")[3].innerText = "상품수량을 입력하세요";	
			document.getElementById("p_stock").focus();
			return false;
		}
		if(document.getElementById("p_company").value==""){
			document.getElementsByClassName("outer")[4].style.borderColor = "red";
			document.getElementsByClassName("message")[4].innerText = "제조사를 입력하세요";
			document.getElementById("p_company").focus();
			return false;
		}
		if(document.getElementById("c_num").value==""){
			document.getElementsByClassName("outer")[5].style.borderColor = "red";
			document.getElementsByClassName("message")[5].innerText = "카테고리를 입력하세요";	
			document.getElementById("c_num").focus();
			return false;
		}
		if(!document.pkc.p_comment.value){
			document.getElementsByClassName("txtt")[0].style.borderColor = "red";
			document.getElementsByClassName("message")[6].innerText = "상품설명을 입력하세요";	
			document.getElementById("p_comment").focus();
			return false;
		}
		if(document.pkc.year.options[yearI].value=='9999'){
			document.getElementsByClassName("message")[7].innerText="년도를 선택하세요";
			return false;
		}
		if(document.pkc.month.options[monthI].value=='99'){
			document.getElementsByClassName("message")[7].innerText="월을 선택하세요";
			return false;
		}
		if(document.pkc.day.options[dayI].value=='999'){
			document.getElementsByClassName("message")[7].innerText="일을 선택하세요";
			return false;
		}
		
		if(!document.getElementById("imgInp").value){
			document.getElementsByClassName("message")[8].innerText="이미지를 첨부하세요";
			return false;
		}
		return true;
	}
	</script>
	<script>
	 $(function() {
         $("#imgInp").on('change', function(){
             readURL(this);
         });
     });

     function readURL(input) {
         if (input.files && input.files[0]) {
         var reader = new FileReader();

         reader.onload = function (e) {
        	 	$('#blah').attr('width',"200px");
        	 	$("#blah").attr('height',"200px");
                 $('#blah').attr('src', e.target.result);
             }

           reader.readAsDataURL(input.files[0]);
         }
     }



</script>
</head>
<body>
	<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
	<div id="mainCart">
	<div id="logo"  onclick="document.location='${ctxpath}/admin/index.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	<div id="dd">관리자모드</div>
	<div id="cc" onclick="document.location='${ctxpath}/admin/logout.do'">로그아웃</div>
	</div>
	<form name="pkc" method="post" action="/fitness/admin/insertPro.do" onsubmit="return checkIt();" encType="multipart/form-data">
	<div id="container">
	<div style="width:100%; height:20px; text-align:center; font-size:20px; font-weight:600;">상품등록</div>
	<div class="outer">
		<!-- 상품코드번호 -->
		<div class="icon">
			상품코드번호
			<!-- <img src="../img/user.png" width="90%" height="90%"> -->
		</div>
		<input id="p_code" type="text" name="p_code" onblur="checkcheck(this,0)"
			class="input" placeholder="상품코드번호">
	</div>
	<div class="message"></div>
	<div class="outer">
		<!-- 상품이름 -->
		<div class="icon">
			상품이름
			<!-- <img src="../img/user.png" width="90%" height="90%"> -->
		</div>
		<input id="p_name" type="text" name="p_name" onblur="checkcheck(this,1)"
			class="input" placeholder="상품이름">
	</div>
	<div class="message"></div>
	<div class="outer">
		<!-- 상품가격 -->
		<div class="icon">
			상품가격
			<!-- <img src="../img/user.png" width="90%" height="90%"> -->
		</div>
		<input id="p_price" type="text" name="p_price" onblur="checkcheck(this,2)"
			class="input" placeholder="상품가격">
	</div>
	<div class="message"></div>
	<div class="outer">
		<!-- 상품수량 -->
		<div class="icon">
			상품수량
			<!-- <img src="../img/user.png" width="90%" height="90%"> -->
		</div>
		<input id="p_stock" type="text" name="p_stock" onblur="checkcheck(this,3)"
			class="input" placeholder="상품수량">
	</div>
	<div class="message"></div>
	
	<div class="outer">
		<!-- 제조사 -->
		<div class="icon">
			제조사
			<!-- <img src="../img/user.png" width="90%" height="90%"> -->
		</div>
		<input id="p_company" type="text" name="p_company" onblur="checkcheck(this,4)"
			class="input" placeholder="제조사">
	</div>
	<div class="message"></div>
	
	<div class="outer">
		<!-- 상품카테고리 -->
		<div class="icon">
			카테고리
			<!-- <img src="../img/user.png" width="90%" height="90%"> -->
		</div>
		<input id="c_num" type="text" name="c_num" onblur="checkcheck(this,5)"
			class="input" placeholder="상품 카테고리">
	</div>
	<div class="message"></div>
	
	
	<div class="txt" >
		<!-- 상품설명 -->
		
		<textarea class="txtt" id="p_comment" style="width:450px; height:50px" name="p_comment" onblur="checktxt(this)"
			placeholder="상품설명"></textarea>
	</div>
	<div class="message"></div>
	
	
	<div style="margin-left:12px">년도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</div>
	<div id="date">
		<select name="year">
			<option value="9999">선택</option>
			<option value="2020">2020</option>
		</select>
		<select name="month">
			<option value="99">선택</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<select name="day">
			<option value="999">선택</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
			<option value="25">25</option>
			<option value="26">26</option>
			<option value="27">27</option>
			<option value="28">28</option>
			<option value="29">29</option>
			<option value="30">30</option>
			<option value="31">31</option>
		</select>
		<!-- <select name="hour">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
		</select> -->
	</div>
	<div class="message" style="margin-left:15px;"></div>
	<!-- 상품이미지 -->
	<div>
		<input type='file' id="imgInp" name="p_image" style="margin-left:12px"/><br>
		<img id="blah" style="margin-left:12px; margin-top:12px" src=""/><br>
	</div>
	<div class="message" style="margin-left:15px;"></div>
	<input id="submit" style="margin-left:12px; margin-top:12px" type="submit" value="제출">&nbsp;<input id="back" type="button" value="나가기" onclick="javascript:history.back()">
	</div><!-- container -->
	</form>
	
</body>
</html>