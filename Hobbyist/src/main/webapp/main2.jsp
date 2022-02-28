

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
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
 		#s{
            position: relative;
            width: 100%;
            height:  836px;
            overflow: hidden;
        }
        #s > .sl {
            width: 100%;
            height: 836px;
            position: relative;
            display: inline-block;
        }
        #s > .sl > img{
            width: 100%;
            height:  836px;
        }
		#slp{
			position: absolute;
			font-size: 150px;
			left: 60%;
			top : 50%;
			 transform: translate(-50%,-50%);
			z-index: 100;
			font-family: 'Noto Sans KR', sans-serif;
			color: #fff;
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
					<div class="slidewrap">
						<p id = "slp">Hobbyist</p>
					    <div id="s">
					        <div class="sl">
					           <img src="./images/yoga.jpg">
					        </div>
					               
					        <div class="sl">
					             <img src="./images/brushes.jpg">
					        </div>
					               
					        <div class="sl">
					              <img src="./images/knit.jpg">
					        </div>
					   </div>
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
	 <script>
    $("#s").children("div:gt(0)").hide();
    var current = 0; 
	setInterval(function(){
        var next = (current+1) % 3; 
        $("#s").find(".sl").eq(current).fadeOut(600);
        $("#s").find(".sl").eq(next).fadeIn(600);
        current = next;
    }, 3000); 
    $("#topBtn").click(function(){
            $("html,body").animate({
                scrollTop:0
            });
        });
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>


