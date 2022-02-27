
<%@page import="com.message.model.MarkerDAO"%>
<%@page import="com.message.model.MarkerDTO"%>
<%@page import="com.message.model.AddrDTO"%>
<%@page import="com.message.model.MemberDTO"%>
<%@page import="com.message.model.WishlistDTO"%>
<%@page import="com.message.model.AcademyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ArrayList<AddrDTO> wishselect = (ArrayList<AddrDTO>) session.getAttribute("wishselect");
ArrayList<WishlistDTO> wishselect2 = (ArrayList<WishlistDTO>) session.getAttribute("wishselect");
MemberDTO member = (MemberDTO) session.getAttribute("member");
%>
<%
ArrayList<MarkerDTO> locmarker = new ArrayList<MarkerDTO>();
MarkerDAO dao = new MarkerDAO();
locmarker = dao.marSelect();
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
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<link rel="stylesheet" href="./css/bootstrap.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./js/bootstrap.js"></script>
<style type="text/css">
a {
	text-decoration: none;
	color: #f45c5c;
}
#map{
	margin : 0 auto;
	padding : 0 auto;
	width: 100%; 
	height: 400px;
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

#mapwrap {
	position: relative;
	overflow: hidden;
}

.category, .category * {
	margin: 0;
	padding: 0;
	color: #000;
}

.category {
	position: absolute;
	overflow: hidden;
	top: 10px;
	left: 10px;
	width: 150px;
	height: 50px;
	z-index: 10;
	border: 1px solid black;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
	font-size: 12px;
	text-align: center;
	background-color: #fff;
}

.category .menu_selected {
	background: #FF5F4A;
	color: #fff;
	border-left: 1px solid #915B2F;
	border-right: 1px solid #915B2F;
	margin: 0 -1px;
}

.category li {
	list-style: none;
	float: left;
	width: 50px;
	height: 45px;
	padding-top: 5px;
	cursor: pointer;
}

.category .ico_comm {
	display: block;
	margin: 0 auto 2px;
	width: 22px;
	height: 26px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png')
		no-repeat;
}

.category .ico_coffee {
	background-position: -10px 0;
}

.category .ico_store {
	background-position: -10px -36px;
}

.category .ico_carpark {
	background-position: -10px -72px;
}

#wish {
	margin: 0 auto;
	padding: 0 auto;
	height: 30px;
	width: 30px;
	box-sizing: content-box;
}

.h1 {
	text-align: center;
	box-sizing: content-box;
	width: 30px;
	height: 30px;
	margin: 0 auto;
	padding: 0;
	border: 0;
	box-shadow: none;
	background-color: transparent;
}

.heart {
	width: 30px;
	margin: 0 auto;
	padding: 0 auto;
}

.relTd {
	position: relative;
}

.wish {
	position: absolute;
	top: 45%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body class="is-preload">
<%
if(wishselect != null && wishselect.size() >= 1){
String addr = wishselect.get(0).getAc_addr();
String name = wishselect.get(0).getAc_name();
%>
<input type="hidden" value="<%=addr%>" class="addr">
<input type="hidden" value="<%=name%>" class="name">
<%
}else{
	String addr = "광주광역시 서구 내방로 111";
	String name = "광주광역시청";
	%>
	<input type="hidden" value="<%=addr%>" class="addr">
	<input type="hidden" value="<%=name%>" class="name">
	<%
}
%>
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
						<%
						if (member != null) {
						%>
						<li><a href="logout.jsp"><span class="label">로그아웃</span></a></li>
						<li><a href="HistoryCon"><span class="label">수강관리</span></a></li>
						<li><a href="update.jsp"><span class="label">회원
									정보수정</span></a></li>
						<%
						} else {
						%>
						<li><a href="Login.jsp"><span class="label">로그인</span></a></li>
						<li><a href="Join.jsp"><span class="label">회원가입</span></a></li>
						<%
						}
						%>
					</ul>
				</header>

				<!-- Banner -->

				<!-- Section -->


					<div id="map"></div>

					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29fc3997888570a1dca257593cd4be4a&libraries=services"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450701,
									126.570667), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};
						var value1 = document.querySelector('.addr').value;
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(value1,function(result, status) {

											// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {

												var coords = new kakao.maps.LatLng(
														result[0].y,
														result[0].x);

												// 결과값으로 받은 위치를 마커로 표시합니다
												var marker = new kakao.maps.Marker(
														{
															map : map,
															position : coords
														});
												var value2 = document
														.querySelector('.name').value;
												// 인포윈도우로 장소에 대한 설명을 표시합니다
												var infowindow = new kakao.maps.InfoWindow(
														{
															content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																	+ value2
																	+ '</div>'
														});
												infowindow.open(map, marker);

												// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
												map.setCenter(coords);
											}
										});
					</script>
					<div>
						<h3>Wishlist</h3>
						<div class="col-sm-5">
							<h4>Info</h4>
							<table id="wishlist" style="width: 1200px;">
								<thead>
									<tr>
										<th>분류</th>
										<th>학원이름</th>
										<th>위치</th>
										<th>문의</th>
										<th>Wish Check</th>
									</tr>
								</thead>
								<tbody>
									<%
									if(wishselect.size()>=1 && wishselect != null){
									for (int i = 0; i < wishselect.size(); i++) {
									%>
									<tr>
										<td><%=wishselect.get(i).getAc_category()%></td>
										<td><%=wishselect.get(i).getAc_name()%></td>
										<td><%=wishselect.get(i).getAc_addr()%></td>
										<td><a href="<%=wishselect.get(i).getAc_rel()%>">
												홈페이지 방문</a></td>
										<td class="relTd">
											<%
											if (wishselect2 != null) {
												if (wishselect2.get(i) != null) {
											%>
											<form action="WishlistPageDelCon" method="post" class="wish">
												<button type="submit" class="h1" name="Del"
													value="<%=wishselect.get(i).getAc_id()%>">
													<img src="./images/heart1.png" alt="heart1" class="heart">
												</button>
												<%
												}
											}
												%>
											</form> <%
 }
 %>
										</td>
									</tr>
									<%
									}else{
										%>
										<tr>
										<td colspan ="5" align="center">
											위시리스트가 없습니다. 
										<td>
										</tr>
										<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
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

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>

