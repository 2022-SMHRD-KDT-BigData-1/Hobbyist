
<%@page import="com.message.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%	MemberDTO member = (MemberDTO) session.getAttribute("success_data");%>
<%-- <%MemberDTO x = (MemberDTO) request.getAttribute("success_data"); --%> --%>
<!-- 회원가입시 오류 발생.... 내일 질문 -->
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
	href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css"
	rel="stylesheet">
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
					<a href="main.jsp" class="logo"><h1>
							<strong>Hobbyist</strong>
						</h1></a>
					<ul class="icons">
						<li><a href="logout.jsp"><span class="label">로그아웃</span></a></li>
						<li><a href="manage.jsp"><span class="label">마이페이지</span></a></li>
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


				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbeb5d9508706363c850c1665cf88589"></script>

				<script>
					var container = document.getElementById("map");
					var options = {
						center : new kakao.maps.LatLng(35.15062349964835,
								126.91592863607318),
						level : 3,
					};

					var map = new kakao.maps.Map(container, options);
				</script>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>건강 다이어트</h2>
					</header>
					<div class="posts">
						<article>
							<a href="#" class="image"><img
								src="./images/fitness.jpg" alt="" /></a>
							<h3>운동</h3>
							<ul class="actions">
								<li><a href="#" class="button">헬스</a></li>
								<li><a href="#" class="button">요가</a></li>
								<li><a href="#" class="button">필라테스</a></li>
								<li><a href="#" class="button">클라이밍</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img
								src="./images/ballet.jpg" alt="" /></a>
							<h3>무용</h3>
							<ul class="actions">
								<li><a href="#" class="button">발레</a></li>
								<li><a href="#" class="button">방송 댄스</a></li>
								<li><a href="#" class="button">댄스스포츠</a></li>
								<li><a href="#" class="button">폴댄스</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img
								src="./images/boxing.jpg" alt="" /></a>
							<h3>스포츠 무술</h3>
							<ul class="actions">
								<li><a href="#" class="button">복싱</a></li>
								<li><a href="#" class="button">태권도</a></li>
								<li><a href="#" class="button">주짓수</a></li>
								<li><a href="#" class="button">수영</a></li>
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
							<a href="#" class="image"><img
								src="./images/guitar.jpg" alt="" /></a>
							<h3>음악 악기</h3>
							<ul class="actions">
								<li><a href="#" class="button">기타</a></li>
								<li><a href="#" class="button">베이스</a></li>
								<li><a href="#" class="button">드럼</a></li>
								<li><a href="#" class="button">피아노</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img
								src="./images/makeup.jpg" alt="" /></a>
							<h3>뷰티 아트</h3>
							<ul class="actions">
								<li><a href="#" class="button">메이크업</a></li>
								<li><a href="#" class="button">헤어 네일</a></li>
								<li><a href="#" class="button">미술</a></li>
								<li><a href="#" class="button">컴퓨터아트</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img
								src="./images/pottery.jpg" alt="" /></a>
							<h3>제작 공예</h3>
							<ul class="actions">
								<li><a href="#" class="button">도예</a></li>
								<li><a href="#" class="button">자수</a></li>
								<li><a href="#" class="button">뜨개질</a></li>
								<li><a href="#" class="button">금속/가죽</a></li>
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
                  <li><a href="">우리동네에서찾기</a></li>
                  <li><a href="Recommend.jsp">카테고리별 검색</a></li>
                  <li><a href="">길찾기 </a></li>
                  <li><a href="communityList.jsp">게시판</a></li>
                  <li><a href="WishlistSelectCon">위시리스트 </a></li>
               </ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>My Info</h2>
					</header>
					<p></p>
					<ul class="contact">
						<li><a href="manage.jsp"><%=member.getM_email() %></a></li>
						<li><%=member.getM_tel() %></li>
						<li><%=member.getM_address() %></li> 
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

