<%@page import="com.message.model.ReviewDTO"%>
<%@page import="com.message.model.WishlistDAO"%>
<%@page import="com.message.model.WishlistDTO"%>
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
	session.removeAttribute("pageNum");
	session.setAttribute("pageNum", pageNum);
	
	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = (currentPage - 1) * pageSize;
	
	int count = 0;
	
	ArrayList <ReviewDTO> Review = (ArrayList <ReviewDTO>) session.getAttribute("Review");
	ArrayList <WishlistDTO> wishCheck = (ArrayList <WishlistDTO>) session.getAttribute("wish");
	ArrayList <Double> scoreAvg = (ArrayList <Double>) session.getAttribute("avgScore");
	if(recommend != null){
			count = (Integer) session.getAttribute("count");
	}
	
	
	
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/
    icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	#category_wrapper_wrapper{
		margin : 0 auto;
		padding : 0px auto;
		width : 1300px;
		height : 65px;
		box-sizing:border-box;
		margin-top : 20px;
		border : 2px solid #f45c5c;
		border-radius: 5px 5px 5px 5px;
		padding-top : 10px;
		padding-left : 10px;
	}
	.category_wraper{
		position : relative;
		float : left;
		height : 50px;
}
	.category_wraper > span{
		font-family: "SUIT-Medium";
		color : #f45c5c;
		font-weight : bold;
		float : left;
		margin : 10px;
		height : 100px;
		
}
	.category_wraper > input.category{
		box-sizing : border-box;
		width : 250px;
		height : 40px;
		font-family: "SUIT-Medium";
		color : #f45c5c;
		font-weight : bold;
		margin-left : 50px ;
	}
	.category_wraper > button{
		box-sizing : border-box;
		font-family: "SUIT-Medium";
		width : 100%;
		height : 80%;
		margin-left : 20px;
		background-color : #f45c5c;
		opacity: 0.9;
	}
	.category_wraper > button > span{
		font-size : 20px;
		color : #fff;
	}
	#recWrapper{
		margin : 0 auto;
		padding : 0 ;
		width : 1300px;
		height : 750px;
		box-sizing:border-box;
		margin-top : 20px;
		border : 2px solid #f45c5c;
		border-radius: 5px 5px 5px 5px;
	}
	#recMap{
		margin : 0 auto;
		padding : 0 auto;
		width : 50%;
		height : 745px;
		box-sizing:border-box;
		float : right;
	}
	#rec{
		margin : 0 auto;
		padding : 0 auto;
		width : 50%;
		height : 747px;
		box-sizing:border-box;
		float : left;
		border-right : 2px solid #f45c5c;
	}
	#rec > .recView {
		margin : 0 auto;
		padding : 0 auto;
		box-sizing:border-box;
		position : relative;
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
	#rec > .recView #pagebox td{
		margin : 0 auto;
		text-align : center;
	}
	.recInfo{
		float : left;
		
	}
	.recReviewWish{
		box-sizing : border-box;
		float : right;
		margin : 0 auto;
		padding : 1px;
	}
	.star{
		width : 20px;
		margin-top : 2px;
		margin-right : 2px;
	}
	.acaImg{
		position : relative;
		width : 25%;
		box-sizing : border-box;
		overflow : hidden;
		float : left;
		margin-right : 10px;
	}
	.acaImg > img{
		width : 100%;
		height : 80px;
		float : left;
		opacity: 0.8;
	}
	.acaImg2{
		position : relative;
		width : 100%;
		box-sizing : border-box;
		overflow : hidden;
		margin-right : 10px;
		height : 30%;
	}
	.acaImg2 > img{
		width : 100%;
		height : 100%;
		opacity: 0.8;
	}
	.acaImg2 > .imgMemo{
		font-family: "SUIT-Medium";
		color : #fff;
		font-weight : bold;
		position: absolute;
		top : 50%;
		left : 50%;
		transform: translate(-50%,-50%);
		margin : 0 auto;
		font-size : 20px;
		width : 70%;
	}
	.acaImg > .imgMemo{
		font-family: "SUIT-Medium";
		color : #fff;
		font-weight : bold;
		position: absolute;
		top : 50%;
		left : 50%;
		transform: translate(-50%,-50%);
		margin : 0 auto;
		font-size : 20px;
		width : 70%;
	}
		.wishInput{
			width: 30px;
			height : 30px;
			 float : right;
		}
		.wishInput > form > .h0{
            box-sizing: content-box;
            width: 30px;
            margin: 0 auto;
            padding: 0;
            border: 0;
            box-shadow : none;
            background-color:transparent;
        }
		.wishInput > form > .h1{
            box-sizing: content-box;
            width: 30px;
            margin: 0 auto;
            padding: 0;
            border: 0;
            box-shadow : none;
            background-color:transparent;
        }
        .wishInput .heart{
            width: 30px;
            margin: 0 auto;
            padding: 0 auto;
        }
        .reviewButton {
	        font-family: 'Noto Sans KR', sans-serif;
        	box-shadow : none;
            background-color:transparent;
            margin : 0 auto; 
            padding : 0 auto;
            font-color : #666;
        }
        .popUp{
        	width : 652px;
        	height : 749px;
        	position : fixed;
        	bottom : 12.5%;
        	left : 26.5%;
        	z-index : 10;
        	background:transparent;
        	border-radius: 15%;
        	display : none;
        }
        .popUp > article{
        	width : 652px;
        	height : 751px;
        	position : relative;
        	z-index : 20;
        	background-color : #fff;
        	 margin : auto;
        }
       .popDown {
       	background:transparent;
       	box-shadow : none;
       	font-family: 'Noto Sans KR', sans-serif;
       	float : right;
       	display : block;
       	margin : 0;
       }
		#popDark{
			position : absolute;
			width : 100%;
			height : 121%;
			background-color : #000;
			opacity : 0.5;
			z-index : 9;
			display : none;
		}
		.revUser{
			display : inline-block;
			float : left;
		}
		.revDate{
			display : inline-block;
			float : right;
		}
		.revContent{
			display : block;
		}	
</style>
<script type="text/javascript">
<%	
if(recommend != null){

	for(int i = startRow; i < endRow; i++){
%>	
	$(document).ready(function(){
		$("#reviewButton<%=i%>").click(function(){
			$("#popUp<%=i%>").fadeIn();
			$("#popDark").fadeIn();
			var offset = $('#recWrapper').offset(); 
        $('html').animate({scrollTop : offset.top}, 400);
		});
		$("#popDown<%=i%>").click(function(){
			$("#popUp<%=i%>").fadeOut();
			$("#popDark").fadeOut();
		})
	})
<%
	}
}
%>
</script>
</head>
<body>
	<div id = "popDark"></div>
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
				<button type = "submit"><span id="recSearch">검색</span></button>
			</div>
			</form>
			</div>
			<div id = "recWrapper">
				<div id = "rec">
					<div class = "recView">
					<table>
					<%	
						if(recommend != null){
						
							for(int i = startRow; i < endRow; i++){
					%>	
						<tr>
							<td>
							<div class = "popUp" id ="popUp<%=i%>">
								<article>
									<button type="button" class = "popDown" id = "popDown<%=i%>">[닫기]</button>
									<div class = "acaImg2">
									<img alt="이미지 준비중" src="./images/defaultImg.jpg">
								</div>
								<div class = "recInfo">
									<strong>상호명 : </strong> <%= recommend.get(i).getA_name() %> <br>
									<strong>주소 : </strong> <%= recommend.get(i).getA_address() %><br>
									<strong>관련정보 : </strong> <%= recommend.get(i).getA_note() %><br>
								</div>
								<div class = "recReviewWish">
									<img alt="star" src="./images/star.png" class = "star">
									<strong>
									<%
									if(scoreAvg != null){
										if(scoreAvg.get(i) == null){
											%>
											<%= 0 %>
											<%
										}else{
											
									%>
									
									<%= scoreAvg.get(i) %>
									<%
										}
									}
									%>
									<br>
									 </strong>
								</div>
								<div class = "wishInput">
									
										<%if(wishCheck !=null){
											if(wishCheck.get(i) != null){
												if(wishCheck.get(i).getW_wish()>0){
										%>
										<form action="WishlistRecoDelCon" method="post">
										<button type="submit" class="h1" name ="wishDelete" value = "<%= 
								        	recommend.get(i).getA_id()
								        %>"><img src="./images/heart1.png" alt="heart1" class="heart"></button>
										</form>
								        <% }}else{ %>
								        <form action="WishListInputCon" method="post">
								        <button type="submit" class="h0" name="a_idToWish" value="<%= 
								        	recommend.get(i).getA_id()
								        %>">
								        <img src="./images/heart0.png" alt="heart0" class="heart"></button>
								        </form>
								        <% 
								        }
											}
								        %>
								</div>
									<table>
								<%
								
								if (Review != null){
									for (int j = 0; j < Review.size(); j++)	{
										if(recommend.get(i).getA_id().equals(Review.get(j).getRe_id())){
											%>
												<tr>
													<td>
														<div class = "revUser">
														<%=Review.get(j).getRe_nick() %>
														</div>
														평점 : <%=Review.get(j).getRe_score()%>
														<div class="revDate">
														<%=Review.get(j).getRe_date()%>
														</div>
														<div class ="revContent">
														<%=Review.get(j).getRe_content() %>
														</div>
													</td>
												</tr>											
											<%
										}
									}
								}
								
								%>
									</table>
								
								</article>
							</div>
								<div class = "acaImg">
									<img alt="이미지 준비중" src="./images/defaultImg.jpg">
									<p class = "imgMemo">이미지 준비중</p>
								</div>
								<div class = "recInfo">
									<strong>상호명 : </strong> <%= recommend.get(i).getA_name() %> <br>
									<strong>주소 : </strong> <%= recommend.get(i).getA_address() %><br>
									<strong>관련정보 : </strong> <%= recommend.get(i).getA_note() %><br>
								</div>
								<div class = "wishInput">
									
										<%
										if(wishCheck !=null){
											if(wishCheck.get(i) != null){
												if(wishCheck.get(i).getW_wish()>0){
										 %>
										<form action="WishlistRecoDelCon" method="post">
										<button type="submit" class="h1" name ="wishDelete" value = "<%= 
								        	recommend.get(i).getA_id()
								        %>"><img src="./images/heart1.png" alt="heart1" class="heart"></button>
										</form>
								        <% }}else{ %>
								        <form action="WishListInputCon" method="post">
								        <button type="submit" class="h0" name="a_idToWish" value="<%= 
								        	recommend.get(i).getA_id()
								        %>">
								        <img src="./images/heart0.png" alt="heart0" class="heart"></button>
								        </form>
								        <% 
								        }
											}
								        %>
   									 
								</div>
								<div class = "recReviewWish">
									<img alt="star" src="./images/star.png" class = "star">
									<strong> 평점 : 
									<%
									if(scoreAvg != null){
										if(scoreAvg.get(i) == null){
											%>
											<%= 0 %> 점
											<%
										}else{
									%>
									
									<%= scoreAvg.get(i) %> 점
									<%
										}
									}
									%>
									<br>
									 </strong>
									<button type="button" class = "reviewButton" id = "reviewButton<%=i %>">
									[ 리뷰 ]
									</button>
								</div>
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
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbeb5d9508706363c850c1665cf88589"></script>
				<script>
					var mapContainer = document.getElementById('recMap'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
					        level: 3, // 지도의 확대 레벨
					        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
					    }; 
			
					// 지도를 생성한다 
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			
				</script>
</body>
</html>