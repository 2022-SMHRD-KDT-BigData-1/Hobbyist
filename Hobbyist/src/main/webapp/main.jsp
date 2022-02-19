<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
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
				<header id="header">
					<a href="index.html" class="logo"><h1>
							<strong>Hobbyist</strong>
						</h1></a>
					<ul class="icons">
						<li><a href="Login.jsp"><span class="label">로그인</span></a></li>
						<li><a href="Join.jsp"><span class="label">회원가입</span></a></li>
					</ul>
				</header>

				<!-- Banner -->
				<br>

				<div class="section">
					<input type="radio" name="slide" id="slide01" checked> <input
						type="radio" name="slide" id="slide02"> <input
						type="radio" name="slide" id="slide03">
					<div class="slidewrap">

						<ul class="slidelist">
							<!-- 슬라이드 영역 -->
							<li class="slideitem"><a>
									<div class="textbox">
										<h3>Hobbyist</h3>
									</div> <img src="./images/yoga.jpg">
							</a></li>
							<li class="slideitem"><a>

									<div class="textbox">
										<h3>Hobbyist</h3>
									</div> <img src="./images/brushes.jpg">
							</a></li>
							<li class="slideitem"><a>

									<div class="textbox">
										<h3>Hobbyist</h3>
									</div> <img src="./images/knit.jpg">
							</a></li class="slideitem">

							<!-- 좌,우 슬라이드 버튼 -->
							<div class="slide-control">
								<div>
									<label for="slide03" class="left"></label> <label for="slide02"
										class="right"></label>
								</div>
								<div>
									<label for="slide01" class="left"></label> <label for="slide03"
										class="right"></label>
								</div>
								<div>
									<label for="slide02" class="left"></label> <label for="slide01"
										class="right"></label>
								</div>
							</div>

						</ul>
						<!-- 페이징 -->
						<ul class="slide-pagelist">
							<li><label for="slide01"></label></li>
							<li><label for="slide02"></label></li>
							<li><label for="slide03"></label></li>
						</ul>
					</div>


				</div>

				<section>
					<a href="Recommend.jsp">광주광역시에서 찾기</a>
					<header class="major">
						<h2>우리 동네에서 찾기</h2>
					</header>
					<div class="main_map_search">
						<input id="map_search" type="text" placeholder="Search" />
						<button href="#" id="main_map"></button>
					</div>
					<div class="col-sm-10">

						<div class="map">
							<!-- <img src="images/sample_map.jpg.png" /> -->
							<!-- * 카카오맵 - 지도퍼가기 -->
							<!-- 1. 지도 노드 -->
							<div class="kakao_map">
								<div id="daumRoughmapContainer1644542523530"
									class="root_daum_roughmap root_daum_roughmap_landing"></div>
							</div>

							<script charset="UTF-8" class="daum_roughmap_loader_script"
								src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

							<!-- 3. 실행 스크립트 -->
							<script charset="UTF-8">
								new daum.roughmap.Lander({
									timestamp : "1644542523530",
									key : "2948y",
									mapWidth : "1200",
									mapHeight : "620",
								}).render();
							</script>
						</div>
					</div>
				</section>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>건강 다이어트</h2>
					</header>
					<div class="posts">
						<article>
							<a href="#" class="image"><img src="images/fitness.jpg"
								alt="" /></a>
							<h3>운동</h3>
							<ul class="actions">
								<li><a href="#" class="button primary small">헬스</a></li>
								<li><a href="#" class="button primary small">요가</a></li>
								<li><a href="#" class="button primary small">필라테스</a></li>
								<li><a href="#" class="button primary small">클라이밍</a></li>
								<li><a href="#" class="button primary small">크로스핏</a></li>
								<li><a href="#" class="button primary small">플라잉요가</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/ballet.jpg" alt="" /></a>
							<h3>무용</h3>
							<ul class="actions">
								<li><a href="#" class="button primary small">발레</a></li>
								<li><a href="#" class="button primary small">방송 댄스</a></li>
								<li><a href="#" class="button primary small">댄스스포츠</a></li>
								<li><a href="#" class="button primary small">폴댄스</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/boxing.jpg" alt="" /></a>
							<h3>스포츠 무술</h3>
							<ul class="actions">
								<li><a href="#" class="button primary small">복싱</a></li>
								<li><a href="#" class="button primary small">태권도</a></li>
								<li><a href="#" class="button primary small">주짓수</a></li>
								<li><a href="#" class="button primary small">수영</a></li>
								<li><a href="#" class="button primary small">테니스</a></li>
							</ul>
						</article>
					</div>
				</section>
				<section>
					<header class="major">
						<h2>아트 뷰티 공예</h2>
					</header>
					<div class="posts">
						<article>
							<a href="#" class="image"><img src="images/guitar.jpg" alt="" /></a>
							<h3>음악 악기</h3>
							<ul class="actions">
								<li><a href="#" class="button primary small">기타</a></li>
								<li><a href="#" class="button primary small">베이스</a></li>
								<li><a href="#" class="button primary small">드럼</a></li>
								<li><a href="#" class="button primary small">피아노</a></li>
								<li><a href="#" class="button primary small">보컬</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/makeup.jpg" alt="" /></a>
							<h3>뷰티 아트</h3>
							<ul class="actions">
								<li><a href="#" class="button primary small">메이크업</a></li>
								<li><a href="#" class="button primary small">헤어</a></li>
								<li><a href="#" class="button primary small">네일</a></li>
								<li><a href="#" class="button primary small">미술</a></li>
								<li><a href="#" class="button primary small">컴퓨터아트</a></li>
								<li><a href="#" class="button primary small">애니메이션</a></li>
								<li><a href="#" class="button primary small">웹툰</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pottery.jpg"
								alt="" /></a>
							<h3>요리 공예</h3>
							<ul class="actions">
								<li><a href="#" class="button primary small">요리</a></li>
								<li><a href="#" class="button primary small">바리스타</a></li>
								<li><a href="#" class="button primary small">베이킹</a></li>
								<li><a href="#" class="button primary small">도예</a></li>
								<li><a href="#" class="button primary small">자수</a></li>
								<li><a href="#" class="button primary small">뜨개질</a></li>
								<li><a href="#" class="button primary small">금속</a></li>
								<li><a href="#" class="button primary small">가죽</a></li>
								<li><a href="#" class="button primary small">플라워</a></li>
							</ul>
						</article>
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


