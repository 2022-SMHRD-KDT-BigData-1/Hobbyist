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
   String start = request.getParameter("start");
   String end = request.getParameter("end");
   /* String dong = request.getParameter("dong");
   String pos = request.getParameter("position"); */
   %>
   <!-- ??????????????????????????? ????????? ????????? ????????? ??? ??????.. ????????? ???????????? type??? hidden?????? ?????? ?????? -->
   <input type="hidden" value="<%=start%>" class="start">
   <input type="hidden" value="<%=end%>" class="end">
   <%-- <input type="hidden" value="<%= dong %>" class="value2">
   <input type="hidden" value="<%= pos %>" class="value3"> --%>

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
                  <li><a href="logout.jsp"><span class="label">????????????</span></a></li>
                  <li><a href="history.jsp"><span class="label">????????????</span></a></li>
                  <li><a href="update.jsp"><span class="label">?????? ????????????</span></a></li>
                  <%
                     }else{
                        %>
                  <li><a href="Login.jsp"><span class="label">?????????</span></a></li>
                  <li><a href="Join.jsp"><span class="label">????????????</span></a></li>
                        <%
                     }
                  %>
               </ul> 
            </header>
         </div>

         <div id="category_wrapper_wrapper">
            <script>
                  var value1 = document.querySelector('.start').value;
                  var value2 = document.querySelector('.end').value;
                  /* var value2 = document.querySelector('.value2').value+"???";
                  var value3 = document.querySelector('.value3').value;
                  console.log(value1);
                  console.log(value2);
                  console.log(value3);   */
                  /* var adr = "???????????????";
                  var position1 = adr.concat(value1);
                  var position2 = position1.concat(value2); */
                  </script>
            <div class="category_wraper">
               <span>?????? ???????????????.</span>
            </div>
         </div>
         <div id="recWrapper">
            <div id="recMap">
               
               
               
               
               
               
               <script type="text/javascript"
                  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29fc3997888570a1dca257593cd4be4a&libraries=services"></script>
               <script>
                  window.onload = function(){
                     var mapContainer = document.getElementById('recMap'), // ????????? ????????? div 
                      mapOption = {
                          center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
                          level: 3 // ????????? ?????? ??????
                      };
                     // ????????? ???????????????    
                     var map = new kakao.maps.Map(mapContainer, mapOption); 
                     // ??????-?????? ?????? ????????? ???????????????
                     var geocoder = new kakao.maps.services.Geocoder();
                     
                     
                     //????????????,????????? ????????????
                     var start;
                     var end;
                  
                  
                     // ????????? ????????? ??????????????? (????????????)
                     geocoder.addressSearch(value1,function(result, status) {
                         // ??????????????? ????????? ??????????????? 
                          if (status === kakao.maps.services.Status.OK) {
                             var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                             // ??????, ????????? ??????????????? ??????
                                /*console.log("test "+ coords);*/
                             start = coords;
                          // ??????????????? ?????? ????????? ????????? ???????????????
                             var marker = new kakao.maps.Marker({
                                 map: map,
                                 position: coords 
                             });
                             // ?????????????????? ????????? ?????? ????????? ???????????????
                             var infowindow = new kakao.maps.InfoWindow({
                                 content: '<div style="width:150px;text-align:center;padding:6px 0;">????????? ??????</div>'
                             });
                             infowindow.open(map, marker);
                             // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
                             map.setCenter(coords);
                             console.log("?????????"+start);
                             /*location.href = "Tmap.jsp?start="+coords+"and end="+;*/
                         } 
                     });
                     console.log("?????????"+start);
                     
                     // ????????? ????????? ??????????????? (????????????)
                     geocoder.addressSearch(value2,function(result, status) {
                         // ??????????????? ????????? ??????????????? 
                          if (status === kakao.maps.services.Status.OK) {
                             var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);
                             // ??????, ????????? ??????????????? ??????
                                /*console.log("test "+ coords);*/
                             end = coords2;
                          // ??????????????? ?????? ????????? ????????? ???????????????
                             var marker = new kakao.maps.Marker({
                                 map: map,
                                 position: coords2
                             });
                             // ?????????????????? ????????? ?????? ????????? ???????????????
                             var infowindow = new kakao.maps.InfoWindow({
                                 content: '<div style="width:150px;text-align:center;padding:6px 0;">????????? ??????</div>'
                             });
                             infowindow.open(map, marker);
                             // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
                             map.setCenter(coords2);
                             console.log("?????????"+end);
                            /*location.href = "Tmap.jsp?start="+coords+"and end="+;*/
                         } 
                     });
                     console.log("?????????"+end);
                  
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
                  <li><a href="towninput.jsp">????????????????????????</a></li>
                  <li><a href="Recommend.jsp">??????????????? ??????</a></li>
                  <li><a href="geo.jsp">????????? </a></li>
                  <li><a href="communityList.jsp">?????????</a></li>
                  <li><a href="WishlistSelectCon">??????????????? </a></li>
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
                  <li><%= member.getM_nick() %>??? ???????????????.
                  </li>
               <%
                        }else {
                           %>
                           <li>???????????? ????????????</li>
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