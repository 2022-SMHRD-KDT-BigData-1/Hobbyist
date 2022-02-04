<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:remove var="member" scope="session"/>
	<c:redirect url="main_jstl.jsp"/>
	<%-- <%
		session.invalidate();
		response.sendRedirect("main.jsp");
	%> --%>
</body>
</html>