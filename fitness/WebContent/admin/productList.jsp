<%@page import="product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>productList</title>
	<!-- <link href="../css/adminstyle.css" rel="stylesheet" type="text/css"> -->
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
		#floor1{
			margin:auto;
			margin-top:30px;
			width:1000px;
			height:30px;
			/* border:1px solid black; */
			position:relative;
		}
		#btnN{
			position:absolute;
			left:360px;
			width:100px;
			height:30px;			
			border:1px solid #d9d9d9;
			display:flex;
			justify-content:center;
			align-items:center;
			font-weight:700;
			cursor:pointer
		}
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
		#searchSTH{
			position:absolute;
			left:10px;
			width:350px;
			height:30px;
			/* border:1px solid black; */
		}
		#subTitle{
			margin:auto;
			width:1000px;
			paddin-left:50px;
			font-size:24px;
			font-weight:600;
		}
		#floor2{
			margin:auto;
			width:1000px;
			height:600px;
			border-top:1px solid black;
		}
		.bg{
			width:40px;
			height:20px;
			border:1px solid #808080;
			display:inline-block;
			cursor:pointer
		}
		#deleteB{
			background:red;
			color:white;
			font-weight:500;
		}
		
		#modifyB{
			/* background:#0277e5; */
			background:#346aff;
			color:white;
			font-weight:500;
		}
		table{
			border-collapse: collapse; border-spacing: 0;
			width:100%;
		}
		.tdtd{
			font-weight:700;
			border-bottom:1px solid black;
		}
		tr{
			height:40px;
			padding:0
		}
		td{
			border-bottom:1px solid #d9d9d9;
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
		
		#kk{
			position:relative;
			left:450px;
			width:70px;
			height:25px;
			border:1px solid #eeeeee;
			background:red;
			color:white;
		}
	</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
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
		function changeStatus(p_num, numR){
			var imsi = document.getElementsByClassName("hideProduct")[numR];
			var selectValue=imsi.options[imsi.selectedIndex].value;
			$.ajax({
				type:"GET",
				url:"hideProduct.jsp",
				data:"p_num="+p_num+"&newS="+selectValue,
			});
		}
		function deleteThing(sth){
			var cf = confirm("정말로 지우시겠습니까?");
			
			if(!cf){
				//alert("거절");
				return false;
			}
			//alert("삭제하기");			
			//return true;
			/* document.deleteSTH.action=sth;
			document.deleteSTH.submit(); */
			document.location=sth;
		}
		function modifyThing(sth){
			document.location=sth;
		}
	</script>
</head>
<body>
	
	<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
	<div id="mainCart">
	<div id="logo"  onclick="document.location='${ctxpath}/admin/index.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	<div id="dd">관리자모드</div>
	<div id="cc" onclick="document.location='${ctxpath}/admin/logout.do'">로그아웃</div>
	</div>
	
	<div id="subTitle">*상품관리</div>
	<div id="floor1">
		<div id="searchSTH">
			<form name="searchThings" method="get" action="${ctxpath}/admin/productList.do">
				<select name="keyField" id="selectK">
					<option value="9" selected>선택</option>
					<option value="p.p_num">상품번호</option>
					<option value="p.p_code">상품코드</option>
					<option value="p.p_name">상품명</option>
					<option value="p.p_price">가격</option>
					<option value="p.p_regdate">입고날짜</option>
					<option value="p.p_regdate2">재입고날짜</option>
					<option value="p.p_stock">수량</option>
					<option value="c.c_name">카테고리</option>
					<option value="p.p_company">제조사</option>
					<option value="p.p_hide">비고1</option>
				</select>
				<input type="text" name="keyWord" id="textK">
				<input type="hidden" name="page" value="0">
				<input type="hidden" name="block" value="0">
				<input type="button" value="검색" onclick="searchIt()" id="searchK">
			</form>
		</div>
		<div id="btnN" onclick="document.location='${ctxpath}/admin/insertProduct.do'">새상품 등록</div>
	</div><br>
	<div id="floor2">
		<table>
			<tr>
				<td align="center" class="tdtd">상품번호</td>
				<td align="center" class="tdtd">상품코드</td>
				<td align="center" class="tdtd">상품명</td>
				<td align="center" class="tdtd">가격</td>
				<td align="center" class="tdtd">입고날짜</td>
				<td align="center" class="tdtd">재입고날짜</td>
				<td align="center" class="tdtd">남은수량</td>
				<td align="center" class="tdtd">카테고리</td>
				<td align="center" class="tdtd">제조회사</td>
				<td align="center" class="tdtd">비고1</td>
				<td align="center" class="tdtd">비고2</td>
			</tr>
			<c:if test="${list.size()==0}">
				<tr>
					<td align="center" colspan="11">상품이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${list.size()>0 }">
				<!-- <tr><td>HI</td></tr> -->
				<c:set var="numR" value="0" />
				<c:forEach var="pdto" items="${list}">
					<tr>
						<td align="center" width="65">${pdto.p_num}</td>
						<td align="center" width="65">${pdto.p_code}</td>
						<td width="200"><span style="cursor:pointer;" onclick="document.location='${ctxpath}/admin/clickProductName.do?p_num=${pdto.p_num}'">${pdto.p_name}</span></td>
						<td align="center" width="50"><fmt:formatNumber pattern="#,###" value="${pdto.p_price}" /></td>
						<td align="center">${pdto.p_regdate}</td>
						<c:if test="${empty pdto.p_regdate2}">
						<td align="center">-</td>
						</c:if>
						<c:if test="${!empty pdto.p_regdate2}">
						<td align="center">${pdto.p_regdate2}</td>
						</c:if>
						<td align="center">${pdto.p_stock}</td>
						<td align="center">${pdto.c_name}</td>
						<td align="center">${pdto.p_company }</td>
						<%-- <c:if test="${pdto.p_hide=='y'}">
							<td align="center">보임</td>
						</c:if>
						<c:if test="${pdto.p_hide=='n'}">
							<td align="center">숨김</td>
						</c:if> --%>
						<td align="center">
							<select class="hideProduct" onchange="changeStatus('${pdto.p_num}', '${numR}')">
							<c:if test="${pdto.p_hide eq 'y'}">
								<option value='y' selected>노출</option>
								<option value="n">숨김</option>
							</c:if>
							<c:if test="${pdto.p_hide eq 'n' }">
								<option value="y">노출</option>
								<option value="n" selected>숨김</option>
							</c:if>
							</select>
						</td>
						<td align="center">
						<span id="modifyB" class="bg" onclick="modifyThing('${ctxpath}/admin/modifyForm.do?block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}&p_num=${pdto.p_num}')">수정</span>&nbsp;/&nbsp;
						<span id="deleteB" class="bg" onclick="deleteThing('${ctxpath}/admin/deletePro.do?block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}&p_num=${pdto.p_num}')">
							삭제
							<%-- <a href="${ctxpath}/admin/deletePro.do?block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}&p_num=${pdto.p_num}">삭제</a> --%>
						<%-- <form method="get" name="deleteSTH" action="${ctxpath}/admin/deletePro.do?block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}&p_num=${pdto.p_num}"> --%>
						<%-- <form method="get" name="deleteSTH">
							<input type="button" value="삭제" onclick="deleteThing('${ctxpath}/admin/deletePro.do?block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}&p_num=${pdto.p_num}')">
						</form> --%>
						</span>
						</td>
					</tr>
					<c:set var="numR" value="${numR+1}"/>
				</c:forEach>
			</c:if>
			
			<tr>
				<td align="center" colspan="11">
					<%-- 레코드가 하나라도 존재하면 --%>
					<c:if test="${totalRecord!=0}">
						<%-- 맨처음블럭의 첫페이지로가기 처리 --%>
						<%-- <c:if test="${currentBlock>0}"> --%>
							<a href="${ctxpath}/admin/productList.do?block=0&page=0&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/doubleleft.png" width="10px" height="10px"></a>
						<%-- </c:if> --%>
						<%-- 이전블럭처리 --%>
						<c:if test="${currentBlock==0}">
							<a href="#"><img src="${ctxpath}/img/singleleft.png" width="10px" height="10px"></a>
						</c:if>
						<c:if test="${currentBlock>0}">
							<a href="${ctxpath}/admin/productList.do?block=${currentBlock-1}&page=${(currentBlock-1)*pagePerBlock}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/singleleft.png"></a>
						</c:if>
						
						<%-- 페이지처리 --%>
						<c:set var="loop_flag" value="false"/>
						<c:forEach var="i" begin="1" end="${pagePerBlock}" step="1">
							<c:if test="${not loop_flag}">
								<c:if test="${i==(currentPage+1)}">
								${i}
								</c:if>
								<c:if test="${i!=(currentPage+1)}">
								<a href="${ctxpath}/admin/productList.do?block=${currentBlock}&page=${currentBlock*pagePerBlock+i-1}&keyField=${keyField}&keyWord=${keyWord}">&nbsp;${i}</a>
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
							<a href="${ctxpath}/admin/productList.do?block=${currentBlock+1}&page=${(currentBlock+1)*pagePerBlock}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/singleright.png"></a>							
						</c:if>
						
						<%-- 맨마지막블럭의 마지막페이지로 가기 처리--%>
						<%-- <c:if test="${totalBlock}" --%>
						<a href="${ctxpath}/admin/productList.do?block=${totalBlock-1}&page=${totalPage-1}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/doubleright.png" width="10px" height="10px"></a>
						
					</c:if>
				</td>
			</tr>
		</table>
		
	</div>
</body>
</html>