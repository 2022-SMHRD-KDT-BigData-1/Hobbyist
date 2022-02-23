<%@page import="com.message.model.RecommendDAO"%>
<%@page import="com.message.model.MessageDTO"%>
<%@page import="com.message.model.MessageDAO"%>
<%@page import="com.message.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.message.model.AcademyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hobbyist</title>
<link rel="stylesheet" href="assets/css/main.css" />
<link
	href="https://fonts.googleapis.com/
    icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<style type="text/css">
#category_wrapper_wrapper {
	margin: 0 auto;
	padding: 0px auto;
	width: 1300px;
	height: 65px;
	box-sizing: border-box;
	margin-top: 20px;
	border: 2px solid #f45c5c;
	border-radius: 5px 5px 5px 5px;
	padding-top: 10px;
	padding-left: 10px;
}
.category_wraper {
	position: relative;
	float: left;
	height: 50px;
}
.category_wraper>span {
	font-family: "SUIT-Medium";
	color: #f45c5c;
	font-weight: bold;
	float: left;
	margin: 10px;
	height: 100px;
}
#recWrapper {
	margin: 0 auto;
	padding: 0;
	width: 1300px;
	height: 750px;
	box-sizing: border-box;
	margin-top: 20px;
	border: 2px solid #f45c5c;
	border-radius: 5px 5px 5px 5px;
}
#recMap {
	margin: 0 auto;
	padding: 0 auto;
	width: 100%;
	height: 745px;
	box-sizing: border-box;
	float: right;
}
#rec {
	margin: 0 auto;
	padding: 0 auto;
	width: 50%;
	height: 747px;
	box-sizing: border-box;
	float: left;
	border-right: 2px solid #f45c5c;
}

</style>

</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String city = request.getParameter("city");
	/* String dong = request.getParameter("dong");
	String pos = request.getParameter("position"); */
%>
<!-- 자바스크립트에서는 자바의 변수를 가져올 수 없음.. 편법을 사용하여 type을 hidden으로 하면 가능 -->
	<input type="hidden" value="<%= city %>" class="value1">
	<%-- <input type="hidden" value="<%= dong %>" class="value2">
	<input type="hidden" value="<%= pos %>" class="value3"> --%>

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
						<li><a href="Login.jsp"><span class="label">Login</span></a></li>
						<li><a href="Join.jsp"><span class="label">Join</span></a></li>
						<li><a href="manage.jsp"><span class="label">MyPage</span></a></li>
					</ul>
				</header>
			</div>
		
			<div id="category_wrapper_wrapper">
						<script>
						var value1 = document.querySelector('.value1').value;
						/* var value2 = document.querySelector('.value2').value+"동";
						var value3 = document.querySelector('.value3').value;
						console.log(value1);
						console.log(value2);
						console.log(value3);   */
						/* var adr = "광주광역시";
						var position1 = adr.concat(value1);
						var position2 = position1.concat(value2); */
						</script>
				<div class="category_wraper">
					<span>현재 위치입니다.</span>
				</div>
			</div>
			<div id="recWrapper">
				<div id="recMap">
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29fc3997888570a1dca257593cd4be4a&libraries=services"></script>
						<script>
						var mapContainer = document.getElementById('recMap'), // 지도를 표시할 div 
						    mapOption = {
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };  
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption); 
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(value1,function(result, status) {
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						        // 위도, 경도로 변환해주는 코드
						        	console.log("test "+ coords);
						     // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords 
						        });
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">입력한 위치</div>'
						        });
						        infowindow.open(map, marker);
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						        /* location.href = "asd.jsp?value="+coords; */
						    } 
						});    
						</script>
				</div>
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