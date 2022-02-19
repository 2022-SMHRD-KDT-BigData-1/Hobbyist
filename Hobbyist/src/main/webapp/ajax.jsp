
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

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
<style type="text/css">
a {
	text-decoration: none;
	color: #f45c5c;
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
				<header id="header">
					<a href="index.html" class="logo"><h1>
							<strong>Hobbyist</strong>
						</h1></a>
					<ul class="icons">
						<li><a href="#"><span class="label">로그아웃</span></a></li>
						<li><a href="#"><span class="label">메인페이지</span></a></li>
						<li><a href="#"><span class="label">개인정보수정</span></a></li>
					</ul>
				</header>

				<!-- Banner -->

				<!-- Section -->

				<section class="ajax">
					<h3>map</h3>
					<div class="row">
						<div class="form-group row full-right">
							<div class="col-sm-10">
								<input align="center" class="form-control" type="text" size="20">
							</div>
							<div class="col-sm-2">
								<button class="btn btn-light" type="button">search</button>
							</div>
							<div>
								<br>
							</div>
							<h4>Info</h4>
							<table id="wishlist">
								<thead>
									<tr>
										<th>분류</th>
										<th>학원이름</th>
										<th>위치</th>
										<th>문의 번호</th>
									</tr>
								</thead>
								<tbody>
								<tr>
										<td>운동/스포츠</td>
										<td>모던필라테스</td>
										<td>광주광역시 남구 봉선동 22-2</td>
										<td>062-672-9030</td>
									</tr>
									<%
									for (int i = 0; i <= 10; i++) {
									%>
									<tr>
										<td>분류</td>
										<td>학원이름</td>
										<td>위치</td>
										<td>문의 번호</td>
									</tr>
									<%
									}
									%>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"></td>
										<td><a href="#" class="button primary small">Small</a></td>
									</tr>
								</tfoot>
							</table>

						</div>
					</div>
				</section>
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
						<li><a href="m1.html">My Schedule</a></li>
						<li><a href="m2.html">My Wishlist</a></li>
						<li><a href="m3.html">My History</a></li>
					</ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
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