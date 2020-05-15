<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%=request.getContextPath()%>"/>
<html>
<head>
<meta charset="UTF-8">
<title>mainList</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
	<style>
		a:link { color:red; text-decoration: none;}
		a:hover { color:blue; text-decoration: underline;}
		/* a:visited { color:black; text-decoration: none;} */
		#cart, #user, #headText, #floor2{
			cursor:pointer;
		}
		#floor3s{
			position:relative;
			top:100px;
			clear:both;
			margin:auto;
			/* height:1500px; */
			width:1100px;
			/* background:#d9d9d9; */
			/* display:flex;
			justify-content:center;
			align-items:center; */
		}
		#floor3s-category{
			width:1100px;
			height:30px;
			/* border:1px solid black; */
			font-size:24px;
			font-weight:700;
			padding-left:90px;
		}
		.item3s{
			display:inline-block;
			float:left;		
			margin-left:87px;
			margin-top:33px;
			width:250px;
			height:340px;
			border:1px solid #eeeeee;
			cursor:pointer;
		}
		.item3s-image{
			width:250px;
			height:250px;
			/* border:1px solid black; */
			margin-bottom:12px;
		}
		.item3s-subject{
			padding-left:5px;
			margin-top:3px;
			height:45px;
			width:250px;
			/* border:1px solid black; */
			font-weight:600;
		}
		.item3s-price{
			padding-left:5px;
			height:35px;
			width:250px;
			/* border:1px solid black; */
			font-weight:600;
			color:#ae0000;
		}
		
		#floor4s{
			clear:both;
			position:relative;
			top:150px;
			margin:auto;
			width:1100px;
			/* height:30px; */
			/* border:1px solid black; */
			display:flex;
			align-items:center;
			justify-content:center;
			margin-bottom:50px;
		}
		#page-container2 {
  position: relative;
  min-height:75vh;
  
}

#content-wrap2 {
  padding-bottom:6rem;    /* Footer height */
}

#footer2 {
	background:#d9d9d9;
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 6rem;            /* Footer height */
}
#footer12{
	/* border:1px solid black; */
	margin:auto;
	/* background:white; */
	width:1100px;
	height:6rem;
	display:flex;
	justify-content:center;
	align-items:center;	
}
.footC2{
	/* border:1px solid black; */
	margin-left:20px;
	
}
	#realBottom{
		clear:both;
		position:relative;
		top:150px;
		margin:auto;
		width:1100px;
		height:80px;
		/* border:1px solid black; */
		display:flex;
		align-items:center;
		justify-content:center;
		background:#f2f2f2;
	}
		
	</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	function onloading(mid, tot){
		/* if(!mid){
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
		} */
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
	function height(rows){
		setTimeout(function(){
			document.getElementById("floor3s").style.height=rows*300;
		},100);
	}
	function viewMyPage(mid){
		if(!mid){
			document.location='/fitness/main/loginForm.do';
		}else{
			document.location='/fitness/main/beforeViewMyPage.do?mid='+mid;
		}
		
	}
	function viewCart(mid){
		if(!mid){
			document.location='/fitness/main/loginForm.do';
		}else{
			document.location='/fitness/main/viewCart.do?mid='+mid;
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
	
	</script>
</head>
<body onload="onloading('${mid}','${cartT}'); height('${rows}')">
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
					<c:set var="mid" value="${mid}"/>
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
	<%-- 1100, 600 //--%>
	<div id="floor3s">
		<c:if test="${flag eq 'protein' }">
		<div id="floor3s-category">프로틴</div>
		</c:if>
		<%-- <c:set var="finishLoop" value="true" />
		<c:forEach var="maindto" items="${list}">
		<c:forEach var="i" begin="1" end="5" step="1">
			<c:forEach var="j" begin="1" end="3" step="1">
				<c:if test="${finishLoop==true}">
				<c:if test="${i==rows and j==cols}">
					<c:set var="finishLoop" value="false"/>
				</c:if>
				<div class="item3s">
					<img src="${ctxpath}/productImgs/${maindto.p_image}" width="100px" height="100px"><br>
					${maindto.p_name}<br>
					${maindto.p_price}원<br>
				</div>
				</c:if>
			</c:forEach>
			<br>
		</c:forEach> 
		</c:forEach> --%>
		<c:forEach var="maindto" items="${list}">
			<div class="item3s" onclick="document.location='${ctxpath}/main/viewProduct.do?flag=${flag}&p_num=${maindto.p_num}&block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}'">
					<div class="item3s-image"><img src="${ctxpath}/productImgs/${maindto.p_image}" width="100%" height="100%"></div>
					<div class="item3s-subject">${maindto.p_name}</div>
					<%-- <div class="item3s-price">${maindto.p_price}원</div> --%>
					<div class="item3s-price"><fmt:formatNumber value="${maindto.p_price }" pattern="#,###" />&nbsp;원</div>
				</div>
		</c:forEach>
		
	</div>
	<div id="floor4s">
		
	<%-- 레코드가 하나라도 존재하면 --%>
	<c:if test="${totalRecord!=0}">
		<%-- 맨처음블럭의 첫페이지로가기 처리 --%>
		<%-- <c:if test="${currentBlock>0}"> --%>
			<a href="${ctxpath}/main/mainList.do?flag=${flag}&block=0&page=0&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/doubleleft.png" width="10px" height="10px"></a>
		<%-- </c:if> --%>
		<%-- 이전블럭처리 --%>
		<c:if test="${currentBlock==0}">
			<a href="#"><img src="${ctxpath}/img/singleleft.png" width="10px" height="10px"></a>
		</c:if>
		<c:if test="${currentBlock>0}">
			<a href="${ctxpath}/main/mainList.do?flag=${flag}&block=${currentBlock-1}&page=${(currentBlock-1)*pagePerBlock}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/singleleft.png"></a>
		</c:if>
		
		<%-- 페이지처리 --%>
		<c:set var="loop_flag" value="false"/>
		<c:forEach var="i" begin="1" end="${pagePerBlock}" step="1">
			<c:if test="${not loop_flag}">
				<c:if test="${i==(currentPage+1)}">
				${i}
				</c:if>
				<c:if test="${i!=(currentPage+1)}">
				<a href="${ctxpath}/main/mainList.do?flag=${flag}&block=${currentBlock}&page=${currentBlock*pagePerBlock+i-1}&keyField=${keyField}&keyWord=${keyWord}">&nbsp;${i}</a>
				</c:if>
				<c:if test="${(currentBlock*pagePerBlock+i)==totalPage}">
					<c:set var="loop_flag" value="true"/>
				</c:if>
			</c:if>	
		</c:forEach>
		
		<%-- 다음블럭처리 --%>
		<c:if test="${totalBlock==(currentBlock+1)}">
			<a href="#"><img src="${ctxpath}/img/singleright.png" width="10px" height="10px"></a>
		</c:if>
		<c:if test="${totalBlock>(currentBlock+1)}">
			<a href="${ctxpath}/main/mainList.do?flag=${flag}&block=${currentBlock+1}&page=${(currentBlock+1)*pagePerBlock}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/singleright.png"></a>							
		</c:if>
		
		<%-- 맨마지막블럭의 마지막페이지로 가기 처리--%>
		<%-- <c:if test="${totalBlock}" --%>
		<a href="${ctxpath}/main/mainList.do?flag=${flag}&block=${totalBlock-1}&page=${totalPage-1}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/doubleright.png" width="10px" height="10px"></a>
		
	</c:if>
				
	</div>
	
	<div id="realBottom">
		<div class="footC">
    			Fitness
    		</div>
    		<div class="footC">
    			경영기술개발원  			    			
    		</div>
    		<div class="footC">
    			서울시 구로구 구로5동
    		</div>
    		<div class="footC">
    			전화번호 1234-1234
    		</div>
    		<div class="footC">
    			email : help@naver.com
    		</div>
	</div>
<!--  	<div id="page-container2">
    <div id="content-wrap2">
      all other page content
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
  </div>-->
</body>
</html>