<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>membersList</title>
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
		#subTitle{
			margin:auto;
			width:1000px;
			paddin-left:50px;
			font-size:24px;
			font-weight:600;
		}
		#floor1{
			margin:auto;
			margin-top:30px;
			width:1000px;
			height:30px;
			/* border:1px solid black; */
			position:relative;
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
		#floor2{
			margin:auto;
			width:1000px;
			height:600px;
			border-top:1px solid black;
		}
		.bg{
			width:60px;
			height:25px;
			border:1px solid #808080;
			cursor:pointer;
		}
	</style>
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
	</script>
</head>
<body>
	<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
	<div id="mainCart">
	<div id="logo"  onclick="document.location='${ctxpath}/admin/index.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	<div id="dd">관리자모드</div>
	<div id="cc" onclick="document.location='${ctxpath}/admin/logout.do'">로그아웃</div>
	</div>
	<div id="subTitle">*회원관리</div>
	<div id="floor1">
		<div id="searchSTH">
			<form name="searchThings" method="get" action="${ctxpath}/admin/boardList.do">
				<select name="keyField" id="selectK">
					<option value="9" selected>선택</option>
					<option value="mno">회원번호</option>
					<option value="mid">ID</option>
					<option value="mname">회원명</option>
					<option value="mnumber">연락처</option>
					<option value="memail">이메일</option>
					<option value="msignindate">가입일</option>
				</select>
				<input type="text" name="keyWord" id="textK">
				<input type="hidden" name="flag" value="members">
				<input type="hidden" name="page" value="0">
				<input type="hidden" name="block" value="0">
				<input type="button" value="검색" onclick="searchIt()" id="searchK">
			</form>
		</div>
	</div><br>
	
	<div id="floor2">
		<table>
			<tr>
				<td align="center" class="tdtd">회원번호</td>
				<td align="center" class="tdtd">ID</td>
				<td align="center" class="tdtd">회원명</td>
				<td align="center" class="tdtd">연락처</td>
				<td align="center" class="tdtd">이메일</td>
				<td align="center" class="tdtd">가입일</td>
				<td align="center" class="tdtd">비고</td>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td align="center" colspan="11">해당 회원이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<!-- <tr><td>HI</td></tr> -->
				<c:forEach var="mdto" items="${list}">
					<tr>
						<td align="center" width="65">${mdto.mno}</td>
						<td align="center" width="65">${mdto.mid}</td>
						<td width="65" >${mdto.mname}</td>
						<td align="center">${mdto.mnumber}</td>
						<td align="center">${mdto.memail}</td>
						<td align="center">${mdto.msignindate}</td>
						<td align="center"><span class="bg" onclick="document.location='${ctxpath}/admin/viewOrders.do?mid=${mdto.mid}'">주문보기</span></td>
						
					</tr>
				</c:forEach>
			</c:if>
			
			<tr>
				<td align="center" colspan="11">
					<%-- 레코드가 하나라도 존재하면 --%>
					<c:if test="${totalRecord!=0}">
						<%-- 맨처음블럭의 첫페이지로가기 처리 --%>
						<%-- <c:if test="${currentBlock>0}"> --%>
							<a href="${ctxpath}/admin/boardList.do?flag=members&block=0&page=0&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/doubleleft.png" width="10px" height="10px"></a>
						<%-- </c:if> --%>
						<%-- 이전블럭처리 --%>
						<c:if test="${currentBlock==0}">
							<a href="#"><img src="${ctxpath}/img/singleleft.png" width="10px" height="10px"></a>
						</c:if>
						<c:if test="${currentBlock>0}">
							<a href="${ctxpath}/admin/boardList.do?flag=members&block=${currentBlock-1}&page=${(currentBlock-1)*pagePerBlock}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/singleleft.png"></a>
						</c:if>
						
						<%-- 페이지처리 --%>
						<c:set var="loop_flag" value="false"/>
						<c:forEach var="i" begin="1" end="${pagePerBlock}" step="1">
							<c:if test="${not loop_flag}">
								<c:if test="${i==(currentPage+1)}">
								${i}
								</c:if>
								<c:if test="${i!=(currentPage+1)}">
								<a href="${ctxpath}/admin/boardList.do?flag=members&block=${currentBlock}&page=${currentBlock*pagePerBlock+i-1}&keyField=${keyField}&keyWord=${keyWord}">&nbsp;${i}</a>
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
							<a href="${ctxpath}/admin/boardList.do?flag=members&block=${currentBlock+1}&page=${(currentBlock+1)*pagePerBlock}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/singleright.png"></a>							
						</c:if>
						
						<%-- 맨마지막블럭의 마지막페이지로 가기 처리--%>
						<%-- <c:if test="${totalBlock}" --%>
						<a href="${ctxpath}/admin/boardList.do?flag=members&block=${totalBlock-1}&page=${totalPage-1}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/doubleright.png" width="10px" height="10px"></a>
						
					</c:if>
				</td>
			</tr>
		</table>
		
	</div>
</body>
</html>