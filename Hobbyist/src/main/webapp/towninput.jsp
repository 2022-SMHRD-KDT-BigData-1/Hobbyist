<%@page import="com.message.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	MemberDTO member = (MemberDTO) session.getAttribute("member");%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
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
	height: 100px;
	box-sizing: border-box;
	margin-top: 20px;
	border: 2px solid #f45c5c;
	border-radius: 5px 5px 5px 5px;
	padding-top: 50px;
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
	font-size: 24px;
	float: left;
	/*  margin : 10px;  */
	height: 100px;
	margin-left: 30px;
	margin-right: 30px;

}

.category_wraper>input.category {
	box-sizing: border-box;
	width: 600px;
	height: 40px;
	font-family: "SUIT-Medium";
	color: #f45c5c;
	font-weight: bold;
	margin-left: 200px;
}

.category_wraper>button {
	box-sizing: border-box;
	font-family: "SUIT-Medium";
	width: 100%;
	height: 80%;
	margin-left: 20px;
	background-color: #f45c5c;
	opacity: 0.9;
}

.category_wraper>button>span {
	font-size: 20px;
	color: white;
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
</style>



</head>
<body>
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
                 <!--  <%
                     if(member != null) {
                  %>
                  <li><a href="logout.jsp"><span class="label">로그아웃</span></a></li>
                  <li><a href="historyCon"><span class="label">수강관리</span></a></li>
                  <li><a href="update.jsp"><span class="label">회원 정보수정</span></a></li>
                  <%
                     }else{
                        %>
                  <li><a href="Login.jsp"><span class="label">로그인</span></a></li>
                  <li><a href="Join.jsp"><span class="label">회원가입</span></a></li>
                        <%
                     }
                  %> -->
               </ul> 
				</header>
			</div>

			<div id="category_wrapper_wrapper">
				<form action="townGeo2.jsp" method="post">
					<div class="category_wraper">
						<span>주변 학원 찾기</span> 
						<input type="text" class="category" name="start" placeholder="ex) 광주광역시 북구 호동로"> 
					</div>
					<div class="category_wraper">
						<button type="submit">
							<span id="recSearch">검색</span>
						</button>
					</div>
				</form>
			</div><br>
			<div id="recWrapper">
				<div id="recMap">
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29fc3997888570a1dca257593cd4be4a"></script>
					<script>
						var mapContainer = document.getElementById('recMap'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(35.15809599087085,
									126.817700142583), // 지도의 중심좌표
							level : 5
						// 지도의 확대 레벨
						};

						// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
						var map = new kakao.maps.Map(mapContainer, mapOption);
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
                  <li><a href="towninput.jsp">우리동네에서찾기</a></li>
                  <li><a href="RecommendMove.jsp">카테고리별 검색</a></li>
                  <li><a href="geo.jsp">길찾기 </a></li>
                  <li><a href="communityList.jsp">게시판</a></li>
                  <li><a href="WishlistSelectCon">위시리스트 </a></li>
               </ul>
				</nav>

				<!-- Section -->
				<!-- <section>
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
				</section> -->

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