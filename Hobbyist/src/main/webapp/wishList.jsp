
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
<style type="text/css">
a {
	text-decoration: none;
	color: #f45c5c;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
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

				<section class="wishlist">
					<h3>Wishlist</h3>
					<div class="row">
						<div class="col-sm-5">
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
							<!-- <div>
								<img src="images/sample_wishlist.jpg" />
							</div>
							<div>
								<ul class="alt">
									<li><strong>모던필라테스</strong></li>
									a_name
									<li>광주광역시 남구 봉선동</li>
									구/동
									<li>062-672-9030</li>
									
									<li>광주 남구 용대로74번길 11-1</li>
									<li><a href="#" class="button primary small">Call</a></li>
								</ul>
							</div> -->
						</div>

						<div class="col-sm-7">
							<h4>map</h4>
							
							
							 <p style="margin-top: -12px">
      <em class="link">
        <a href="/web/documentation/#CategoryCode" target="_blank"
          >카테고리 코드목록을 보시려면 여기를 클릭하세요!</a
        >
      </em>
    </p>
							<!-- 지도를 표시할 div 입니다 -->
							<div id="map" style="width: 100%; height: 580px;"></div>

							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbeb5d9508706363c850c1665cf88589"></script>
							<script>
								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(
											35.14850546456301,
											126.91755357151509), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
								var map = new kakao.maps.Map(mapContainer,
										mapOption);

								// 지도에 마커를 생성하고 표시한다
								var marker = new kakao.maps.Marker({
									position : new kakao.maps.LatLng(
											35.14850546456301,
											126.91755357151509), // 마커의 좌표
									map : map
								// 마커를 표시할 지도 객체
								});

								// 마커 위에 표시할 인포윈도우를 생성한다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="padding:2px;">SBS컴퓨터아카데미학원</div>' // 인포윈도우에 표시할 내용
										});

								// 인포윈도우를 지도에 표시한다
								infowindow.open(map, marker);
							</script>
							<!--  <div class="map">
                  <img src="images/sample_map.jpg.png" />
                  * 카카오맵 - 지도퍼가기
                  1. 지도 노드
                  <div class="kakao_map">
                    <div
                      id="daumRoughmapContainer1644542523530"
                      class="root_daum_roughmap root_daum_roughmap_landing"
                    ></div>
                  </div>

                  <script
                    charset="UTF-8"
                    class="daum_roughmap_loader_script"
                    src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"
                  ></script>

                  3. 실행 스크립트
                  <script charset="UTF-8">
                    new daum.roughmap.Lander({
                      timestamp: "1644542523530",
                      key: "2948y",
                      mapWidth: "1000",
                      mapHeight: "520",
                    }).render();
                  </script>
                </div> -->
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

