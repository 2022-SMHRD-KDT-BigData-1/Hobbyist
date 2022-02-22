<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxeecc964391d54ad994319ded9e19e28d"></script>
<script type="text/javascript">
	// 페이지가 로딩이 된 후 호출하는 함수입니다.
	function initTmap(){
		// map 생성
		// Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
		var map = new Tmapv2.Map("map_div", { // 지도가 생성될 div
			width : "100%", // 지도의 넓이
			height : "400px" // 지도의 높이
		});
	} 
</script>
</head>
<body onload="initTmap()">
	<div id="map_div"></div>
</body>
</html>