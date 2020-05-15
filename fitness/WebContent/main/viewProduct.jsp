<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%=request.getContextPath()%>"/>
<c:set var="mid" value="${mid}"/>
<html>
<head>
<meta charset="UTF-8">
<title>viewProductPage</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
	<style>
		a:link { color:red; text-decoration: none;}
		a:hover { color:blue; text-decoration: underline;}
		/* a:visited { color:black; text-decoration: none;} */
		#cart, #user, #headText, #floor2{
			cursor:pointer;
		}
		#cart{
			position:relative;
			width:50px;
			height:50px;
			margin-left:20px;						
		}
		
		#cartIcon{
			position:relative;
			left:0px;
			top:-18px;
			display:flex;
			align-items:center;
			justify-content:center;
			
		}
		#cartText{
			position:relative;
			top:-18px;
			font-size:10px;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		#cartInform{
			position:relative;
			top:0px;
			left:35px;
			width:18px;
			height:18px;
			border:1px solid #346aff;
			border-radius:50px;
			background:#346aff;
			display:flex;
			justify-content:center;
			align-items:center;
			z-index:10;
			color:white;
		}
	
		#viewProductPage{
			position:relative;
			top:100px;
			margin:auto;
			width:1100px;
			height:600px;
			border:1px solid #eeeeee;
			padding:0px;
			display:flex;
			justify-content:center;
			align-items:center;
		}
		

		#imagePart{
			position:relative;
			display:inline-block;
			top:0px;
			left:10px;
			width:540px;
			height:600px;
			
		}
		#rImage{
			display:flex;
			justify-content:center;
			align-items:center;
			width:100%;
			height:100%;
		}
		#informationPart{
			position:relative;
			display:inline-block;
			top:0px;
			left:10px;
			width:530px;
			height:600px;
		}
		.infoFloor{
			padding-left:10px;
			width:520px;
			height:60px;
			border-bottom:1px solid #eeeeee;
			margin-top:2px;
		}
		
		
		.infoChild1{
			width:90px;
			height:58px;
			float:left;
			font-size:18px;
			font-weight:600;
			border-right:1px solid #cccccc;
		}
		.infoChild2{
			width:415px;
			height:58px;
			float:left;
			padding-left:10px;
		}
		#pname{
			font-size:20px;
			font-weight:700;
		}
		#rCode, #rDeliver{
			font-size:18px;
			font-weight:600;
		}
		#rCompany{
			font-size:18px;
			font-weight:600;
			color:green;
		}
		#rComment{
			font-size:16px;
			font-wight:600;
		}
		#rPrice{
			font-size:18px;
			font-weight:700;
			color:#ae0000;
		}
		
		
		#infoBottom{
			width:100%;
			height:100%;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		
		#ibButton1{
			width:180px;
			height:35px;
			background:white;
			color:#346aff;
			font-size:18px;
			border:1px solid #346aff;
			margin-left:10px;
			display:flex;
			align-items:center;
			justify-content:center;
			cursor:pointer;
		}
		#ibButton2{
			width:180px;
			height:35px;
			background:#346aff;
			color:white;
			font-size:18px;
			border:1px solid white;
			margin-left:10px;
			display:flex;
			align-items:center;
			justify-content:center;
			cursor:pointer;
		}
		#ibN{
			width:50px;
			height:35px;			
		}
		
		#showCart{
			display:none;
			position:relative;
			top:10px;
			left:115px;
			width:165px;
			height:100px;
			border:1px solid #d9d9d9;
			background:white;
		}
		#moveIntoCart{
			padding-top:12px;
			color:black;
			font-size:10px;
			font-weight:600;
			width:140px;
			height:20px;
			padding-left:15px;
		}
		#cartBu{
			margin:auto;
			margin-top:20px;
			font-size:13px;
			font-weight:600;
			width:130px;
			height:40px;
			background:#346aff;
			color:white;
			display:flex;
			justify-content:center;
			align-items:center;
			cursor:pointer;
		}
		#page-container2 {
  position: relative;
  min-height:75vh;
  
}

#content-wrap2 {
  padding-bottom:6rem;
}

#footer2 {
	background:#d9d9d9;
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 6rem; 
}
#footer12{
	margin:auto;
	width:1100px;
	height:6rem;
	display:flex;
	justify-content:center;
	align-items:center;	
}
.footC2{
	margin-left:20px;
	
}

		
	</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	function viewCart(mid){
		if(mid==""){
			document.location='/fitness/main/loginForm.do';
		}else{
			document.location='/fitness/main/viewCart.do?mid='+mid;
		}
		
	}
	function goToOrderForm(mid, p_num, p_name, p_price){
		//alert(mid + " " + p_num + " " + p_name + " " + p_price);
		/* if(mid==""){
			document.location='/fitness/main/loginForm.do';
		}else{
			document.location='/fitness/main/orderProductPro.do?flag=cart&mid='+mid"&p_num="+p_num+"&cart_quantity="+document.getElementById("ibN").value;
		} */
		//'${mid}','${viewdto.p_num}','${viewdto.p_name}','${viewdto.p_price}'
		if(mid==""){
			document.location='/fitness/main/loginForm.do';
		}else{
			document.location='/fitness/main/orderProduct22.do?mid='+mid+"&p_num="+p_num+"&pname="+p_name+"&price="+p_price+"&quantity="+document.getElementById("ibN").value;
		}
	}
	function onloading(mid, tot){
		if(!mid){
			$("#cartInform").text(0);
		}else{
			$.ajax({
				type:"GET",
				url:"getTotalCart.jsp",
				data:"mid="+mid,
				dataType:'JSON',
				success:function(data){
					$("#cartInform").text(data.total);						
				}//end success
			});//end ajax
		}
	}
	function viewMyPage(mid){
		if(!mid){
			document.location='/fitness/main/loginForm.do';
		}else{
			document.location='/fitness/main/beforeViewMyPage.do?mid='+mid;
		}
		
	}
	function categoryIn(){
		document.getElementById("firstC").style.display="inline-block";
	}
	function categoryOut(){
		document.getElementById("firstC").style.display="none";
	}
	function menuIn(n){
		var id = "menu"+n;
		document.getElementById(id).style.display="inline-block";
	}
	function menuOut(n){
		var id= "menu"+n;
		document.getElementById(id).style.display="none";
	}
	function boardIn(){
		document.getElementById("board").style.display="inline-block";			
	}
	
	function boardOut(){
		document.getElementById("board").style.display="none";
	}
	/* function sscroll(){
		if(document.documentElement.scrollTop >=150){
			alert("HI");
			document.getElementById("floor2").style.position="fixed";
			document.getElementById("floor2").style.top="0px";				
		}else{
			document.getElementById("floor2").style.position="absolute";
			document.getElementById("floor2").style.top="150px";
		}
	} */
	
	
	/* document.onscroll=sscroll; */
	$(window).scroll(function(){
		//var scrollValue=$(document).scrollTop();
		//$("#testt").text(scrollValue);
		//console.log(scrollValue);
		if($(document).scrollTop()>=150){
			$("#floor2").css("position","fixed");
			$("#floor2").css("top","0px");		
		}else{
			$("#floor2").css("position", "absolute");
			$("#floor2").css("top","150px");
		}
		
	});
	function addProductToCart(mid, p_num){
		if(!mid){
			document.location='/fitness/main/loginForm.do';
		}else{
			$.ajax({
				type:"GET",
				url:"addProductToCart.jsp",
				data:"mid="+mid+"&p_num="+p_num+"&cart_quantity="+document.getElementById("ibN").value,
				dataType:'JSON',
				success:function(data){
					//alert("check:"+data.check);
					$("#cartInform").text(data.check);
					/* if(data.check==1){//유효한 아이디와 패스워드		
						alert("111");
						$("#cartInform").text(1);
					}else{//불허받음
						$("#cartInform").text(0);
					} *///end else
				}//end success
			});//end ajax
			
			document.getElementById("showCart").style.display="inline-block";
			setTimeout(function(){
				document.getElementById("showCart").style.display="none";
			}, 3000)
		}
	}
	
	
	</script>
</head>
<body onload="onloading('${mid}','${cartT}')">
	<%-- <% String mid = (String)session.getAttribute("mid"); 
		if(mid.length()!=0){
			%>
			<script>
				alert("HIHI"+"<%= mid %>");
			</script>
			<%
		}
	%> --%>
	
	<div id="floor1">
		<div id="floor1-1">
			<div id="floor1-1-right">
				<ul>
					<li>+즐겨찾기</li>
					<c:if test="${empty mid}">
						<li><a href="${ctxpath}/main/loginForm.do">로그인</a></li>
						<li><a href="${ctxpath}/main/signIn.do">회원가입</a></li>
					</c:if>
					<c:if test="${!empty mid}">
						<li><a href="${ctxpath}/main/logOutPro.do">로그아웃</a></li>
						<li style="display:none;"></li>
					</c:if>
					<c:if test="${!empty mid}">
						<li><a href="${ctxpath}/main/retrieveMyOrders.do?mid=${mid}">주문조회</a></li>
					</c:if>
					<c:if test="${empty mid }">
						<li><a href="${ctxpath}/main/loginForm.do">주문조회</a></li>
					</c:if>
					<li>관심상품</li>
					<li><a href="${ctxpath}/main/viewFAQBoard.do?flag=userF">FAQ</a></li>
					
				</ul>
			</div>
		</div>
		<div id="floor1-2">
			<div id="floor1-2-left">
				<div id="headTextArea" class="leftitem">
					<div id="headText" onclick="document.location='${ctxpath}/main/main.do'"><span id="logo0">운동</span><span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span  id="logo4">들</span></div>
				</div>
				<div id="searchSomething" class="leftitem">
					<form>
						<div id="searchCon">
							<input id="searchLeft" type="text">
							<span id="searchRight"><img src="../img/search.png" width="15px" height="15px"></span>
						</div>
					</form>
				</div>
			</div>
			<div id="floor1-2-right">
				<div id="user" onclick="viewMyPage('${mid}')">
					<div id="userIcon"><img src="../img/user.png" width="40px" height="40px"></div>
					<div id="userText"><b>마이페이지</b></div>
				</div>
				<div id="cart" onclick="viewCart('${mid}')">
					<div id="cartInform"></div>
					<div id="cartIcon"><img src="../img/cart.png" width="40px" height="40px"></div>
					<div id="cartText"><b>장바구니</b></div>
				</div>
			</div>
		</div>
	</div>
	<div id="floor2">
		<div id="item1">
			<div id="box"  class="layer-item">
				<div id="category" onMouseOver="categoryIn()" onMouseOut="categoryOut()">
					<div id="xx"><img src="../img/list.png" width="15px" height="15px">카테고리</div>
					<div id="firstC">				
						<ul id="ul1">
							<li class="li0" onMouseOver="menuIn(0)" onMouseOut="menuOut(0)">헬스보충식품
								<div id="menu0">
									<ul class="ul2">
										<li class="lili"><a href="${ctxpath}/main/mainList.do?flag=protein">프로틴</a></li>
										<li class="lili">크레아틴</li>
										<li class="lili">아미노산</li>
										<li class="lili">기타 헬스보조제</li>
									</ul>
								</div>
							</li>
							<li class="li1" onMouseOver="menuIn(1)" onMouseOut="menuOut(1)">바이오엑스
								<div id="menu1">
									<ul class="ul2">
										<li class="lili">단백질(근육발달)</li>
										<li class="lili">게이너(체중+근육)</li>
										<li class="lili">BCAA/아미노산/기타</li>										
									</ul>
								</div>
							</li>
							<li class="li2" onMouseOver="menuIn(2)" onMouseOut="menuOut(2)">고릴라웨어
								<div id="menu2">
									<ul class="ul2">
										<li class="lili">탱크탑</li>
										<li class="lili">티셔츠</li>
										<li class="lili">후드</li>
										<li class="lili">숏츠</li>
										<li class="lili">팬츠</li>
										<li class="lili">타이즈</li>										
									</ul>
								</div>
							</li>
							<li class="li3" onMouseOver="menuIn(3)" onMouseOut="menuOut(3)">GASP
								<div id="menu3">
									<ul class="ul2">
										<li class="lili">탱크탑</li>
										<li class="lili">반팔티</li>
										<li class="lili">긴팔티</li>
										<li class="lili">후드/자켓</li>
										<li class="lili">숏츠</li>
										<li class="lili">팬츠/타이즈</li>										
									</ul>
								</div>
							</li>
							<li class="li4" onMouseOver="menuIn(4)" onMouseOut="menuOut(4)">베러바디
								<div id="menu4">
									<ul class="ul2">
										<li class="lili">여성의류</li>
										<li class="lili">남성의류</li>
									</ul>
								</div>
							</li>
							<li class="li5" onMouseOver="menuIn(5)" onMouseOut="menuOut(5)">아이소백
								<div id="menu5">
									<ul class="ul2">
										<li class="lili">도시락가방</li>
										<li class="lili">용기/아이스팩</li>
									</ul>
								</div>
							</li>
							<li class="li6" onMouseOver="menuIn(6)" onMouseOut="menuOut(6)">헬스용품
								<div id="menu6">
									<ul class="ul2">
										<li class="lili">장갑</li>
										<li class="lili">스트랩/훅</li>
										<li class="lili">손목보호대</li>
										<li class="lili">팔꿈치보호대</li>
										<li class="lili">벨트</li>
										<li class="lili">저항밴드</li>										
									</ul>
								</div>
							</li>
							<li class="li7" onMouseOver="menuIn(7)" onMouseOut="menuOut(7)">역도화(스쿼트화)
								<div id="menu7">
								
								</div>
							</li>
							<li class="li8" onMouseOver="menuIn(8)" onMouseOut="menuOut(8)">요가/필라테스용품
								<div id="menu8">
									<ul class="ul2">
										<li class="lili">매트</li>
										<li class="lili">폼롤러</li>
										<li class="lili">스트레칭밴드</li>
										<li class="lili">요가링</li>
									</ul>
								</div>
							</li>
							<li class="li9" onMouseOver="menuIn(9)" onMouseOut="menuOut(9)">가방/모자/액세서리
								<div id="menu9">
									<ul class="ul2">
										<li class="lili">가방</li>
										<li class="lili">모자</li>
										<li class="lili">액세서리</li>
									</ul>
								</div>
							</li>
							<li class="li10" onMouseOver="menuIn(10)" onMouseOut="menuOut(10)">쉐이커용기
								<div id="menu10">
								
								</div>
							</li>
							<li class="li11" onMouseOver="menuIn(11)" onMouseOut="menuOut(11)">할인
								<div id="menu11">
									<ul class="ul2">
										<li class="lili">남성의류</li>
										<li class="lili">여성의류</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="layer-item">2020 의류할인 기획전</div>
			<div class="layer-item">베르사그립 정품등록혜택</div>
			<div id="brn" class="layer-item">브랜드소개</div>
			<div id="f2-right">
				<ul id="f2ul">
					<li><img src="../img/home.png" width="10px" height="10px">아지트</li>
					<li>카페</li>
					<li onmouseover="boardIn()" onmouseout="boardOut()">						
						<div id="boardTxt">게시판모음<img src="../img/down-arrow.png" width="10px" height="10px"></div>
						<ul id="board"> 
							<li><a href="${ctxpath}/main/viewNoticeBoard.do?flag=userN">공지사항</a></li>
							<li><a href="${ctxpath}/main/viewQNABoard.do?flag=userQ">질문과답변</a></li>
							<li>입고문의</li>
							<li>베르사그립정품등록</li>
							<li>서포터즈/협찬신청</li>
							<li>오류신고/제안</li>
						</ul>						
					</li>
					
				</ul>
			</div>
		</div>
	</div>
	<%-- 1100, 600 ////--%>
	
	<div id="viewProductPage">
		<div id="imagePart">
			<div id="rImage"><img src="${ctxpath}/productImgs/${viewdto.p_image}" width="60%" height="60%"></div>
		</div>
		<div id="informationPart">
			<%-- <div class="infoFloor">${viewdto.p_code}</div>
			<div class="infoFloor">${viewdto.p_name}</div>
			<div class="infoFloor"><fmt:formatNumber value="${viewdto.p_price}" pattern="#,###" />&nbsp;원</div>
			<div class="infoFloor"></div>
			<div class="infoFloor"><span id="comp">제조사&nbsp;:&nbsp;${viewdto.p_company}</span></div>
			<div class="infoFloor">${viewdto.p_comment}</div> --%>
			<div class="infoFloor"><span id="pname">${viewdto.p_name}</span></div>
			<div class="infoFloor"><div class="infoChild1">상품코드</div><div class="infoChild2"><span id="rCode">${viewdto.p_code}</span></div></div>
			<div class="infoFloor"><div class="infoChild1">가격</div><div class="infoChild2"><span id="rPrice"><fmt:formatNumber value="${viewdto.p_price}" pattern="#,###" />&nbsp;원</span></div></div>
			<div class="infoFloor"><div class="infoChild1">배송업체</div><div class="infoChild2"><span id="rDeliver">SJ Express</span></div></div>
			<div class="infoFloor"><div class="infoChild1">제조사</div><div class="infoChild2"><span id="rCompany">${viewdto.p_company}</span></div></div>
			<div class="infoFloor"><div class="infoChild1">상품정보</div><div class="infoChild2"><span id="rComment">${viewdto.p_comment}</span></div></div>
			<!-- <div class="infoFloor"><input id="rQty" type="number" name="qty" value="1" max="100" min="0" step="1"/></div> -->
			<div class="infoFloor">
				<div id="infoBottom"> 
					<input id="ibN" type="number" value="1" min="1" max="100" step="1">
					<div id="ibButton1" onclick="addProductToCart('${mid}', '${viewdto.p_num}')"><span>장바구니 담기</span></div>
					<div id="ibButton2" onclick="goToOrderForm('${mid}','${viewdto.p_num}','${viewdto.p_name}','${viewdto.p_price}')">바로구매</div>
				</div>
				<%-- <div id="showCart"><div id="moveIntoCart">상품이 장바구니에 담겼습니다</div><div id="cartBu" onclick="viewCart('${mid}')">장바구니</div></div> --%>
				<div id="showCart"><div id="cartBu" onclick="viewCart('${mid}')">장바구니</div><div id="moveIntoCart">상품이 장바구니에 담겼습니다</div></div>
			</div>
		</div><!-- rCode, rPrice, rDelivery, rCompany, rComment -->
	</div>
	
	
	
	
	<div id="page-container2">
    <div id="content-wrap2">
      <!-- all other page content -->
    </div>
    <footer id="footer2">
    	<div id="footer12">
    		<div class="footC2">
    			Fitness
    		</div>
    		<div class="footC2">
    			경영기술개발원  			    			
    		</div>
    		<div class="footC2">
    			서울시 구로구 구로5동
    		</div>
    		<div class="footC2">
    			전화번호 1234-1234
    		</div>
    		<div class="footC2">
    			email : help@naver.com
    		</div>
    	</div>
    </footer>
  </div>
</body>
</html>