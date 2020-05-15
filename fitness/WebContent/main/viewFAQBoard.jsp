<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxpath" value="<%=request.getContextPath()%>"/>
<c:set var="mid" value="${mid}"/>
<html>
<head>
<meta charset="UTF-8">
<title>fitness</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
	<style>
		a:link { color:red; text-decoration: none;}
		a:hover { color:blue; text-decoration: underline;}
		/* a:visited { color:black; text-decoration: none;} */
		#cart, #user, #headText, #floor2{
			cursor:pointer;
		}
		#floor3{
			margin:auto;
			width:1100px;
			height:800px;
			border-top:1px solid black;
		}
		#noticeR{
			position:relative;
			top:100px;
			margin:auto;
			margin-top:20px;			
			width:1100px;
			height:50px;
			font-size:24px;
			font-weight:600;
		}
		table{
			border-collapse: collapse; border-spacing: 0;
			width:100%;
		}
		tr{
			height:40px;
			padding:0
		}
		td{
			border-bottom:1px solid #d9d9d9;
		}
		.tdtd{
			font-weight:700;
			border-bottom:1px solid black;
		}
		#searchF{
			/* clear:both; */
			/* border:1px solid black; */
			width:1100px;
			height:40px;
			margin:auto;
			margin-top:10px;
			float:right;
			display:flex;
			align-items:center;
			justify-content:center;
			z-index:100;
		}
		#selectK{
			
			height:30px;
			float:left;
		}
		#textK{
			height:30px;
			float:left;
		}
		#searchK{
			float:left;
			height:30px;
		}
		#searchSTH{
			width:350px;
			height:30px;
			/* border:1px solid black; */
		}
	</style>
	<script>
//		 #main{ /* 사용자에게 보여주는 영역 */
//			margin:auto;
//			width:400px;
//			height:300px;
//			/* border:1px solid black; */
//			overflow:hidden;
//		}
//		#img{ /* 그림이 담긴 영역 */
//			width:3500px;
//			height:300px;
//			/* border:1px solid red; */
//		}
	</script>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
/* 	$(function(){
		setInterval(function(){
			$("#img").animate({
				marginLeft:"-400px"
			}, function(){
				$("#img").css("marginLeft", "0px");
				$(".pkc").eq(0).insertAfter($(".pkc").eq(7));
			})
		},1000);
	}); */
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
	function viewCart(mid){
		if(!mid){
			document.location='/fitness/main/loginForm.do';
		}else{
			document.location='/fitness/main/viewCart.do?mid='+mid;
		}
		
	}
	function viewMyPage(mid){
		if(!mid){
			document.location='/fitness/main/loginForm.do';
		}else{
			document.location='/fitness/main/beforeViewMyPage.do?mid='+mid;
		}
		
	}
	
	function searchIt(){
		if(!document.searchThings.keyWord.value){
			return false;
		}
		if(document.searchThings.keyField.value=="9"){
			return false;
		}
		//alert("HI");
		//alert(document.searchThings.keyWord.value);
		//alert(document.searchThings.keyField.value);
		document.searchThings.submit();
	}
	
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
	<div id="noticeR">FAQ</div>
	<div id="floor3">	
		
		<table>
			<tr>
				<td align="center" class="tdtd">게시번호</td>
				<td align="center" class="tdtd">카테고리</td>
				<td align="center" class="tdtd">제목</td>
				<td align="center" class="tdtd">작성자</td>
				<td align="center" class="tdtd">작성일</td>
				<td align="center" class="tdtd">조횟수</td>
			</tr>
			<c:if test="${list.size()==0}">
				<tr>
					<td align="center" colspan="6">게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${list.size()>0 }">
				<!-- <tr><td>HI</td></tr> -->
				<c:forEach var="nbdto" items="${list}">
					<tr>
						<td align="center">${nbdto.nb_num}</td>
						<c:if test="${nbdto.bc_num==3}">
							<td align="center">FAQ</td>
						</c:if>
						
						<td align="center"><span style="cursor:pointer;" onclick="document.location='${ctxpath}/main/clickNoticeName.do?nb_num=${nbdto.nb_num}'">${nbdto.nb_subject}</span></td>
						<td align="center">${nbdto.id}</td>				
						
						<td align="center">${nbdto.nb_date}</td>
						
						
						<td align="center">${nbdto.nb_count}</td>
						
						
					</tr>
				</c:forEach>
			</c:if>
			
			<tr>
				<td align="center" colspan="6">
					<%-- 레코드가 하나라도 존재하면 --%>
					<c:if test="${totalRecord!=0}">
						<%-- 맨처음블럭의 첫페이지로가기 처리 --%>
						<%-- <c:if test="${currentBlock>0}"> --%>
							<a href="${ctxpath}/main/viewNoticeBoard.do?flag=userN&block=0&page=0&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/doubleleft.png" width="10px" height="10px"></a>
						<%-- </c:if> --%>
						<%-- 이전블럭처리 --%>
						<c:if test="${currentBlock==0}">
							<a href="#"><img src="${ctxpath}/img/singleleft.png" width="10px" height="10px"></a>
						</c:if>
						<c:if test="${currentBlock>0}">
							<a href="${ctxpath}/main/viewNoticeBoard.do?flag=userN&block=${currentBlock-1}&page=${(currentBlock-1)*pagePerBlock}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/singleleft.png"></a>
						</c:if>
						
						<%-- 페이지처리 --%>
						<c:set var="loop_flag" value="false"/>
						<c:forEach var="i" begin="1" end="${pagePerBlock}" step="1">
							<c:if test="${not loop_flag}">
								<c:if test="${i==(currentPage+1)}">
								${i}
								</c:if>
								<c:if test="${i!=(currentPage+1)}">
								<a href="${ctxpath}/main/viewNoticeBoard.do?flag=userN&block=${currentBlock}&page=${currentBlock*pagePerBlock+i-1}&keyField=${keyField}&keyWord=${keyWord}">&nbsp;${i}</a>
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
							<a href="${ctxpath}/main/viewNoticeBoard.do?flag=userN&block=${currentBlock+1}&page=${(currentBlock+1)*pagePerBlock}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/singleright.png"></a>							
						</c:if>
						
						<%-- 맨마지막블럭의 마지막페이지로 가기 처리--%>
						<%-- <c:if test="${totalBlock}" --%>
						<a href="${ctxpath}/main/viewNoticeBoard.do?flag=userN&block=${totalBlock-1}&page=${totalPage-1}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/doubleright.png" width="10px" height="10px"></a>
						
					</c:if>
				</td>
			</tr>
		</table>
		
		<div id="searchF">
		<div id="searchSTH">
			<form name="searchThings" method="get" action="${ctxpath}/main/viewNoticeBoard.do">
				<select name="keyField" id="selectK">
					<option value="9" selected>선택</option>
					<option value="nb.nb_num">게시번호</option>
					<option value="bc.bc_name">카테고리</option>
					<option value="nb.nb_subject">제목</option>
					<option value="ad.id">작성자</option>
					<option value="nb.nb_date">작성일</option>
					<option value="nb.nb_count">조횟수</option>
				</select>
				<input type="hidden" name="flag" value="userF">
				<input type="text" name="keyWord" id="textK">
				<input type="hidden" name="page" value="0">
				<input type="hidden" name="block" value="0">
				<input type="button" value="검색" onclick="searchIt()" id="searchK">
			</form>
		</div>
	</div><br>
		
	</div>
	<div id="page-container">
    <div id="content-wrap">
      <!-- all other page content -->
    </div>
    <footer id="footer">
    	<div id="footer1">
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
    </footer>
  </div>
</body>
</html>