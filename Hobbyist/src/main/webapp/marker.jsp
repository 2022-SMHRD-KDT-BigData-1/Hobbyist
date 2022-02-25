<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.message.model.MarkerDAO"%>
<%@page import="com.message.model.MarkerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>
<% ArrayList<MarkerDTO> locmarker = new ArrayList<MarkerDTO>();
MarkerDAO dao = new MarkerDAO();
locmarker = dao.marSelect(); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>마커, 클러스터러</title>
</head>
<style>
	
	#map{
		float: right;
		width: 100%;
		height:800px;
	}
	
</style>
<body>


<% for(int i = 0 ; i < locmarker.size(); i++){ %>
	<input type="hidden" value="<%= locmarker.get(i).getAC_NAME() %>,<%= locmarker.get(i).getAC_WI() %>,<%= locmarker.get(i).getAC_KY() %>,<%= locmarker.get(i).getAC_ADDR() %>,<%= locmarker.get(i).getAC_IMG() %>,<%= locmarker.get(i).getAC_REV() %>" class="locmarker">
<% } %>
	<div id="map">

		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29fc3997888570a1dca257593cd4be4a&libraries=clusterer"></script>
		<script>

		<!-- 동민이 바보 -->
		
		
		window.onload = function(){

				var myLocmarker = document.querySelectorAll('.locmarker');
				
				var locArray = new Array(myLocmarker.length);
				
				
				for(var i = 0; i < myLocmarker.length; i++){
					locArray[i] = new Array(6);
					var arr = myLocmarker[i].value.split(',');;
					locArray[i][0] = arr[0];
					locArray[i][1] = arr[1];
					locArray[i][2] = arr[2];
					locArray[i][3] = arr[3];
					locArray[i][4] = arr[4];
					locArray[i][5] = arr[5];
					}

				var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(35.149991076387956, 126.91984847674928), // 지도의 중심좌표
				        level: 4, // 지도의 확대 레벨
				        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
				    }; 
				
				
				<%-- // 지도를 생성한다--%> 
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				//클러스터러 추가
				var clusterer = new kakao.maps.MarkerClusterer({
				        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
				        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
				        minLevel: 4 // 클러스터 할 최소 지도 레벨 
				    });
	
				var markers = [];
				
				for(var i =0; i<locArray.length; i++){
					// 지도에 마커를 생성하고 표시한다
					var marker = new kakao.maps.Marker({
						position: new kakao.maps.LatLng(locArray[i][1], locArray[i][2]),
						map: map // 마커를 표시할 지도 객체
					});
					
					var infowindow = new kakao.maps.InfoWindow({
					    content :"<div style='padding: 5px'><img src=locArray[i][4]/>"+locArray[i][0]+"</div>" // 인포윈도우에 표시할 내용
					});
		
			/*for(var i =0;i<pos.length;i++)
					// 지도에 마커를 생성하고 표시한다
					var marker = new kakao.maps.Marker({
						position: new kakao.maps.LatLng(pos[i][0], pos[i][1]),
						map: map // 마커를 표시할 지도 객체
					});
					
					var infowindow = new kakao.maps.InfoWindow({
					    content : pos[i][2] // 인포윈도우에 표시할 내용
					});
					 */
					// 인포윈도우를 지도에 표시한다
				    /* 	infowindow.open(map, marker);  */
					// markers라는 변수 안에 marker라는 마커를 집어 넣음.
					markers.push(marker);
					kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				}
				//클러스터러에 마커들을 추가
				clusterer.addMarkers(markers);
				
				//마우스를 마커에 가져다 댔을때에만 인포윈도우를 띄우는 함수
				// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
				function makeOverListener(map, marker, infowindow) {
				    return function() {
				        infowindow.open(map, marker);
				    };
				
				}
			
				function makeOutListener(infowindow) {
				    return function() {
				        infowindow.close();
				    };

				}
			
			}
		</script>
	</div>
</body>
</html>