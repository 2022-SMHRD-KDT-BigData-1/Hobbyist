<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String pos = request.getParameter("position2"); 
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% String value = request.getParameter("value");
		System.out.println(value);
	%>
</body>
</html>