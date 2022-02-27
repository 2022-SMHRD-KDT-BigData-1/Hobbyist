<%@page import="com.message.model.RecommendDAO"%>
<%@page import="com.message.model.MessageDTO"%>
<%@page import="com.message.model.MessageDAO"%>
<%@page import="com.message.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.message.model.AcademyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
MemberDTO member = (MemberDTO) session.getAttribute("member");
String adr = member.getM_address();
%>
<input type="hidden" name="adr" class="adr">
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
	<script>
	var start;
	</script>
</head>
<body>

	<input type="hidden" value="<%=adr%>" class="adr" name='adr'>
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

			<div id="category_wrapper_wrapper">
					<script>
						var value1 = document.querySelector('.adr').value;
					</script>
				
				<div class="category_wraper">
					<span>입력하신 주소입니다.</span>
						
				</div>
			</div>
			<div id="recWrapper">
				<div id="recMap">
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29fc3997888570a1dca257593cd4be4a&libraries=services"></script>
					<script>
						window.onload = function(){
							var mapContainer = document.getElementById("recMap"), // 지도를 표시할 div 
						    mapOption = {
						        center: new kakao.maps.LatLng(35.160617058500605, 126.85134751152451), // 지도의 중심좌표
						        level: 4, // 지도의 확대 레벨
						        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
						    }; 
							// 지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer, mapOption); 
							// 주소-좌표 변환 객체를 생성합니다
							var myLocmarker = document.querySelectorAll('.locmarker');
							var locArray = new Array(myLocmarker.length);
							var geocoder = new kakao.maps.services.Geocoder();
							for(var i = 0; i < myLocmarker.length; i++){
								locArray[i] = new Array(7);
								var arr = myLocmarker[i].value.split(',');
								locArray[i][0] = arr[0];
								locArray[i][1] = arr[1];
								locArray[i][2] = arr[2];
								locArray[i][3] = arr[3];
								locArray[i][4] = arr[4];
								locArray[i][5] = arr[5];
								locArray[i][6] = arr[6];
								console.log(locArray[i][4]+'/'+locArray[i][5] + '/'+locArray[i][6]);
							}
							// 주소로 좌표를 검색합니다 (시작지점)
							geocoder.addressSearch(value1,function(result, status) {
							    // 정상적으로 검색이 완료됐으면 
							     if (status === kakao.maps.services.Status.OK) {
							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							        // 위도, 경도로 변환해주는 코드
							        	/*console.log("test "+ coords);*/
							     // 결과값으로 받은 위치를 마커로 표시합니다
							        							        map.setCenter(coords);
							    } 
							});
							for(var i =0; i<locArray.length; i++){
								// 지도에 마커를 생성하고 표시한다
								var marker = new kakao.maps.Marker({
									position: new kakao.maps.LatLng(locArray[i][1], locArray[i][2]),
									map: map // 마커를 표시할 지도 객체
								});
								
								
								var content = '<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					                        locArray[i][0] + 
					            '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>' + 
					            '        </div>' + 
					            '        <div class="body">' + 
					            '            <div class="img">' +
					            '                <img src="'+locArray[i][4]+'" width="73" height="70" alt = "NO IMAGE">' +
					            '           </div>' + 
					            '            <div class="desc">' + 
					            '                <div class="ellipsis">'+locArray[i][3]+'</div>' + 
					            '                <div><a href="'+locArray[i][6]+'" target="_blank" class="link">홈페이지</a></div>' + 
					            '                <div><a href="'+locArray[i][5]+'" target="_blank" class="link">리뷰</a></div>' +
					            '            </div>' + 
					            '        </div>' + 
					            '    </div>' +    
					            '</div>';

								// 마커 위에 커스텀오버레이를 표시합니다
								// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
								overlay = new kakao.maps.CustomOverlay({
								    content: content,
								    map: null,
								    position: marker.getPosition()   
								});
								
								
								kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, overlay));
								// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
								/*kakao.maps.event.addListener(marker, 'click', function() {
									overlay.setMap(map);
								});*/
						
								// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
								markers.push(marker);
								overlays.push(overlay);	
								}
					//}
							
					function closeOverlay(i) {
						 overlays[i].setMap(null);   
					    //overlay.setMap(null);
					    /*$(".wrap").on("click",function(){
					    	$(this).hide();
					    })*/
					}
						}
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
                  <li><a href="Recommend.jsp">카테고리별 검색</a></li>
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