<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("recommend") != null) {
	session.removeAttribute("recommend");
	session.removeAttribute("count");
	session.removeAttribute("avgScore");
	session.removeAttribute("wish");
	session.removeAttribute("Review");
}
response.sendRedirect("Recommend.jsp");
%>
</body>
</html>