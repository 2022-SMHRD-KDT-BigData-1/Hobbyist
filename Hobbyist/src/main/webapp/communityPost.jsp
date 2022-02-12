<%@page import="com.message.model.CommunityDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.message.model.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link
	href="https://fonts.googleapis.com/
    icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%
	CommunityDTO community = (CommunityDTO) session.getAttribute("community");
	CommunityDAO dao = new CommunityDAO();
	ArrayList<CommunityDTO> communitylist = dao.commOneSelect(community.getC_seq());
	%>
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.html" class="logo"><h1>
							<strong>Hobbyist</strong>
						</h1></a>
					<ul class="icons">
						<li><a href="#"><span class="label">Login</span></a></li>
						<li><a href="#"><span class="label">Join</span></a></li>
						<li><a href="#"><span class="label">MyPage</span></a></li>
					</ul>
				</header>

				<table>
				
				<% for(int i = 0; i < communitylist.size(); i++){%>
					<tr align=center>
						<td>글제목</td>
						<td colspan="3">
							<%
							out.print(communitylist.get(i).getC_title());
							%>
						</td>
					</tr>
					<tr align=center>
						<td>작성자</td>
						<td>
							<%
							out.print(communitylist.get(i).getM_nick());
							%>
						</td>
						<td>작성일자</td>
						<td>
							<%
							out.print(communitylist.get(i).getC_date());
							%>
						</td>
					</tr>
					<tr align=center>
						<td>내용</td>
						<td colspan="3">
							<%
							out.print(communitylist.get(i).getC_content());
							%>
						</td>
					</tr>
				<% } %>
					
					
				</table>


				<div>
					<form action="CommunityUpdateCon" method="get">
						<button type="submit">글 수정</button>
					</form>

					<form action="CommunityDeleteCon" method="get">
						<button type="submit">글 삭제</button>
					</form>
				</div>




				<!-- Banner -->
				<br>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="m1.html">Sports / Workout</a></li>
						<li><a href="m2.html">Dance / Music </a></li>
						<li><a href="m3.html">Art / Drawing</a></li>
						<li><a href="m4.html">Beauty / Make-up </a></li>
						<li><a href="m5.html">Cooking / Barista</a></li>
					</ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>My Info</h2>
					</header>
					<p></p>
					<ul class="contact">
						<li><a href="#">information@untitled.tld</a></li>
						<li>(000) 000-0000</li>
						<li>1234 Somewhere Road #8254<br /> Nashville, TN 00000-0000
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>
			</div>
		</div>
	</div>


</body>
</html>