

<%@page import="com.message.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
MemberDTO member = (MemberDTO) session.getAttribute("member");
%>
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
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<header id="header">
					<a href="#" class="logo"><h1>
							<strong>Hobbyist</strong>
						</h1></a>
					<ul class="icons">
                  <%
                     if(member != null) {
                  %>
                  <li><a href="logout.jsp"><span class="label">로그아웃</span></a></li>
                  <li><a href="HistoryCon"><span class="label">수강관리</span></a></li>
                  <li><a href="Update.html"><span class="label">정보수정</span></a></li>
                  <%
                     }else{
                        %>
                  <li><a href="Login.jsp"><span class="label">로그인</span></a></li>
                  <li><a href="Join.jsp"><span class="label">회원가입</span></a></li>
                        <%
                     }
                  %>
               </ul> 
				</header>

				<br>

				<div class="section">
					<input type="radio" name="slide" id="slide01" checked> <input
						type="radio" name="slide" id="slide02"> <input
						type="radio" name="slide" id="slide03">
					<div class="slidewrap">

						<ul class="slidelist">
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
						<ul class="slide-pagelist">
							<li><label for="slide01"></label></li>
							<li><label for="slide02"></label></li>
							<li><label for="slide03"></label></li>
						</ul>
					</div>


				</div>

				<section>
					<a href="RecommendMove.jsp">광주광역시에서 찾기</a>
					<a href="WishlistSelectCon">위시리스트 보기</a>
					<a href="communityList.jsp">게시판 보기</a>
					<header class="major">
						<h2>우리 동네에서 찾기</h2>
					</header>
					<div class="main_map_search">
						<input id="map_search" type="text" placeholder="Search" />
						<button href="#" id="main_map"></button>
					</div>
					<div class="col-sm-10">

						<div class="map">
							<div class="kakao_map">
								<div id="daumRoughmapContainer1644542523530"
									class="root_daum_roughmap root_daum_roughmap_landing"></div>
							</div>

							<script charset="UTF-8" class="daum_roughmap_loader_script"
								src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

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
								<li><a href="#" class="button primary small">필라테스</a></li>
								<li><a href="#" class="button primary small">클라이밍</a></li>
								<li><a href="#" class="button primary small">크로스핏</a></li>
								<li><a href="#" class="button primary small">요가</a></li>
								<li><a href="#" class="button primary small">수영</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/ballet.jpg" alt="" /></a>
							<h3>댄스</h3>
							<ul class="actions">
								<li><a href="#" class="button primary small">발레</a></li>
								<li><a href="#" class="button primary small">방송댄스</a></li>
								<li><a href="#" class="button primary small">폴댄스</a></li>
								<li><a href="#" class="button primary small">무용</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/boxing.jpg" alt="" /></a>
							<h3>스포츠 무술</h3>
							<ul class="actions">
								<li><a href="#" class="button primary small">킥복싱</a></li>
								<li><a href="#" class="button primary small">주짓수</a></li>
								<li><a href="#" class="button primary small">무에타이</a></li>
							</ul>
						</article>
					</div>
				</section>
				<section>
					<header class="major">
						<h2>음악 미술 요리</h2>
					</header>
					<div class="posts">
						<article>
							<a href="#" class="image"><img src="images/guitar.jpg" alt="" /></a>
							<h3>음악</h3>
							<ul class="actions">
								<li><a href="#" class="button primary small">실용음악</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/art.jpg" alt="" /></a>
							<h3>미술</h3>
							<ul class="actions">
								<li><a href="#" class="button primary small">미술</a></li>
								<li><a href="#" class="button primary small">공예&화훼</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/cook.jpg"
								alt="" /></a>
							<h3>요리</h3>
							<ul class="actions">
								<li><a href="#" class="button primary small">요리</a></li>
								<li><a href="#" class="button primary small">바리스타</a></li>
								<li><a href="#" class="button primary small">베이킹</a></li>
							</ul>
						</article>
					</div>
				</section>
			</div>
		</div>
		<div id="sidebar">
			<div class="inner">
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
                  <li><a href="towninput.jsp">우리동네에서찾기</a></li>
                  <li><a href="RecommendMove.jsp">카테고리별 검색</a></li>
                  <li><a href="geo.jsp">길찾기 </a></li>
                  <li><a href="communityList.jsp">게시판</a></li>
                  <li><a href="WishlistSelectCon">위시리스트 </a></li>
               </ul>
				</nav>

				<section>
					<header class="major">
						<h2>My Info</h2>
					</header>
					<p></p>
					<ul class="contact">
                     <%
                        if(member != null){
                     %>
                  <li><a href="#"><%= member.getM_email() %></a></li>
                  <li><%= member.getM_tel() %></li>
                  <li><%= member.getM_nick() %>님 환영합니다.
                  </li>
               <%
                        }else {
                           %>
                           <li>로그인을 해주세요</li>
                           <%   
                        }
               %>
               </ul>
				</section>

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

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>


