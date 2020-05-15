<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxpath" value="<%= request.getContextPath() %>"/>
<html>
<head>
<meta charset="UTF-8">
<title>testMail</title>
</head>
<body>
	<a href="${ctxpath}/main/naverSender.do?memberId=imsi">클릭!!</a>
</body>
</html>