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
	
	if(recommend != null){
			count = (Integer) session.getAttribute("count");
	}
	ArrayList <Double> scoreAvg = (ArrayList <Double>) session.getAttribute("scoreAvg");
	
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
	#recInfo{
		float : left;
	}
	#recReviewWish{
		box-sizing : border-box;
		float : right;
		margin : 0 auto;
		padding : 1px;
	}
	#star{
		width : 20px;
		margin-top : 2px;
		margin-right : 2px;
	}
	#acaImg{
		position : relative;
		width : 25%;
		box-sizing : border-box;
		overflow : hidden;
		float : left;
		margin-right : 10px;
	}
	#acaImg > img{
		width : 100%;
		height : 80px;
		float : left;
		opacity: 0.8;
	}
	#acaImg > #imgMemo{
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
                  <%
                     if(member != null) {
                  %>
                  <li><a href="logout.jsp"><span class="label">로그아웃</span></a></li>
                  <li><a href="history.jsp"><span class="label">수강관리</span></a></li>
                  <li><a href="update.jsp"><span class="label">회원 정보수정</span></a></li>
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
								<div id = "acaImg">
									<img alt="이미지 준비중" src="./images/defaultImg.jpg">
									<p id = "imgMemo">이미지 준비중</p>
								</div>
								<div id = "recInfo">
									<strong>상호명 : </strong> <%= recommend.get(i).getA_name() %> <br>
									<strong>주소 : </strong> <%= recommend.get(i).getA_address() %><br>
									<strong>관련정보 : </strong> <%= recommend.get(i).getA_note() %><br>
								</div>
								<div id = "recReviewWish">
									<img alt="star" src="./images/star.png" id = "star">
									<span> 평점 : 
									<%
										if(scoreAvg.get(i).isNaN()){
											%>
											<%= 0 %> 점
											<%
										}else{
											System.out.println(scoreAvg.get(i));
									%>
									
									<%= ((double)((int)(scoreAvg.get(i)*10)))/10 %> 점
									<%
										}
									%>
									 </span>
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
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29fc3997888570a1dca257593cd4be4a"></script>
						<script>
							var container = document.getElementById('recMap'); //지도를 담을 영역의 DOM 레퍼런스
							var options = { //지도를 생성할 때 필요한 기본 옵션
								center: new kakao.maps.LatLng(35.14988626727629, 126.91982125182754), //지도의 중심좌표.
								level: 4 //지도의 레벨(확대, 축소 정도)
							};
	
							var map = new kakao.maps.Map(container, options); //지도생성 및 객체 리턴ㅛ
							
							if (navigator.geolocation) {
							    
							    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
							    navigator.geolocation.getCurrentPosition(function(position) {
							        
							        var lat = position.coords.latitude, // 위도
							            lon = position.coords.longitude; // 경도
							        
							        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
							            message = '<div style="padding:5px;">현재 위치입니다.</div>'; // 인포윈도우에 표시될 내용입니다
							        
							        // 마커와 인포윈도우를 표시합니다
							        displayMarker(locPosition, message);
							            
							      });
							    
							} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
							    
							    var locPosition = new kakao.maps.LatLng(35.14988626727629, 126.91982125182754),    
							        message = 'geolocation을 사용할수 없어요..'
							        
							    displayMarker(locPosition, message);
							}

							// 지도에 마커와 인포윈도우를 표시하는 함수입니다
							function displayMarker(locPosition, message) {

							    // 마커를 생성합니다
							    var marker = new kakao.maps.Marker({  
							        map: map, 
							        position: locPosition
							    }); 
							    
							    var iwContent = message, // 인포윈도우에 표시할 내용
							        iwRemoveable = true;

							    // 인포윈도우를 생성합니다
							    var infowindow = new kakao.maps.InfoWindow({
							        content : iwContent,
							        removable : iwRemoveable
							    });
							    
							    // 인포윈도우를 마커위에 표시합니다 
							    infowindow.open(map, marker);
							    
							    // 지도 중심좌표를 접속위치로 변경합니다
							    map.setCenter(locPosition);      
							}    
							/*  */
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
                  <li><a href="townGeo.jsp">우리동네에서찾기</a></li>
                  <li><a href="RecommendMove.jsp">카테고리별 검색</a></li>
                  <li><a href="geo.jsp">길찾기 </a></li>
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