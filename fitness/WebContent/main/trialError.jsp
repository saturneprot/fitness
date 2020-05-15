<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro</title>
</head>
<body>
	<%
		String mid=request.getParameter("mid");
		session.setAttribute("mid", mid);
	%>
	<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
	<c:if test="${empty ctxpath}">
		<c:redirect url="${ctxpath}/main/main.do"/>
	</c:if>
	<c:if test="${!empty ctxpath}">
		<c:redirect url="${ctxpath}/main/loginForm.do" />
	</c:if>
</body>
</html>