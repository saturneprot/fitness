<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sessionid" value="${sessionScope.admin}" />
<c:set var="ctxpath" value="<%= request.getContextPath() %>" />
<c:if test='${sessionid!="admin" }'>
	<c:redirect url="/admin/loginForm.jsp" context="${ctxpath}" />
</c:if>

	<div id="bb">
		<!-- <span id="zz" onclick="javascript:history.back()">뒤로</span> -->
		<span id="dd"><b>관리자 모드</b></span>
		<span id="kk" onclick="document.location='${ctxpath}/admin/index.do'">홈</span>
		<span id="cc" onclick="document.location='${ctxpath}/admin/logout.do'">로그아웃</span>
	</div>
