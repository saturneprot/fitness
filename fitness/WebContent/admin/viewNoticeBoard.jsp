<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>viewNoticeBoard</title>
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
		
		#subT{
			margin:auto;
			margin-top:20px;
			width:800px;
			height:50px;
			
		}
		#txt{
			font-size:20px;
			font-weight:600;
			float:left;
		}
		#subR{
			float:right;
			width:250px;
			height:50px;
			/* border:1px solid #cccccc; */
		}
		.subR-R{
			float:right;
			width:80px;
			height:30px;
			background:white;
			border:1px solid #808080;
			cursor:pointer;
			display:flex;
			align-items:center;
			justify-content:center;
			font-weight:600;
		}
		#mainFF{
			margin:auto;
			margin-top:10px;
			width:800px;
			height:525px;
			border:1px solid #cccccc;
		}
		.itemR{
			margin:auto;
			width:800px;
			height:40px;
			border-bottom:1px solid #cccccc;
			/* border:1px solid black; */
			
		}
		.itemRR{
			margin:auto;
			width:800px;
			height:400px;
			border-bottom:1px solid #cccccc;
			/* border:1px solid black; */
			
		}
		.contentR{
			float:left;
		}
		
		.conL1{
			width:100px;
			height:40px;
			font-weight:600;
			display:flex;
			align-items:center;
			padding-left:10px;
			background:#f2f2f2;
			/* border:1px solid black; */
		}
		.conR1{
			width:240px;
			height:40px;
			display:flex;
			align-items:center;
			/* border:1px solid black; */
		}
		.conL11{
			width:100px;
			height:400px;
			font-weight:600;
			display:flex;
			align-items:center;
			padding-left:10px;
			background:#f2f2f2;
			/* border:1px solid black; */
		}
		.conR11{
			width:690px;
			height:400px;
			display:flex;
			align-items:center;
			/* border:1px solid black; */
		}
	</style>
	<script>
		function deleteThing(sth){
			var cf = confirm("정말로 지우시겠습니까?");
			
			if(!cf){
				//alert("거절");
				return false;
			}
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
	<div id="subT">
		<div id="txt">*게시글</div>
		<div id="subR">
			<div class="subR-R" onclick="document.location='${ctxpath}/admin/boardList.do?flag=notice'">목록보기</div>
			<div class="subR-R" onclick="modifyThing('${ctxpath}/admin/modifyNoticeForm.do?block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}&nb_num=${dto.nb_num}')">수정하기</div>
			<div class="subR-R" onclick="deleteThing('${ctxpath}/admin/deleteNoticePro.do?block=${currentBlock}&page=${currentPage}&keyField=${keyField}&keyWord=${keyWord}&nb_num=${dto.nb_num}')">삭제하기</div>
		</div>
	</div>
	<div id="mainFF">
			<div class="itemR">
				<div class="contentR conL1">게시글번호</div>
				<div class="contentR conR1">${dto.nb_num}</div>
				<div class="contentR conL1">카테고리</div>
				<div class="contentR conR1">${dto.bc_num }</div>
			</div>
			
			<div class="itemR">
				<div class="contentR conL1">작성일</div>
				<div class="contentR conR1">${dto.nb_date}</div>
				<div class="contentR conL1">조회수</div>
				<div class="contentR conR1">${dto.nb_count}</div>
			</div>
			
			<div class="itemR">
				<div class="contentR conL1">제목</div>
				<div class="contentR conR1">${dto.nb_subject}</div>
				<div class="contentR conL1">작성자</div>
				<div class="contentR conR1"><c:if test="${dto.id=='admin'}">관리자</c:if></div>
			</div>
			
			
			<div class="itemRR">
				<div class="contentR conL11">내용</div>
				<div class="contentR conR11">
					<textarea style="width:100%; height:400px; border:none;" readonly>${dto.nb_content}</textarea>
				</div>
			</div>
			
		</div>
</body>
</html>