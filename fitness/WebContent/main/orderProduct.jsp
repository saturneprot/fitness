<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
<html>
<head>
<meta charset="UTF-8">
<title>orderProduct</title>
	<style>
		#mainCart{
			margin:auto;
			width:800px;
			height:1000px;
		}
		#logo{
			margin-top:20px;
			font-size:36px;
			font-weight:700;
			border-bottom:1px solid #cccccc;
			padding-bottom:30px;
			cursor:pointer;
			z-index:1;
		}
		#logo0{color:#550002}
		#logo1{color:#d72f2d}
		#logo2{color:#e99730}
		#logo3{color:#94b940}
		#logo4{color:#4fa6dd}
		
		#mainF{
			margin-top:10px;
			width:800px;
			height:45px;
			/* border:1px solid black; */
			border-bottom:3px solid #808080;
		}
		#mainTxt{
			float:left;
			font-size:28px;
			font-weight:700;
		}
		#mainRight{
			float:right;
			font-size:16px;
		}
		#mRight0, #mRight2{
			color:#d9d9d9;
		}
		#mRight1{
			color:#0277e5;
			font-weight:600;
		}
		#buyerF{
			margin-top:10px;
			width:800px;
			height:100px;
			/* border:1px solid black; */
		}
		#buyerInfo{
			font-size:20px;
			font-weight:600;
		}
		table{
			border-top:1px solid #808080;
			border-spacing:0px;
			width:800px;
		}
		.orderTd{
			background:#f2f2f2;
			border-bottom:1px solid #d9d9d9;
			font-weight:600;
			width:120px;
		}
		
		#receiverF{
			margin-top:30px;
			width:800px;
			height:200px;
			/* border:1px solid black; */
		}
		#rP{
			font-size:20px;
			font-weight:600;
			float:left;
		}
		#inputAddr{
			width:80px;
			height:25px;
			border:1px solid #808080;
			border-radius:5px;
			font-weight:600;
			display:flex;
			align-items:center;
			justify-content:center;
			cursor:pointer;
			
		}
		#changeAddr{
			float:left;
			margin-left:15px;
			width:50px;
			height:25px;
			border:1px solid #808080;
			border-radius:5px;
			font-weight:600;
			display:flex;
			align-items:center;
			justify-content:center;
			cursor:pointer;
		}
		#deleveryF{
			margin-top:20px;
			width:800px;
			height:300px;
			/* border:1px solid black; */
		}
		#infoTd{
			padding-left:5px;
		}
		#purchaseL{
			margin-top:20px;
			font-size:20px;
			font-weight:600;
		}
		#purchaseN{
			font-size:14px;
			color:#808080;
			width:800px;
			height:25px;
		}
		#purchaseTable{
			border-top:1px solid #808080;
			border-spacing:0px;
			width:800px;
			border-bottom:1px solid #808080;
		}
		#payF{
			margin-top:20px;
			width:800px;
			height:130px;
			/* border:1px solid black; */
		}
		#payInfo{
			font-size:20px;
			font-weight:600;
		}
		#payTable{
			border-top:1px solid #808080;
			border-spacing:0px;
			width:800px;
			border-bottom:1px solid #808080;
		}
		#payT{
			width:500px;
			height:25px;
		}
		#payLL{
			display:inline-block;
			width:100px;
			height:25px;
			float:left;			
		}
		#payRR{
			display:inline-block;
			float:right;
		}
		#agreeF{
			margin-top:20px;
			width:800px;
			height:60px;		
		}
		#payA{
			margin:auto;
			margin-top:10px;
			width:800px;
			height:30px;
			display:flex;
			justify-content:center;
			align-items:center;
		}
		#payButton{
			width:180px;
			height:40px;
			background:#0277e5;
			border:1px solid #0277e5;
			border-radius:5px;
			color:white;
			font-size:18px;
			font-weight:600;
		}
	</style>
	<script>
		function same(){
			document.getElementById("mname2").value=document.getElementById("mname").value;
			document.getElementById("mnumber2").value=document.getElementById("mnumber").value;
			document.getElementById("memail2").value=document.getElementById("memail").value;
		}
		function checkAllThings(){
			var num = document.pkc.o_pay.length;
			var chk=0;
			for(i=0; i<num; i++){
				if(document.pkc.o_pay[i].checked){
					chk=1;
					break;
				}
			}
			if(!document.getElementById("mname2").value){
				alert("수령인의 이름을 입력해 주세요");
				document.getElementById("mname2").focus();
				return false;
			}
			if(!document.getElementById("mnumber2").value){
				alert("수령인의 연락처를 입력해 주세요");
				document.getElementById("mnumber2").focus();
				return false;
			}
			if(!document.getElementById("memail2").value){
				alert("수령인의 이메일을 입력해 주세요");
				document.getElementById("memail2").focus();
				return false;
			}
			if(!document.getElementById("addr").value){
				alert("주소1을 입력해 주세요");
				document.getElementById("addr").focus();
				return false;
			}
			if(!document.getElementById("addr2").value){
				alert("주소2를 입력해 주세요");
				document.getElementById("addr2").focus();
				return false;
			}
			if(chk==0){
				alert("결제방법을 체크해 주세요");
				return false;
			}
			if(!document.getElementById("checkService").checked){
				alert("이용약관에 동의해 주세요");
				return false;
			}
			return true;
		}
		function imsi(){
			var num = document.pkc.o_pay.length;
			alert(num);
		}
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function openDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					//document.getElementById('zipcode').value = data.zonecode;
					document.getElementById('addr').value = "("+data.zonecode+")"+ data.address;
				}
			}).open();
		}//openDaumPostcode()---
	</script>
</head>
<body>
	<div id="mainCart">
	<form name="pkc" method="post" action="${ctxpath}/main/orderProductPro.do" onsubmit="return checkAllThings();">
	<div id="logo" onclick="document.location='${ctxpath}/main/main.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
		<div id="mainF">
			<div id="mainTxt">주문/결제</div>
			<div id="mainRight"><span id="mRight0">장바구니 ></span>&nbsp;<span id="mRight1">주문결제 ></span>&nbsp;<span id="mRight2">주문완료</span></div>
		</div>
		<div id="buyerF">
			<div id="buyerInfo">구매자 정보</div>
			<table>
				<tr>
					<td align="right" class="orderTd">이름</td>
					<td width="400" class="infoTd"><input id="mname" type="text" value="${mdto.mname}" disabled></td>
					<td><input type="hidden" name="mid" value="${mdto.mid}"></td>
				</tr>
				<tr>
					<td align="right" class="orderTd">휴대폰 번호</td>
					<td width="400" class="infoTd"><input id="mnumber" type="text" value="${mdto.mnumber}" disabled></td>
				</tr>
				<tr>
					<td align="right" class="orderTd">이메일</td>
					<td width="400" class="infoTd"><input id="memail" type="text" value="${mdto.memail}" disabled></td>
				</tr>
			</table>
		</div>
		
		<div id="receiverF">
			<div id="receiverInfo"><div id="rP">받는사람정보</div><div id="changeAddr" onclick="same()">동일</div></div>
			<table style="clear:both;">
				<tr>
					<td align="right" class="orderTd">이름</td>
					<td ><input id="mname2" name="o_name" type="text" value=""></td>
				</tr>
				<tr>
					<td align="right" class="orderTd">연락처</td>
					<td ><input id="mnumber2" name="o_number" type="text" value=""></td>
				</tr>
				<tr>
					<td align="right" class="orderTd">이메일</td>
					<td><input id="memail2" name="o_email" type="text" value=""></td>
				</tr>
				<tr>
					<td align="right" class="orderTd">배송주소</td>
					<td><div id="inputAddr" onclick="openDaumPostcode()">주소입력</div></td>
				</tr>
				<tr>
					<td align="right" class="orderTd">주소</td>
					<td ><input id="addr" name="o_addr1" type="text" value="" size="40"></td>
				</tr>
				<tr>
					<td align="right" class="orderTd">상세주소</td>
					<td><input id="addr2" name="o_addr2" type="text" value="" size="40"></td>
				</tr>
				<tr>
					<td align="right" class="orderTd">배송 요청사항</td>
					<td><input id="commentR" type="text" name="o_comment" size="40"></td>
				</tr>
			</table>
		</div>
		
		<!-- <div id="deleveryF"> -->
			<div id="purchaseL">구매목록</div>
			<table id="purchaseTable">
				<tr bgcolor="#f2f2f2">
					<td><div id="purchaseN">${mdto.mname}님께서 선택하신 목록</div></td>
				</tr>
				<c:if test="${!empty list}">
				<c:set var="sumP" value="0"/>
				<%-- <c:set var="map2" value="<%= new HashMap<String, String>() %>" scope="request" /> --%>
					<c:forEach var="cdto" items="${list}">
						
						<tr>
							<td width="500"><div style="float:left;">${cdto.p_name}</div><div style="float:right">${cdto.cart_quantity}개</div></td>
							<td><input type="hidden" name="cart_num" value="${cdto.cart_num}"></td>
							<td><input type="hidden" name="p_num" value="${cdto.p_num}"></td>
							<td><input type="hidden" name="cart_quantity" value="${cdto.cart_quantity}"></td>
							<%-- <c:set target="${map2}" property="cart_num" value="${cdto.cart_num}" />
							<c:set target="${map2}" property="p_num" value="${cdto.p_num}" />
							<c:set target="${map2}" property="cart_quantity" value="${cdto.cart_quantity}"/> --%>
						</tr>
						<c:set var="sumP" value="${sumP+cdto.p_price*cdto.cart_quantity}"/>
					</c:forEach>
				</c:if>
			</table>
		<!-- </div> -->
		<div id="payF">
			<div id="payInfo">결제정보</div>
			<table id="payTable">
				<tr>
					<td width="80">총상품가격</td><td style="padding-left:10px;"><fmt:formatNumber value="${sumP}" pattern="#,###" />원</td>
				</tr>
				<tr>
					<td width="80">배송비</td><td style="padding-left:10px;"><fmt:formatNumber value="${2500}" pattern="#,###" />원</td>
				</tr>
				<tr>
					<td width="80">총결제금액</td><td style="padding-left:10px;"><fmt:formatNumber value="${sumP+2500}" pattern="#,###" />원</td>
				</tr>
				<tr>
					<td width="80">결제방법</td><td><input name="o_pay" type="radio" value="계좌이체">계좌이체<input name="o_pay" type="radio" value="페이머니">페이머니<input name="o_pay" type="radio" value="신용/체크카드">신용/체크카드<input name="o_pay" type="radio" value="법인카드">법인카드<input name="o_pay" type="radio" value="휴대폰">휴대폰</td>
				</tr>
			</table>
		</div>
		<div id="agreeF">
			<div><input id="checkService" type="checkbox">(필수) 구매대행 서비스 이용약관 동의</div>
			<div id="payA"><input id="payButton" type="submit" value="결제하기"></div>
		</div>
		</form>
	</div>
</body>
</html>