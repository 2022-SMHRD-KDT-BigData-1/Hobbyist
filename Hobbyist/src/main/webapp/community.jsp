<%@page import="com.message.model.CommunityDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.message.model.CommunityDTO"%>
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
</head>
<body class="is-preload">

	<%
	//CommunityDTO community = (CommunityDTO) session.getAttribute("community");
	CommunityDAO dao = new CommunityDAO();
	ArrayList<CommunityDTO> communitylist = dao.commSelect();
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

				<h2 align=center>게시판</h2>
				<table align=center>
					<thead align="center">
						<tr>
							<td width="50" align="center">번호</td>
							<td width="500" align="center">제목</td>
							<td width="100" align="center">작성자</td>
							<td width="200" align="center">날짜</td>
							<td width="80" align="center">조회수</td>
						</tr>
					</thead>

					<tbody>
						<%
						for (int i = 0; i < communitylist.size(); i++) {
							out.print("<tr>");
							out.print("<td width='50' align='center'>" + communitylist.get(i).getC_seq() + "</td>");
							out.print("<td width='500' align='center'><a href='communityPost.jsp?num=" + (i) + "'>"
							+ communitylist.get(i).getC_title() + "</a></td>");
							out.print("<td width='100' align='center'>" + communitylist.get(i).getM_nick() + "</td>");
							out.print("<td width='200' align='center'>" + communitylist.get(i).getC_date() + "</td>");
							out.print("<td width='80' align='center'>" + communitylist.get(i).getC_view() + "</td>");
							out.print("</tr>");
						}
						%>
					</tbody>

					<tr>
						<form action="search.do" method="get">
							<td></td>
							<td colspan="2"><input type="text" name="search"></td>
							<td colspan="1"><button type="submit">검색</button></td>
						</form>

						<td colspan="1"><a href="communityUpload.jsp" class="button"
							align="center">글쓰기</a></td>
					</tr>
				</table>
				
				<a href="communityUpload.jsp" class="button" >글쓰기</a>
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

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>