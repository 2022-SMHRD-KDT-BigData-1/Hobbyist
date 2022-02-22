<%@page import="com.message.model.ExBoardDTO"%>
<%@page import="com.message.model.ExBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
ExBoardDAO manager = ExBoardDAO.getInstance();
List<ExBoardDTO> list = manager.getList(); // getList 메서드 호출
SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm");
%>

<html>
<head>
<title>Hobbyist</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link
	href="https://fonts.googleapis.com/
    icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<style>
#main>div>section>header h2 {
	font-family: "SUIT-Medium";
}

#main>div>section>div>article h3 {
	font-family: "SUIT-Medium";
}

#main>div>section>div>article a {
	font-family: "SUIT-Medium";
	margin-right: 2em;
}

a {
	text-decoration: none;
	color: #f45c5c;
}

#map_search {
	font-size: 11px;
	float: left;
}

#main_map {
	background-color: #f56a6a;
	border-radius: 0.25em;
	border: 0px;
	outline: none;
	float: right;
}
</style>
</head>

<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header"> <a href="index.html" class="logo"><h1>
						<strong>Hobbyist</strong>
					</h1></a>
				<ul class="icons">
					<li><a href="Login.jsp"><span class="label">로그인</span></a></li>
					<li><a href="Join.jsp"><span class="label">회원가입</span></a></li>
				</ul>
				</header>
				<center>
					<h3>게시판 목록</h3>
					<table border="1" width="900">
						<tr>
							<td width="10%">번호</td>
							<td width="15%">이름</td>
							<td width="30%">제목</td>
							<td width="20%">작성일</td>
							<td width="10%">조회수</td>
							<td width="15%">ip</td>
						</tr>
						<%
						if (list != null) { // 데이터베이스에 데이터가 있으면
							for (int i = 0; i < list.size(); i++) {
								ExBoardDTO board = list.get(i); // 반환된 list에 담긴 참조값 할당
						%>
						<tr>
							<td><%=board.getNo()%></td>
							<td><%=board.getName()%></td>
							<td>
								<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값을 갖고 content.jsp로 이동 --%> <a
								href="communityContent.jsp?no=<%=board.getNo()%>"><%=board.getSubject()%></a>
							</td>
							<td><%=df.format(board.getReg_date())%></td>
							<td><%=board.getReadCount()%></td>
							<td><%=board.getIp()%></td>
						</tr>
						<%
						}
						} else { // 데이터가 없으면
						%>
						<tr>
							<td colspan="6" align="center">게시글이 없습니다.</td>
						<tr>
							<%
							}
							%>
						
						<tr>
							<td colspan="6" align="right">
								<%-- 버튼을 클릭하면 writeForm.jsp로 이동 --%> <input type="button"
								value="글작성" onclick="location.href='communityWriteForm.jsp'">
							</td>
						</tr>
					</table>
				</center>
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
				<nav id="menu"> <header class="major">
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
				<section> <header class="major">
				<h2>My Info</h2>
				</header>
				<p></p>
				<ul class="contact">
					<li><a href="#">smhrd@smhrd.co.kr</a></li>
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>