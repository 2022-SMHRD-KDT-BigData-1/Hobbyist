<%@page import="com.message.model.ExBoardDAO"%>
<%@page import="com.message.model.ExBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // post 방식으로 전달된 값의 인코딩 타입 설정
%>
<%-- userBean 및 setProperty 액션태그를 이용하여 form에서 전달한 데이터를 board에 설정 --%>
<jsp:useBean id="board" class="com.message.model.ExBoardDTO" />
<jsp:setProperty property="*" name="board" />

<%
	board.setIp(request.getRemoteAddr()); // 작성자의 ip주소 설정

	ExBoardDAO manager = ExBoardDAO.getInstance();
	manager.insertDB(board); // isert 수행 메서드 호출 및 데이터(객체) 전달
%>
<script>
	alert("입력 완료");
	location.href = "communityList.jsp";
</script>