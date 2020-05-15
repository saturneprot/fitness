<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
<html>
<head>
<meta charset="UTF-8">
<title>modifyForm</title>
	
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
		}
		#logo0{color:#550002}
		#logo1{color:#d72f2d}
		#logo2{color:#e99730}
		#logo3{color:#94b940}
		#logo4{color:#4fa6dd}
		#subTitle{
			margin:auto;
			margin-top:50px;
			width:600px;
			paddin-left:50px;
			font-size:24px;
			font-weight:600;
		}
		#aa{
			margin:auto;
			width:600px;
			height:700px;
			border:1px solid #d9d9d9;
		}
		#cc{
			width:70px;
			height:20px;
			border:1px solid #eeeeee;
			background:red;
			color:white;
			margin-left:30px;
			display:inline-block;
			position:relative;
			left:300px;
		}
		#dd{
			font-size:24px;
			font-weight:700;
			margin-left:30px;
			display:inline-block;
			position:relative;
			left:160px;
		}
		.txt{
			background:#f2f2f2;
			border-right:1px solid #cccccc;
			font-weight:600;
			width:100px;
			height:30px;
			display:flex;
			align-items:center;
			padding-left:10px;
		}
		.txt2{
			border-right:1px solid #cccccc;
			width:70px;
			margin-left:0px;
		}
		.flo{
			float:left;
		}
		.box{
			width:400px;
			height:30px;
			margin:auto;
			margin-top:16px;
			border:1px solid #cccccc;
			/* display:flex;
			justify-content:center;
			align-items:center; */
			padding:0px;
		}
		.inputB{
			margin-left:10px;
			
		}
		.inputI{
			border:none;
			width:270px;
			height:30px;
			
		}
		#year, #month, #day{
			height:30px;
			float:left;
			margin-left:0px;
		}
		
		
		.msg{
			color:red;
			margin:auto;
			margin-top:3px;
		}
		.iimg{
			margin:auto;
			margin-top:10px;
			/* display:flex;
			justify-content:center;
			align-items:center; */
			width:300px;
			height:200px;
		}
		#date2{
			width:370px;
			height:25px;
			margin:auto;
			margin-top:10px;
			/* border:1px solid #cccccc;
			display:flex;
			justify-content:center; */
			align-items:center;
			
		}
		#button, #back{
			width:100px;
			height:30px;
			border:1px solid #808080;
			background:white;
			font-weight:600;
		}
	</style>
	<script>
		
		function modifyThing(){
			//alert("HIHI");
			document.pkc.submit();
		}
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
	        	 	$("#blah").attr('height',"100px");
	                 $('#blah').attr('src', e.target.result);
	             }

	           reader.readAsDataURL(input.files[0]);
	         }
	     }
	     function reStock(p_regdate2){
	    	 if(p_regdate2!=""){
	    		//alert(p_regdate2);
	    	 	var imsi = p_regdate2.split('-');
    	 		//alert(imsi[i]);
    	 		//alert(imsi[0]);
    	 		//alert(imsi[1]);
    	 		//alert(imsi[2]);
    	 		var year = document.getElementById("year");
    	 		//alert(year.length);
    	 		for(i=0;i<year.length;i++){
    	 			if(year.options[i].value==imsi[0]){
    	 				year.options[i].selected="true";
    	 				break;
    	 			}
    	 		}
    	 		var month = document.getElementById("month");
    	 		//alert(month.length);
    	 		for(i=0;i<month.length;i++){
    	 			if(month.options[i].value==imsi[1]){
    	 				month.options[i].selected="true";
    	 				break;
    	 			}
    	 		}
    	 		var day = document.getElementById("day");
    	 		//alert(day.length);
    	 		for(i=0;i<day.length;i++){
    	 			if(day.options[i].value==imsi[2]){
    	 				day.options[i].selected="true";
    	 				break;
    	 			}
    	 		}
	    	 }
	     }
	     
	</script>
</head>
<body onload="reStock('${dto.p_regdate2}')">
	<div id="mainCart">
	<div id="logo"  onclick="document.location='${ctxpath}/admin/index.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	<div id="dd">관리자모드</div>
	<div id="cc" onclick="document.location='${ctxpath}/admin/logout.do'">로그아웃</div>
	</div>
	<div id="subTitle">*상품수정</div>
	<form name="pkc" method="post" action="${ctxpath}/admin/modifyPro.do" encType="multipart/form-data">
	<div id="aa">
		<div class="box">
			<div class="flo txt">상품코드</div>
			<div class="flo inputB"><input class="inputI" type="text" name="p_code" value="${dto.p_code}"></div>
		</div>
		<div class="msg"></div>
		
		<div class="box">
			<div class="flo txt">상품이름</div>
			<div class="flo inputB"><input class="inputI" type="text" name="p_name" value="${dto.p_name}"></div>
		</div>
		<div class="msg"></div>
		
		<div class="box">
			<div class="flo txt">상품가격</div>
			<div class="flo inputB"><input class="inputI" type="text" name="p_price" value="${dto.p_price}"></div>
		</div>
		<div class="msg"></div>
		
		<div class="box">
			<div class="flo txt">상품수량</div>
			<div class="flo inputB"><input class="inputI" type="text" name="p_stock" value="${dto.p_stock}"></div>
		</div>
		<div class="msg"></div>

		
		<div class="box">
			<div class="flo txt">제조사</div>
			<div class="flo inputB"><input class="inputI" type="text" name="p_company" value="${dto.p_company}"></div>
		</div>
		<div class="msg"></div>
		
		<div class="box">
			<div class="flo txt">숨김</div>
			<div class="flo inputB"><input class="inputI" type="text" name="p_hide" value="${dto.p_hide}"></div>
		</div>
		<div class="msg"></div>
		
		<div class="box">
			<div class="flo txt">제품설명</div>
			<div class="flo inputB"><input class="inputI" type="text" name="p_comment" value="${dto.p_comment}"></div>
		</div>
		<div class="msg"></div>
		
		<div class="box">
			<div class="flo txt">재입고</div>
			<div class="inputI">
			<select id="year" name="year" style="margin-left:6px">
				<option value="">년도</option>
				<option value="2020">2020</option>
			</select> 
			<select id="month" name="month" style="margin-left:6px">
				<option value="">월</option>
				<option value="01">1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select> 
			<select id="day" name="day" style="margin-left:6px">
				<option value="">일</option>
				<option value="01">1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
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
			</div>
		</div>
		<div style="width:370px; margin:auto; margin-top:12px;">
			<input type='file' id="imgInp" name="p_image22" /><br>
			<img id="blah"  style="width:200px; height:200px; margin-top:12px" src="${ctxpath}/productImgs/${dto.p_image}"/><br>
		</div>
		<input type="hidden" name="keyField" value="${keyField}">
		<input type="hidden" name="keyWord" value="${keyWord}">
		<input type="hidden" name="page" value="${page}">
		<input type="hidden" name="block" value="${block}">
		<input type="hidden" name="p_num" value="${p_num}">
		<input type="hidden" name="p_image" value="${dto.p_image}">		
	<div style="width:370px; margin:auto; margin-top:12px">
		
		<input id="button" type='button' value="제출" onclick="modifyThing()">
		<input id="back" type="button" value="돌아가기" onclick="javascript:history.back()">
	</div>
	</div>
	</form>
</body>
</html>