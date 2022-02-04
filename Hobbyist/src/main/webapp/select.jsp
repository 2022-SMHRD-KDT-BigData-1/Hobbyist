<%@page import="com.message.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 1.request영역에 저장된 정보를 가져오시오. -->
<%-- <% ArrayList<MemberDTO> members = (ArrayList<MemberDTO>) request.getAttribute("members"); %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="assets/css/main.css" />
		
	</head>
	<style>
	
	</style>
	<body style="text-align: center;">
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<table>
							<caption><h2>회원관리페이지</h2></caption>
							<tr>
								
								<td>Email</td>
								<td>Tel</td>
								<td>Address</td>							
							</tr>
							<!-- 2.모든 회원의 이메일(email),전화번호(tel),주소(address)를 출력하시오. -->
							<c:choose>
								<c:when test="${empty members }">
									<tr><td colspan='3'>현재 가입된 회원이 없습니다.</td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="member" items="${members }">
										<tr>
											<td>${member.m_email }</td>
											<td>${member.m_tel }</td>
											<td>${member.m_address }</td>										
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<%-- <% 
							 if (members.isEmpty()) {
						            out.print("<tr><td colspan='3'>현재 가입된 회원이 없습니다.</td></tr>");
						         } else {
						            for (int i = 0; i < members.size(); i++) {
						               out.print("<tr>");
						               out.print("<td>" + members.get(i).getM_email() + "</td>");
						               out.print("<td>" + members.get(i).getM_tel() + "</td>");
						               out.print("<td>" + members.get(i).getM_address() + "</td>");
						               out.print("</tr>");
						            }
						         }

							%> --%>
						</table>
					</nav>		
					<a href="main.jsp" class="button next scrolly">되돌아가기</a>	
			</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
	</body>
</html>

