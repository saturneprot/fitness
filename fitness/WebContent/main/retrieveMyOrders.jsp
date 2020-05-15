<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>retrieveMyOrders</title>
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
		#nullF{
			margin:auto;
			margin-top:0px;
			width:800px;
			height:200px;
			border-bottom:1px solid #cccccc;
			display:flex;
			font-size:20px;
			font-weight:600;
			align-items:center;
			justify-content:center;
		}
		#dateF{
			margin-top:30px;
			width:800px;
			height:25px;
			clear:both;
			font-size:16px;
			font-weight:600;
		}
		#itemF{
			width:800px;
			height:100px;
			border:1px solid #cccccc;			
		}
		.item{
			float:left;
		}
		#item-imageR{
			width:100px;
			height:100px;
		}
		#item-subjectR{
			margin-left:15px;
			width:280px;
			height:100px;
			display:flex;
			align-items:center;
			font-size:15px;
			font-weight:600;
		}
		#item-priceR{
			margin-left:15px;
			width:90px;
			height:100px;
			display:flex;
			align-items:center;
			font-size:15px;
			font-weight:600;
			color:#ae0000;
		}
		#item-quantityR{
			margin-left:25px;
			width:30px;
			height:100px;
			display:flex;
			align-items:center;
			font-size:15px;
			font-weight:600;
		}
		#item-statusR{
			margin-left:15px;
			width:85px;
			height:100px;
			display:flex;
			align-items:center;
			font-size:15px;
			font-weight:600;
			color:green;
		}
		#item-detailR{
			margin-left:15px;
			width:100px;
			height:100px;
			display:flex;
			align-items:center;
			justify-content:center;
			
		}
		.details{
			width:100px;
			height:25px;
			border:1px solid #808080;
			background:white;
			display:flex;
			align-items:center;
			justify-content:center;
			font-size:12px;
			font-weight:600;
			cursor:pointer;
		}
	</style>
</head>
<body>
	<div id="resultPage">	
	<div id="logo" onclick="document.location='${ctxpath}/main/main.do'"><span id="logo0">운동</span>&nbsp;<span id="logo1">중</span><span id="logo2">독</span><span id="logo3">자</span><span id="logo4">들</span></div>
		<!-- <table> -->
			<c:if test="${empty list }">
				<div id="nullF">주문목록이 없습니다.</div>
			</c:if>
			<c:if test="${!empty list}">
			<c:set var="check" value="0"/>
				<c:forEach var="dto" items="${list}">
					<c:choose>
					<c:when test="${dto.order_num ne check}">
					<!-- <tr> -->
						<div id="dateF">${dto.o_date}</div>
						<div id="itemF"><div id="item-imageR" class="item"><img src="${ctxpath}/productImgs/${dto.p_image}" width="100%" height="100%"></div><div id="item-subjectR" class="item">${dto.p_name}</div><div id="item-quantityR" class="item">${dto.order_quantity}개</div><div id="item-priceR" class="item"><fmt:formatNumber value="${dto.order_quantity*dto.p_price}" pattern="#,###" />원</div><div id="item-statusR" class="item">${dto.o_status}</div><div id="item-detailR" class="item"><span class="details" onclick="document.location='${ctxpath}/main/viewDetail.do?order_num=${dto.order_num}'">수령정보</span></div></div>
						
						<%-- <td>${dto.o_date}</td>
						<td>${dto.p_image}</td>
						<td>${dto.p_name}</td>
						<td>${dto.p_price}</td>
						<td>${dto.order_quantity}</td> --%>
						<c:set var="check" value="${dto.order_num}"/>
					<!-- </tr> -->
					</c:when>
					<c:when test="${dto.order_num eq check}">
						<div id="itemF"><div id="item-imageR" class="item"><img src="${ctxpath}/productImgs/${dto.p_image}" width="100%" height="100%"></div><div id="item-subjectR" class="item">${dto.p_name}</div><div id="item-quantityR" class="item">${dto.order_quantity}개</div><div id="item-priceR" class="item"><fmt:formatNumber value="${dto.order_quantity*dto.p_price}" pattern="#,###" />원</div><div id="item-statusR" class="item">${dto.o_status}</div><div id="item-detailR" class="item"><span class="details" onclick="document.location='${ctxpath}/main/viewDetail.do?order_num=${dto.order_num}'">수령정보</span></div></div>
						<%-- <td>${dto.p_image}</td>
						<td>${dto.p_name}</td>
						<td>${dto.p_price}</td>
						<td>${dto.order_quantity}</td> --%>
						<c:set var="check" value="${dto.order_num}"/>
					</c:when>
					</c:choose>
				</c:forEach>
			</c:if>
			
		<!-- </table> -->
	</div>
</body>
</html>