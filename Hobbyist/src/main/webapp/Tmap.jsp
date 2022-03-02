<%@page import="com.message.model.MemberDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
MemberDTO member = (MemberDTO) session.getAttribute("member");
%>
<%
String start = request.getParameter("start");
String end = request.getParameter("end");
System.out.println(start);

//불러온 위도 경도 값에 불필요한 특수문자를 제거
String[] result = start.split(",");
String y = result[0].replace("(", "");
result[1] = result[1].replace(")", "");
String x = result[1].replace(" ", "");

String[] result2 = end.split(",");
String ey = result2[0].replace("(", "");
result2[1] = result2[1].replace(")", "");
String ex = result2[1].replace(" ", "");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link
   href="https://fonts.googleapis.com/
    icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
   rel="stylesheet" />
<link
   href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css"
   rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>simpleMap</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
#menu ul a {
	font-family: "SUIT-Medium";
	font-size: 18px;
}
#map_wrap{
border : 2px solid #b2bec3;
border-radius: 5px 5px 5px 5px;
}
#result {
font-weight: bold;
font-family : "SUIT-Medium";
}
</style>
</head>
<body onload="initTmap();">

   <div id="wrapper">
      <!-- Main -->
      <div id="main">
         <div class="inner">
            <!-- Header -->
            <header id="header">
               <a href="main2.jsp" class="logo"><h1>
                     <strong>Hobbyist</strong>
                  </h1></a>
               <ul class="icons">
                  <%
                     if(member != null) {
                  %>
                  <li><a href="logout.jsp"><span class="label">로그아웃</span></a></li>
                  <li><a href="HistoryCon"><span class="label">수강관리</span></a></li>
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
            <div>
            <br>
            </div>


            <!-- 190430 기존 지도를 모두 이미지 처리 위해 주석 처리 S -->
            <div id="map_wrap" class="map_wrap3">
               <div id="map_div" style="width: 100%; height: 800px;"></div>
            </div>
            <div class="map_act_btn_wrap clear_box"></div>
            <p id="result"></p>
            <br />

            <div>
               <button onClick="getRP()">경로요청 실행</button>
               <br>
               <p id="result" />
            </div>

            <!-- x,y JavaScript로 옮기기 위한 꼼수 -->
            <input type="hidden" value="<%=x%>" class="value1"> <input
               type="hidden" value="<%=y%>" class="value2"> <input
               type="hidden" value="<%=ex%>" class="value3"> <input
               type="hidden" value="<%=ey%>" class="value4">

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

   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>
   <script
      src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxeecc964391d54ad994319ded9e19e28d"></script>
   <script type="text/javascript">
      var x = document.querySelector('.value1').value;
      var y = document.querySelector('.value2').value;
      var ex = document.querySelector('.value3').value;
      var ey = document.querySelector('.value4').value;
      console.log(x, y);

      var map;
      var marker_s, marker_e, marker_p1, marker_p2;
      var totalMarkerArr = [];
      var drawInfoArr = [];
      var resultdrawArr = [];
      var bounds; //위도 경도 좌표 보여주는 변수
      var lonlat; //지도 위치 원래대로 표시하는 변수

      //키보드,마우스 표시
      function initialize() {
         var map = new Tmap.Map({
            div : "map_div",
            width : '500px',
            height : '500px'
         });
         map.addControl(new Tmap.Control.KeyboardDefaults());
         map.addControl(new Tmap.Control.MousePosition());
      }

      function fn_bound() {
         //지도의 대각선 위경도 좌표를 보여줍니다.
         var bound = map.getBounds(); //지도의 영역을 가져오는 함수
         var result = '[ WGS84 ]영역은 ' + bound + '입니다.'; // 표출할 메시지
         var resultDiv = document.getElementById("result"); // 메시지가 표시될 요소
         resultDiv.innerHTML = result; // 요소의 메시지 값을 변경
      }

      function fn_screenSize() {
         //현재 표시되는 지도의 스크린상의 높이와 폭값을 보여줍니다.
         var screenSize = map.screenSize(); // 지도 화면 사이즈를 가져오는 함수
         var result = '<p>화면 사이즈 (width/height)값은 ' + screenSize.width()
               + '/' + screenSize.height() + '입니다.</p>'; // 표출할 메시지
         var resultDiv = document.getElementById("result"); // 메시지가 표시될 요소
         resultDiv.innerHTML = result; // 요소의 메시지 값을 변경
      }

      //경로안내 요청 함수
      function getRP() {
         var s_latlng = new Tmapv2.LatLng(y, x);
         var e_latlng = new Tmapv2.LatLng(ey, ex);

         var optionObj = {
            reqCoordType : "WGS84GEO", //요청 좌표계 옵셥 설정입니다.
            resCoordType : "WGS84GEO", //응답 좌표계 옵셥 설정입니다.
            trafficInfo : "Y"
         };

         var params = {
            onComplete : onComplete,
            onProgress : onProgress,
            onError : onError
         };

         // TData 객체 생성
         var tData = new Tmapv2.extension.TData();

         // TData 객체의 경로요청 함수
         tData.getRoutePlanJson(s_latlng, e_latlng, optionObj, params);
      }

      //경로안내
      function onComplete() {
         console.log(this._responseData); //json으로 데이터를 받은 정보들을 콘솔창에서 확인할 수 있습니다.

         var jsonObject = new Tmapv2.extension.GeoJSON();
         var jsonForm = jsonObject.rpTrafficRead(this._responseData);

         //교통정보 표출시 생성되는 LineColor 입니다.
         var trafficColors = {

            // 사용자가 임의로 색상을 설정할 수 있습니다.
            // 교통정보 옵션 - 라인색상
            trafficDefaultColor : "#000000", //교통 정보가 없을 때
            trafficType1Color : "#009900", //원할
            trafficType2Color : "#7A8E0A", //서행
            trafficType3Color : "#8E8111", //정체
            trafficType4Color : "#FF0000" //정체
         };
         jsonObject.drawRouteByTraffic(map, jsonForm, trafficColors);
         map.setCenter(new Tmapv2.LatLng(y, x));
         map.setZoom(14);
      }

      //데이터 로드중 실행하는 함수입니다.
      function onProgress() {

      }

      //데이터 로드 중 에러가 발생시 실행하는 함수입니다.
      function onError() {
         alert("onError");
      }

      function initTmap() {
         // 1. 지도 띄우기
         map = new Tmapv2.Map("map_div", {
            center : new Tmapv2.LatLng(y, x),
            width : "100%",
            height : "800px",
            zoom : 14,
            zoomControl : true,
            scrollwheel : true
         });

         // Tmapv2.extension.KeyboardControl를 사용하여 지도를 키보드로 컨트롤 할 수 있는 기능을 추가합니다.
         var keyboardControl = new Tmapv2.extension.KeyboardControl();
         keyboardControl.setMap(map);

         // 2. 시작, 도착 심볼찍기
         // 시작
         marker_s = new Tmapv2.Marker(
               {
                  position : new Tmapv2.LatLng(y, x),
                  icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
                  iconSize : new Tmapv2.Size(24, 38),
                  map : map
               });

         // 도착
         marker_e = new Tmapv2.Marker(
               {
                  position : new Tmapv2.LatLng(ey, ex),
                  icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
                  iconSize : new Tmapv2.Size(24, 38),
                  map : map
               });

         // 3. 경로탐색 API 사용요청
         $.ajax({
                  method : "POST",
                  url : "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=json&callback=result",
                  async : false,
                  data : {
                     "appKey" : "l7xxeecc964391d54ad994319ded9e19e28d",
                     "startX" : x,
                     "startY" : y,
                     "endX" : ex,
                     "endY" : ey,
                     "reqCoordType" : "WGS84GEO",
                     "resCoordType" : "EPSG3857",
                     "startName" : "출발지",
                     "endName" : "도착지"
                  },
                  success : function(response) {
                     var resultData = response.features;

                     //결과 출력
                     var tDistance = "총 거리 : "
                           + ((resultData[0].properties.totalDistance) / 1000)
                                 .toFixed(1) + "km,";
                     var tTime = " 총 시간 : "
                           + ((resultData[0].properties.totalTime) / 60)
                                 .toFixed(0) + "분";

                     $("#result").text(tDistance + tTime);

                     //기존 그려진 라인 & 마커가 있다면 초기화
                     if (resultdrawArr.length > 0) {
                        for ( var i in resultdrawArr) {
                           resultdrawArr[i].setMap(null);
                        }
                        resultdrawArr = [];
                     }

                     drawInfoArr = [];

                     for ( var i in resultData) { //for문 [S]
                        var geometry = resultData[i].geometry;
                        var properties = resultData[i].properties;
                        var polyline_;

                        if (geometry.type == "LineString") {
                           for ( var j in geometry.coordinates) {
                              // 경로들의 결과값(구간)들을 포인트 객체로 변환 
                              var latlng = new Tmapv2.Point(
                                    geometry.coordinates[j][0],
                                    geometry.coordinates[j][1]);
                              // 포인트 객체를 받아 좌표값으로 변환
                              var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                                    latlng);
                              // 포인트객체의 정보로 좌표값 변환 객체로 저장
                              var convertChange = new Tmapv2.LatLng(
                                    convertPoint._lat,
                                    convertPoint._lng);
                              // 배열에 담기
                              drawInfoArr.push(convertChange);
                           }
                        } else {
                           var markerImg = "";
                           var pType = "";
                           var size;

                           if (properties.pointType == "S") { //출발지 마커
                              markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
                              pType = "S";
                              size = new Tmapv2.Size(24, 38);
                           } else if (properties.pointType == "E") { //도착지 마커
                              markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
                              pType = "E";
                              size = new Tmapv2.Size(24, 38);
                           } else { //각 포인트 마커
                              markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
                              pType = "P";
                              size = new Tmapv2.Size(8, 8);
                           }

                           // 경로들의 결과값들을 포인트 객체로 변환 
                           var latlon = new Tmapv2.Point(
                                 geometry.coordinates[0],
                                 geometry.coordinates[1]);

                           // 포인트 객체를 받아 좌표값으로 다시 변환
                           var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                                 latlon);

                           var routeInfoObj = {
                              markerImage : markerImg,
                              lng : convertPoint._lng,
                              lat : convertPoint._lat,
                              pointType : pType
                           };

                           // Marker 추가
                           marker_p = new Tmapv2.Marker({
                              position : new Tmapv2.LatLng(
                                    routeInfoObj.lat,
                                    routeInfoObj.lng),
                              icon : routeInfoObj.markerImage,
                              iconSize : size,
                              map : map
                           });
                        }
                     }//for문 [E]
                     drawLine(drawInfoArr);
                  },
                  error : function(request, status, error) {
                     console.log("code:" + request.status + "\n"
                           + "message:" + request.responseText + "\n"
                           + "error:" + error);
                  }
               });
      }

      function addComma(num) {
         var regexp = /\B(?=(\d{3})+(?!\d))/g;
         return num.toString().replace(regexp, ',');
      }

      function drawLine(arrPoint) {
         var polyline_;

         polyline_ = new Tmapv2.Polyline({
            path : arrPoint,
            strokeColor : "#DD0000",
            strokeWeight : 6,
            map : map
         });
         resultdrawArr.push(polyline_);
      }
   </script>
</body>
</html>