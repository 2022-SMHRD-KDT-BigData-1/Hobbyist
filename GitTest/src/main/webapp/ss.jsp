<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Integer count = (Integer)application.getAttribute("count");

	if ( count == null){
		application.setAttribute("count", 1);
	}else{
		count +=1;
		application.setAttribute("count", count);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>현재 페이지 조회수 : <%= application.getAttribute("count") %> </h1>
	
	
	
	
	
	
</body>
</html>