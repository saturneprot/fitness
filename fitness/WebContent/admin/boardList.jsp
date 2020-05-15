<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
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
		
		
		#searchSTH{
			position:absolute;
			left:10px;
			width:350px;
			height:30px;
			/* border:1px solid black; */
		}
		#floor2{
			margin:auto;
			width:1000px;
			height:800px;
			border-top:1px solid black;
		}
		.bg{
			width:50%;
			height:20px;
			border:1px solid #b3b3b3;
			display:inline-block;
			cursor:pointer;
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
	<div id="subTitle">*게시판관리</div>
	<div id="floor1">
		<div id="searchSTH">
			<form name="searchThings" method="get" action="${ctxpath}/admin/boardList.do?">
				<select name="keyField" id="selectK">
					<option value="9" selected>선택</option>
					<option value="b.b_num">게시번호</option>
					<option value="bc.bc_name">카테고리</option>
					<option value="b.b_subject">제목</option>
					<option value="m.mname">작성자</option>
					<option value="b.b_date">작성일</option>
					<option value="b.b_count">조횟수</option>
				</select>
				<input type="hidden" name="flag" value="mem">
				<input type="text" name="keyWord" id="textK">
				<input type="hidden" name="page" value="0">
				<input type="hidden" name="block" value="0">
				<input type="button" value="검색" onclick="searchIt()" id="searchK">
			</form>
		</div>
		<%-- <div id="btnN1" onclick="document.location='${ctxpath}/admin/boardList.do?flag=notice'">공지사항/FAQ</div> --%>
	</div><br>
	<div id="floor2">
		<table>
			<tr>
				<td align="center" class="tdtd">게시번호</td>
				<td align="center" class="tdtd">카테고리</td>
				<td align="center" class="tdtd">제목</td>
				<td align="center" class="tdtd">작성자</td>
				<td align="center" class="tdtd">작성일</td>
				<td align="center" class="tdtd">조횟수</td>
				<td align="center" class="tdtd">비고1</td>
			</tr>
			<c:if test="${list.size()==0}">
				<tr>
					<td align="center" colspan="7">게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${list.size()>0 }">
				<!-- <tr><td>HI</td></tr> -->
				<c:forEach var="bdto" items="${list}">
					<tr>
						<td align="center">${bdto.b_num}</td>
						<td align="center">${bdto.bc_name}</td>
						<c:if test="${bdto.mid eq 'admin'}">
							<td align="left"><span style="cursor:pointer;" onclick="document.location='${ctxpath}/admin/viewBoard2.do?b_num=${bdto.b_num}'"><img src="${ctxpath}/img/l-icon3.png" width="15px" height="15px">${bdto.b_subject}</span></td>
							
						</c:if>
						<c:if test="${bdto.mid ne 'admin'}">
							<td align="left"><span style="cursor:pointer;" onclick="document.location='${ctxpath}/admin/viewBoard.do?b_num=${bdto.b_num}'">${bdto.b_subject}</span></td>
						</c:if>
						<td align="center">${bdto.mid}</td>				
						
						<td align="center">${bdto.b_date}</td>
						
						
						<td align="center">${bdto.b_count}</td>
						
						<td align="center">						
						
						<span class="bg" onclick="deleteThing('${ctxpath}/admin/deleteBoardPro.do?block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}&b_num=${bdto.b_num}')">
							삭제
							<%-- <a href="${ctxpath}/admin/deletePro.do?block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}&p_num=${pdto.p_num}">삭제</a> --%>
						<%-- <form method="get" name="deleteSTH" action="${ctxpath}/admin/deletePro.do?block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}&p_num=${pdto.p_num}"> --%>
						<%-- <form method="get" name="deleteSTH">
							<input type="button" value="삭제" onclick="deleteThing('${ctxpath}/admin/deletePro.do?block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}&p_num=${pdto.p_num}')">
						</form> --%>
						</span>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<tr>
				<td align="center" colspan="11">
					<%-- 레코드가 하나라도 존재하면 --%>
					<c:if test="${totalRecord!=0}">
						<%-- 맨처음블럭의 첫페이지로가기 처리 --%>
						<%-- <c:if test="${currentBlock>0}"> --%>
							<a href="${ctxpath}/admin/boardList.do?block=0&page=0&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/doubleleft.png" width="10px" height="10px"></a>
						<%-- </c:if> --%>
						<%-- 이전블럭처리 --%>
						<c:if test="${currentBlock==0}">
							<a href="#"><img src="${ctxpath}/img/singleleft.png" width="10px" height="10px"></a>
						</c:if>
						<c:if test="${currentBlock>0}">
							<a href="${ctxpath}/admin/boardList.do?block=${currentBlock-1}&page=${(currentBlock-1)*pagePerBlock}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/singleleft.png"></a>
						</c:if>
						
						<%-- 페이지처리 --%>
						<c:set var="loop_flag" value="false"/>
						<c:forEach var="i" begin="1" end="${pagePerBlock}" step="1">
							<c:if test="${not loop_flag}">
								<c:if test="${i==(currentPage+1)}">
								${i}
								</c:if>
								<c:if test="${i!=(currentPage+1)}">
								<a href="${ctxpath}/admin/boardList.do?block=${currentBlock}&page=${currentBlock*pagePerBlock+i-1}&keyField=${keyField}&keyWord=${keyWord}">&nbsp;${i}</a>
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
							<a href="${ctxpath}/admin/boardList.do?block=${currentBlock+1}&page=${(currentBlock+1)*pagePerBlock}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/singleright.png"></a>							
						</c:if>
						
						<%-- 맨마지막블럭의 마지막페이지로 가기 처리--%>
						<%-- <c:if test="${totalBlock}" --%>
						<a href="${ctxpath}/admin/boardList.do?block=${totalBlock-1}&page=${totalPage-1}&keyField=${keyField}&keyWord=${keyWord}"><img src="${ctxpath}/img/doubleright.png" width="10px" height="10px"></a>
						
					</c:if>
				</td>
			</tr>
		</table>
		
	</div>
</body>
</html>