<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
	<c:redirect context="${ctxpath}" url="/admin/loginForm.do"/>
</body>
</html>