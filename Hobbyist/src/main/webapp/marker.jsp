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
	.wrap {position: absolute;left: 0;bottom: 40px;width: 400px;height: 220px;margin-left: -144px;text-align: left;overflow: hidden;font-size: px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;background-color: white;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 400px;height: 220px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;background-color: #f1f2f6;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #c44569;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;color:white;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<body>


<% for(int i = 0 ; i < locmarker.size(); i++){ %>
	<input type="hidden" value="<%= locmarker.get(i).getAC_NAME() %>,<%= locmarker.get(i).getAC_WI() %>,<%= locmarker.get(i).getAC_KY() %>,<%= locmarker.get(i).getAC_ADDR() %>,<%= locmarker.get(i).getAC_IMG() %>,<%= locmarker.get(i).getAC_REV() %>,<%= locmarker.get(i).getAC_REL() %>" class="locmarker">
<% } %>
	<div id="map">
		<script src="./assets/js/jquery.min.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29fc3997888570a1dca257593cd4be4a&libraries=clusterer"></script>
		<script>
		var markers = [];
		var overlays = [];
		
		function makeClickListener(map, marker, overlay) {
		    return function() {
		        overlay.setMap(map)
		    };
		}
		
		<%-- // 지도를 생성한다--%> 
		var map; 
		var overlay;
		//window.onload = function(){
				var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(35.149991076387956, 126.91984847674928), // 지도의 중심좌표
			        level: 4, // 지도의 확대 레벨
			        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
			    }; 
				map = new kakao.maps.Map(mapContainer, mapOption);
				var myLocmarker = document.querySelectorAll('.locmarker');
				
				var locArray = new Array(myLocmarker.length);
				
				
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

				
				//클러스터러 추가
				var clusterer = new kakao.maps.MarkerClusterer({
				        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
				        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
				        minLevel: 4 // 클러스터 할 최소 지도 레벨 
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
		</script>
	</div>
</body>
</html>