<%@page import="com.message.model.RecommendDAO"%>
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
	ArrayList <AcademyDTO> recommend = (ArrayList<AcademyDTO>) session.getAttribute("recommend");
	MemberDTO member = (MemberDTO) session.getAttribute("member");
	
	int pageSize = 8; // 한 페이지에 출력할 레코드 수

	// 페이지 링크를 클릭한 번호 / 현재 페이지
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){ // 클릭한게 없으면 1번 페이지
		pageNum = "1";
	}
	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = (currentPage - 1) * pageSize;
	
	int count = 0;
	count = (Integer) session.getAttribute("count");
	
	int endRow = currentPage * pageSize;
	if(currentPage > count / pageSize ){
	endRow = (currentPage -1) * pageSize + (count % pageSize);
}
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
		width : 50%;
		height : 750px;
		box-sizing:border-box;
		border : 2px solid #3d4449;
		float : right;
	}
	#rec{
		margin : 0 auto;
		padding : 0 auto;
		width : 50%;
		height : 750px;
		border : 2px solid #3d4449;
		box-sizing:border-box;
		float : left;
	}
	#rec > .recView {
		margin : 0 auto;
		padding : 0 auto;
		box-sizing:border-box;
	}
	#rec > .recView td{
		margin : 0 auto;
		padding : 1px;
		box-sizing:border-box;
	}
	#rec > .recView #pagebox{
		margin : 0 auto;
		position : relative;
		bottom : 0;
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
			<input type = "text" list = "a_L_category1" class = "category" name = "a_L_category1">
			<datalist id = "a_L_category1">
				<option value="테스트1"></option>
			</datalist>
			</div>
			
			<div class = "category_wraper">
			<span>소분류</span>
			<input type = "text" list = "a_m_category1" class = "category" name = "a_m_category1">
			<datalist id = "a_m_category1">
				<option value="테스트1-1"></option>
				<option value="테스트1-2"></option>
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
					<table border = "1px">
					<%	
						if(recommend != null){
						
							for(int i = startRow; i < endRow; i++){
					%>	
						<tr>
							<td>
							<strong>상호명 : </strong> <%= recommend.get(i).getA_name() %> <br>
							<strong>주소 : </strong> <%= recommend.get(i).getA_address() %><br>
							<strong>관련정보 : </strong> <%= recommend.get(i).getA_note() %><br>
							</td>
						</tr>
						
						
					<%				
							}
					%>		
						<tr id = "pagebox">
							<td>
					<%
							if(count > 0){
								// 총 페이지의 수
								int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
								// 한 페이지에 보여줄 페이지 블럭(링크) 수
								int pageBlock = 10;
								// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
								int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
								int endPage = startPage + pageBlock - 1;
								
								// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
								if(endPage > pageCount){
									endPage = pageCount;
								}
								
								if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
						%>
									<a href="Recommend.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	
						<%			
								}
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="Recommend.jsp?pageNum=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="Recommend.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
					<%		
								}
							}
						}
					%>
							</td>
						</tr>
						</table>
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