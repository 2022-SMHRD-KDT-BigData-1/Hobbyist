<%@page import="com.message.model.MessageDTO"%>
<%@page import="com.message.model.MessageDAO"%>
<%@page import="com.message.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.message.model.AcademyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	ArrayList <AcademyDTO> recommend = (ArrayList<AcademyDTO>) request.getAttribute("recommend");
	MemberDTO member = (MemberDTO) session.getAttribute("member");
	
%>
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
	#category_wrapper_wrapper{
		margin : 0 auto;
		padding : 0px auto;
		width : 1300px;
		height : 65px;
		box-sizing:border-box;
		margin-top : 20px;
		border : 2px solid #3d4449;
		padding-left : 10px;
	}
	.category_wraper{
		float : left;
		margin : 10px;
		height : 65px;
}
	.category_wraper > span{
		font-family: "SUIT-Medium";
		color : #000;
		font-weight : bold;
		float : left;
		margin : 10px;
		height : 100px;
		
}
	.category_wraper > input.category{
		width : 250px;
		height : 40px;
		font-family: "SUIT-Medium";
		color : #000;
		font-weight : bold;
		margin-left : 50px ;
	}
	#recWrapper{
		margin : 0 auto;
		padding : 0 ;
		width : 1300px;
		height : 750px;
		box-sizing:border-box;
		margin-top : 20px;
	}
	#recMap{
		margin : 0 auto;
		padding : 0 auto;
		width : 520px;
		height : 750px;
		box-sizing:border-box;
		border : 2px solid #3d4449;
		float : right;
	}
	#rec{
		margin : 0 auto;
		padding : 0 auto;
		width : 780px;
		height : 750px;
		border : 2px solid #3d4449;
		box-sizing:border-box;
		float : left;
	}
	#rec > .recView {
		margin : 0 auto;
		padding : 0 auto;
		width : 780px;
		height : 177px;
		border : 1px solid #3d4449;
		box-sizing:border-box;
	}
	#rec > #recMore {
		margin : 0 auto;
		padding : 0 auto;
		width : 780px;
		height : 72px;
		box-sizing:border-box;
		text-align : center;
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
					<a href="index.html" class="logo"><h1>
							<strong>Hobbyist</strong>
						</h1></a>
					<ul class="icons">
						<li><a href="#"><span class="label">Login</span></a></li>
						<li><a href="#"><span class="label">Join</span></a></li>
						<li><a href="#"><span class="label">MyPage</span></a></li>
					</ul>
				</header>
			</div>
			
		<div id = "category_wrapper_wrapper">
			<form action="RecommendSelectCon" method = "post">
			<div class = "category_wraper">
			<span>지역</span>
			<input type = "text" list = "city" class = "category" name = "city">
			<datalist id = "city">
				<option value="남구"></option>
		        <option value="서구"></option>
		        <option value="동구"></option>
		        <option value="북구"></option>
		        <option value="광산구"></option>
			</datalist>
			</div>
			
			<div class = "category_wraper">		
			<span>대분류</span>
			<input type = "text" list = "a_L_category" class = "category" name = "a_L_category">
			<datalist id = "a_L_category">
				<option value="운동 / 스포츠"></option>
		        <option value="음악 / 연주"></option>
		        <option value="드로잉 / 아트"></option>
		        <option value="쿠킹 / 베이킹"></option>
		        <option value="무용 / 댄스"></option>
			</datalist>
			</div>
			
			<div class = "category_wraper">
			<span>소분류</span>
			<input type = "text" list = "a_m_category" class = "category" name = "a_m_category">
			<datalist id = "a_m_category">
				<option value="헬스"></option>
		        <option value="필라테스"></option>
		        <option value="요가"></option>
		        <option value="클라이밍"></option>
		        <option value="크로스핏"></option>
			</datalist>
			</div>
			<div class = "category_wraper">
				<button type = "submit">검색</button>
			</div>
			</form>
			</div>
			<div id = "recWrapper">
				<div id = "rec">
					<div class = "recView">
						<%
							if(recommend != null){
								
							
						%>
						<%= recommend.get(1).getA_name() %>
						<%
							}else{
								%>
								<%= "값 없음 " %>
								<%
							}
						%>
						
					</div>
					<div class = "recView">
					<h1>추천2</h1>
					</div>
					<div class = "recView">
					<h1>추천3</h1>
					</div>
					<div class = "recView">
					<h1>추천4</h1>
					</div>
					<div id = "recMore">
						<span>1 | 2 | 3 | 4 | 5 …</span>
					</div>
				</div>
				<div id = "recMap">
					
					<h2>여기는 지도</h2>
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