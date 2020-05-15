<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:set var="mid" value="${mid}"/>
<html>
<head>
<meta charset="UTF-8">
<title>viewCart</title>
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
		}
		#logo0{color:#550002}
		#logo1{color:#d72f2d}
		#logo2{color:#e99730}
		#logo3{color:#94b940}
		#logo4{color:#4fa6dd}
		#secondF{
			width:800px;
			height:50px;
			border-bottom:1px solid #cccccc;
		}
		#cartImage{
			margin-top:5px;
			float:left;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#cartTxt{
			font-size:26px;
			font-weight:600;
			
		}
		#cart2right{
			margin-top:13px;
			float:right;
			font-weight:600;
		}
		#right0, #right2{color:#d9d9d9}
		#right1{color:#269ae6}
		#product1c{
			width:100%;
			height:100%;
			display:flex;
			align-items:center;
			justify-content:center;
			/* border-bottom:1px solid black; */
		}
		.tdC{
			border-bottom:1px solid #cccccc;
			padding:10px;
		}
		#productBottom{
			margin-top:30px;
			height:50px;
			width:100%;
			border:4px solid #cccccc;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#proInfo{
			float:left;
			width:100%;
			height:100%;
		}
		#product2C{
			width:300px;
			float:left;
		}
		.info22{
			float:right;
			/* border:1px solid black; */
			width:150px;
			height:30px;
		}
		.xImage{
			float:right;
			cursor:pointer;
			width:30px;
			height:30px;
			border:1px solid #d9d9d9;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#infoN{
			float:left;
		}		
		#subTotal, #deliveryR{
			font-size:20px;
			font-weight:700;
		}
		#totalR{
			color:red;
			font-size:20px;
			font-weight:700;
		}
		#inputArea{
			margin-top:10px;
			width:100%;
			height:50px;
			/* border:1px solid black; */
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#keepShopping{
			width:180px;
			height:40px;
			border:3px solid #0277e5;
			border-radius:5px;
			color:#0277e5;
			font-size:20px;
			font-weight:500;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#orderTh{
			width:180px;
			height:40px;
			margin-left:15px;
			background:#0277e5;
			color:white;
			font-size:20px;
			font-weight:500;
			border:1px solid #0277e5;
			border-radius:5px;
		}
		.con{
			float:left;
			
			width:150px;
			height:34px;
		}
		.minus{
			width:30px;
			height:28px;
			cursor:pointer;
			border:1px solid #cccccc;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		.plus{
			width:30px;
			height:28px;
			cursor:pointer;
			border:1px solid #cccccc;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		.flo{
			float:left;
		}
		.input{
			float:left;
			width:30px;
			height:30px;
		}
		.sub{
			width:30px;
			height:30px;
		}
		#result{
			color:red;
			font-weight:600;
			font-size:20px;
		}
	</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
	<script>
		function checkAllThings(){
			var len=document.getElementsByClassName("checkC").length;
			var sumR=0;
			for(i=0;i<len;i++){
				var qq=document.getElementsByClassName("input")[i].value;
				var pp=document.getElementsByClassName("price")[i].value;
				sumR=sumR+(qq*pp);
			}
			sumR=sumR+"";
			//alert("length:"+sumR.length);
			if(sumR.length<=3){
				document.getElementById("result").innerText=sumR;
			}else if(sumR.length==4){
				document.getElementById("result").innerText=sumR.substr(0,1)+"," + sumR.substr(1);
			}else if(sumR.length==5){
				document.getElementById("result").innerText=sumR.substr(0,2)+"," + sumR.substr(2);
			}else if(sumR.length==6){
				document.getElementById("result").innerText=sumR.substr(0,3)+","+sumR.substr(3);
			}else if(sumR.length==7){
				document.getElementById("result").innerText=sumR.substr(0,1)+","+sumR.substr(1,3)+","+sumR.substr(4);
			}else if(sumR.length==8){
				document.getElementById("result").innerText=sumR.substr(0,2)+","+sumR.substr(2,3)+","+sumR.substr(5);
			}
		}
		function minus(n,cart_num){
			/* var val = document.getElementsByClassName("input")[n].value;
			if(val>1){
				val--
				document.getElementsByClassName("input")[n].value=val;
			} */
			var val = document.getElementsByClassName("input")[n].value;
			
			if(val>1){
				val--;
				document.getElementsByClassName("input")[n].value=val;
				$.ajax({
					type:"GET",
					url:"updateProductFromCart.jsp",
					data:"cart_num="+cart_num+"&ud=d",
					dataType:'JSON',
					success:function(data){
						
						
					}//end success
				});//end ajax
			}
		}
		function plus(n,cart_num){
			/* var val = document.getElementsByClassName("input")[n].value;
			if(val<15){
				val++;
				document.getElementsByClassName("input")[n].value=val;
			} */
			var val = document.getElementsByClassName("input")[n].value;
			
			if(val<100){
				val++;
				document.getElementsByClassName("input")[n].value=val;
				$.ajax({
					type:"GET",
					url:"updateProductFromCart.jsp",
					data:"cart_num="+cart_num+"&ud=u",
					dataType:'JSON',
					success:function(data){
						
						
					}//end success
				});//end ajax
			}
		}
		function mminus(n){
			var len=document.getElementsByClassName("checkC").length;
			var val=document.getElementsByClassName("price")[n].value;
			var cnt=document.getElementsByClassName("input")[n].value;
			var sumR=val*cnt+"";
			if(sumR.length<=3){
				document.getElementsByClassName("priceArea")[n].innerText=sumR+"원";
			}else if(sumR.length==4){
				document.getElementsByClassName("priceArea")[n].innerText=sumR.substr(0,1)+"," + sumR.substr(1)+"원";
			}else if(sumR.length==5){
				document.getElementsByClassName("priceArea")[n].innerText=sumR.substr(0,2)+"," + sumR.substr(2)+"원";
			}else if(sumR.length==6){
				document.getElementsByClassName("priceArea")[n].innerText=sumR.substr(0,3)+","+sumR.substr(3)+"원";
			}else if(sumR.length==7){
				document.getElementsByClassName("priceArea")[n].innerText=sumR.substr(0,1)+","+sumR.substr(1,3)+","+sumR.substr(4)+"원";
			}else if(sumR.length==8){
				document.getElementsByClassName("priceArea")[n].innerText=sumR.substr(0,2)+","+sumR.substr(2,3)+","+sumR.substr(5)+"원";
			}
			var sumRR=0;
			for(i=0;i<len;i++){
				if(document.getElementsByClassName("checkC")[n].checked){
					var qq=document.getElementsByClassName("input")[i].value;
					var pp=document.getElementsByClassName("price")[i].value;
					sumRR=sumRR+(qq*pp);
				}
			}
			sumRR=sumRR+"";
			if(sumRR.length<=3){
				document.getElementById("result").innerText=sumRR;
			}else if(sumRR.length==4){
				document.getElementById("result").innerText=sumRR.substr(0,1)+"," + sumRR.substr(1);
			}else if(sumRR.length==5){
				document.getElementById("result").innerText=sumRR.substr(0,2)+"," + sumRR.substr(2);
			}else if(sumRR.length==6){
				document.getElementById("result").innerText=sumRR.substr(0,3)+","+sumRR.substr(3);
			}else if(sumRR.length==7){
				document.getElementById("result").innerText=sumRR.substr(0,1)+","+sumRR.substr(1,3)+","+sumRR.substr(4);
			}else if(sumRR.length==8){
				document.getElementById("result").innerText=sumRR.substr(0,2)+","+sumR.substr(2,3)+","+sumRR.substr(5);
			}
		}
		function mplus(n){
			var len=document.getElementsByClassName("checkC").length;
			var val=document.getElementsByClassName("price")[n].value;
			var cnt=document.getElementsByClassName("input")[n].value;
			var sumR=val*cnt+"";
			if(sumR.length<=3){
				document.getElementsByClassName("priceArea")[n].innerText=sumR+"원";
			}else if(sumR.length==4){
				document.getElementsByClassName("priceArea")[n].innerText=sumR.substr(0,1)+"," + sumR.substr(1)+"원";
			}else if(sumR.length==5){
				document.getElementsByClassName("priceArea")[n].innerText=sumR.substr(0,2)+"," + sumR.substr(2)+"원";
			}else if(sumR.length==6){
				document.getElementsByClassName("priceArea")[n].innerText=sumR.substr(0,3)+","+sumR.substr(3)+"원";
			}else if(sumR.length==7){
				document.getElementsByClassName("priceArea")[n].innerText=sumR.substr(0,1)+","+sumR.substr(1,3)+","+sumR.substr(4)+"원";
			}else if(sumR.length==8){
				document.getElementsByClassName("priceArea")[n].innerText=sumR.substr(0,2)+","+sumR.substr(2,3)+","+sumR.substr(5)+"원";
			}
			var sumRR=0;
			for(i=0;i<len;i++){
				if(document.getElementsByClassName("checkC")[n].checked){
					var qq=document.getElementsByClassName("input")[i].value;
					var pp=document.getElementsByClassName("price")[i].value;
					sumRR=sumRR+(qq*pp);
				}
			}
			sumRR=sumRR+"";
			if(sumRR.length<=3){
				document.getElementById("result").innerText=sumRR;
			}else if(sumRR.length==4){
				document.getElementById("result").innerText=sumRR.substr(0,1)+"," + sumRR.substr(1);
			}else if(sumRR.length==5){
				document.getElementById("result").innerText=sumRR.substr(0,2)+"," + sumRR.substr(2);
			}else if(sumRR.length==6){
				document.getElementById("result").innerText=sumRR.substr(0,3)+","+sumRR.substr(3);
			}else if(sumRR.length==7){
				document.getElementById("result").innerText=sumRR.substr(0,1)+","+sumRR.substr(1,3)+","+sumRR.substr(4);
			}else if(sumRR.length==8){
				document.getElementById("result").innerText=sumRR.substr(0,2)+","+sumR.substr(2,3)+","+sumRR.substr(5);
			}
		}
		function checkAll(){
			var len=document.getElementsByClassName("checkC").length;
			var sumR=0;
			if(document.getElementsByClassName("checkT")[0].checked){
				for(i=0;i<len;i++){
					document.getElementsByClassName("checkC")[i].checked=true;
					var qq=document.getElementsByClassName("input")[i].value;
					var pp=document.getElementsByClassName("price")[i].value;
					sumR=sumR+(qq*pp);
				}
				sumR=sumR+"";
				//alert("length:"+sumR.length);
				if(sumR.length<=3){
					document.getElementById("result").innerText=sumR;
				}else if(sumR.length==4){
					document.getElementById("result").innerText=sumR.substr(0,1)+"," + sumR.substr(1);
				}else if(sumR.length==5){
					document.getElementById("result").innerText=sumR.substr(0,2)+"," + sumR.substr(2);
				}else if(sumR.length==6){
					document.getElementById("result").innerText=sumR.substr(0,3)+","+sumR.substr(3);
				}else if(sumR.length==7){
					document.getElementById("result").innerText=sumR.substr(0,1)+","+sumR.substr(1,3)+","+sumR.substr(4);
				}else if(sumR.length==8){
					document.getElementById("result").innerText=sumR.substr(0,2)+","+sumR.substr(2,3)+","+sumR.substr(5);
				}
				
			}else{
				for(i=0;i<len;i++){
					document.getElementsByClassName("checkC")[i].checked=false;
				}
				document.getElementById("result").innerText=0;
			}
		}
		function checkcheck(){
			var len=document.getElementsByClassName("checkC").length;
			var sumR=0;
			var chk=0;
			for(i=0;i<len;i++){
				if(document.getElementsByClassName("checkC")[i].checked){
					chk++;
					var qq=document.getElementsByClassName("input")[i].value;
					var pp=document.getElementsByClassName("price")[i].value;
					sumR=sumR+(qq*pp);
				}
			}
			if(len!=chk){
				document.getElementsByClassName("checkT")[0].checked=false;
			}else if(len==chk){
				document.getElementsByClassName("checkT")[0].checked=true;
			}
			sumR=sumR+"";
			//alert("length:"+sumR.length);
			if(sumR.length<=3){
				document.getElementById("result").innerText=sumR;
			}else if(sumR.length==4){
				document.getElementById("result").innerText=sumR.substr(0,1)+"," + sumR.substr(1);
			}else if(sumR.length==5){
				document.getElementById("result").innerText=sumR.substr(0,2)+"," + sumR.substr(2);
			}else if(sumR.length==6){
				document.getElementById("result").innerText=sumR.substr(0,3)+","+sumR.substr(3);
			}else if(sumR.length==7){
				document.getElementById("result").innerText=sumR.substr(0,1)+","+sumR.substr(1,3)+","+sumR.substr(4);
			}else if(sumR.length==8){
				document.getElementById("result").innerText=sumR.substr(0,2)+","+sumR.substr(2,3)+","+sumR.substr(5);
			}
		}
		function deleteTh(cart_num, mid){
			if(mid!=null){
				$.ajax({
					type:"GET",
					url:"deleteProductFromCart.jsp",
					data:"cart_num="+cart_num+"&mid="+mid,
					dataType:'JSON'/* ,
					success:function(data){
						if(data.result==1){
							//$("#secondF").load(window.location.href+"#tableR");
						}
					}//end success */
				});//end ajax
			}
			setTimeout(function(){
				$("#mainCart").load(window.location.href+"#secondF");
			},100);
		}//end deleteTh() function;
		function checkItF(){
			var chk=0;
			var len=document.getElementsByClassName("checkC").length;
			
			for(i=0; i<len; i++){
				if(!document.getElementsByClassName("checkC")[i].checked){
					chk++;
					//alert("HIHI");
					//alert(i);
					//alert(document.getElementsByClassName("selectQ")[i].disabled);
					document.getElementsByClassName("cartcart")[i].disabled=true;
					//$(".cart_num");
				}
			}
			if(chk==len){
				alert("물건을 선택하셔야합니다");
				for(i=0; i<len; i++){
					document.getElementsByClassName("cartcart")[i].disabled=false;
					
				}
				return false;
			}
			return true;
		}///end checkItF() function;
	</script>
</head>
<body onload="checkAllThings()">
	<div id="mainCart">
	<div id="logo" onclick="document.location='${ctxpath}/main/main.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	<div id="secondF">
		<div id="cartImage">
			<img src="${ctxpath}/img/cart.png" width="40px" height="40px"><span id="cartTxt">장바구니</span>
		</div>
		<div id="cart2right">
			<span id="right0">01&nbsp;옵션선택&nbsp;>&nbsp;</span><span id="right1">02&nbsp;</span><span>장바구니&nbsp;>&nbsp;</span><span id="right2">03&nbsp;주문/결제&nbsp;>&nbsp;04&nbsp;주문완료</span>
		</div>
	</div>
	<form action="${ctxpath}/main/orderProduct.do" onsubmit="return checkItF();">
		<table id="tableR" width="800">
			<tr>
				<td width="100" class="tdC"><input class="checkT" type="checkbox" checked onclick="checkAll()">전체선택</td>
				<td width="600" class="tdC" align="center">상품정보</td>
				<td width="100" class="tdC">상품금액</td>
			</tr>
				<c:if test="${list.size()==0}">
					<tr>
						<td colspan="3" class="tdC">장바구니에 담은 상품이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${list.size()>0 }">
					<c:set var="cntR" value="0"/>
					<c:forEach var="cartdto" items="${list}">
						<tr>
							
							<td width="100" class="tdC"><div id="product1c"><input class="checkC" type="checkbox" checked onclick="checkcheck()"><img src="${ctxpath}/productImgs/${cartdto.p_image}" width="70" height="70"></div></td>
							
							<td class="tdC" width="600">
								<div id="proInfo">
									<div id="product2c">${cartdto.p_name}</div>
									<div class="info22">
										<div class="con">
											
											<div class="flo minus" onclick="minus('${cntR}','${cartdto.cart_num}'); mminus(${cntR})">-</div>
											<input class="flo input" type="text" value="${cartdto.cart_quantity}" readonly>
											<div class="flo plus" onclick="plus('${cntR}','${cartdto.cart_num}'); mplus(${cntR})">+</div>
											<input name="hiddenPrice" class="price" type="hidden" value="${cartdto.p_price}">
											<div class="xImage" onclick="deleteTh('${cartdto.cart_num}','${cartdto.mid}')"><img src="${ctxpath}/img/cancel.png" width="16px" height="16px"></div>
										</div>
									</div>
								</div>
							</td>
							<%-- <td width="100" class="tdC"><fmt:formatNumber value="${cartdto.p_price*cartdto.cart_quantity }" pattern="#,###" />원</td> --%>
							
							<td width="100" class="tdC" id="initializeR"><div class="priceArea"><fmt:formatNumber pattern="#,###" value="${cartdto.p_price*cartdto.cart_quantity}"/>원</div></td>
							<td><input class="cartcart" type="hidden" name="cart_num" value="${cartdto.cart_num}"></td>
						</tr>
						<c:set var="cntR" value="${cntR+1}"/>
					</c:forEach>
					<tr>
						<%-- <td colspan="3"><div id="productBottom">총 상품가격&nbsp;<span id="subTotal">${sumRR}</span>&nbsp;원&nbsp;<span id="plusIcon"></span>&nbsp;총 배송비&nbsp;<span id="deliveryR">2500</span>&nbsp;원&nbsp;<span id="equalsIcon"></span>&nbsp;총 주문금액&nbsp;<span id="totalR">${sumRR+2500}</span>원</div></td> --%>
						<!-- <td colspan="3"><div id="productBottom">총 상품가격&nbsp;<span id="result"></span>&nbsp;원&nbsp;<span id="plusIcon"></span>&nbsp;총 배송비&nbsp;<span id="deliveryR">2500</span>&nbsp;원&nbsp;<span id="equalsIcon"></span>&nbsp;총 주문금액&nbsp;<span id="totalR"></span>원</div></td> -->
						<td colspan="3"><div id="productBottom">총 상품가격&nbsp;<span id="result"></span>&nbsp;원&nbsp;<span id="plusIcon"></span>&nbsp;총 배송비&nbsp;<span id="deliveryR">2500</span>&nbsp;원&nbsp;&nbsp;</div></td>
					</tr>
					
				</c:if>
				<tr>
					<td colspan="3">
						<div id="inputArea">
							<div id="keepShopping" onclick="document.location='${ctxpath}/main/main.do'">계속 쇼핑하기</div>
							<input type="hidden" name="mid" value="${mid}">
							<input type="submit" value="구매하기"  id="orderTh">
							<input type="hidden" name="flag" value="cart">
						</div>
					</td>
				</tr>
		</table>
		
	</form>
	</div>
</body>
</html>