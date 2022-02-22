<%@page import="com.message.model.ExBoardDTO"%>
<%@page import="com.message.model.ExBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식의 파라미터 인코딩 타입 설정
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));
	String passwd = request.getParameter("passwd");
	ExBoardDAO manager = ExBoardDAO.getInstance();
	ExBoardDTO board = manager.getBoard(no);
	// 입력된 비밀번호와 DB의 비밀번호가 같다면
	if(passwd.equals(board.getPasswd())){
		manager.deleteDB(no); // delete 수행
%>
	<script>
		alert("삭제 완료");
		location.href="communityList.jsp";
	</script>
<%
	}else{ // 입력된 비밀번호가 다르면
%>
	<script>
		alert("비밀번호가 다릅니다.");
		history.go(-1);
	</script>
<%
	}
%>