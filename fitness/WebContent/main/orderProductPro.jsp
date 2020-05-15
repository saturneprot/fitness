<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
<html>
<head>
<meta charset="UTF-8">
<title>orderProductPro</title>
	<style>
		#resultPage{
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
		#result2F{
			margin-top:20px;
			width:800px;
			height:50px;
		}
		#result2F-text{
			font-size:24px;
			font-weight:600;
			color:#550002;
			float:left;
		}
		#result2F-more{
			float:right;
			margin-left:20px;
			font-size:16px;
			color:#4fa6dd;
			cursor:pointer;
		}
		/* #result3F{
			clear:both;
			margin:auto;
			width:800px;
			height:300px;
			border:1px solid #cccccc;
		} */
		#resultRow{
			width:800px;
			height:100px;
			border:1px solid #cccccc;
		}
		.rowItems{
			float:left;
		}
		#imageColumn{
			width:100px;
			height:100px;
		}
		#subjectColumn{
			margin-left:10px;
			height:100px;
			width:350px;
			display:flex;
			/* justify-content:center; */
			align-items:center;
			font-size:16px;
			font-weight:600;
		}
		#quantityColumn{
			height:100px;
			display:flex;
			align-items:center;
			font-size:16px;
			font-weight:600;
			margin-left:20px;
		}
		#priceColumn{
			margin-left:50px;
			height:100px;
			display:flex;
			align-items:center;
			font-size:16px;
			font-weight:600;
			color:#ae0000;
		}
		#statusColumn{
			margin-left:50px;
			height:100px;
			display:flex;
			align-items:center;
			font-size:16px;
			font-weight:600;
			color:green;
		}
		#deliveryP{
			font-size:16px;
			font-weight:600;
		}
		#contentRR{
			margin:auto;
			margin-top:30px;
			width:800px;
			height:450px;
			border:1px solid #cccccc;
		}
		.rowR{
			margin:auto;
			margin-top:15px;
			width:700px;
			height:30px;
		}
		.rowrow{
			float:left;
		}
		.rowL1{
			width:100px;
			height:30px;
			font-weight:600;
		}
		.rowR1{
			font-weight:600;
		}
	</style>
</head>
<body>
	<div id="resultPage">
	<div id="logo" onclick="document.location='${ctxpath}/main/main.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
	<div id="result2F"><div id="result2F-text">감사합니다!</div><div id="result2F-more" onclick="document.location='${ctxpath}/main/main.do'">홈으로</div></div>
	<div id="deliveryP">배송비 : 2,500원</div>
	<div id="result3F">
		<table>
			<c:forEach var="odto" items="${list}">
				<tr>
					<%-- <td>${odto.p_image}&nbsp;${odto.p_name}&nbsp;${odto.order_quantity}&nbsp;</td> --%>
					<td><div id="resultRow"><div class="rowItems" id="ImageColumn"><img src="${ctxpath}/productImgs/${odto.p_image}" width="100%" height="100%"></div><div class="rowItems" id="subjectColumn">${odto.p_name}</div><div class="rowItems" id="quantityColumn">${odto.order_quantity}개</div><div class="rowItems" id="priceColumn"><fmt:formatNumber value="${odto.order_quantity*odto.p_price}" pattern="#,###" />원</div><div class="rowItems" id="statusColumn">결제완료</div></div></td>
				</tr>
			</c:forEach>
		</table>
		<div id="contentRR">
			<div class="rowR">
				<div class="rowrow rowL1">수령인</div>
				<div class="rowrow rowR1">${dto.o_name}</div>
			</div>
			<div class="rowR">
				<div class="rowrow rowL1">연락처</div>
				<div class="rowrow rowR1">${dto.o_number}</div>
			</div>
			<div class="rowR">
				<div class="rowrow rowL1">이메일</div>
				<div class="rowrow rowR1">${dto.o_email}</div>
			</div>
			<div class="rowR">
				<div class="rowrow rowL1">주소</div>
				<div class="rowrow rowR1">${dto.o_addr1}</div>
			</div>
			<div class="rowR">
				<div class="rowrow rowL1">상세주소</div>
				<div class="rowrow rowR1">${dto.o_addr2}</div>
			</div>
			<div class="rowR">
				<div class="rowrow rowL1">요청사항</div>
				<div class="rowrow rowR1"><c:if test="${empty dto.o_comment}">-</c:if><c:if test="${!empty dto.o_comment}">${dto.o_comment}</c:if></div>
			</div>
			<div class="rowR">
				<div class="rowrow rowL1">지불방법</div>
				<div class="rowrow rowR1">${dto.o_pay}</div>
			</div>
			<div class="rowR">
				<div class="rowrow rowL1">주문일</div>
				<div class="rowrow rowR1">${dto.o_date}</div>
			</div>
			<div class="rowR">
				<div class="rowrow rowL1">배송상태</div>
				<div class="rowrow rowR1">${dto.o_status}</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>