<%@page import="com.message.model.MemberDTO"%>
<%@page import="com.message.model.ExBoardDTO"%>
<%@page import="com.message.model.ExBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
// get 방식으로 전달된  no값을 할당
int no = Integer.parseInt(request.getParameter("no"));
ExBoardDAO manager = ExBoardDAO.getInstance();
// getBoard 메서드로 해당 no의 데이터를 반환 받음
ExBoardDTO board = manager.getBoard(no);
MemberDTO member = (MemberDTO) session.getAttribute("member");
%>

<html>
<head>
<title>Hobbyist</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link
	href="https://fonts.googleapis.com/
    icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<style>
#main>div>section>header h2 {
	font-family: "SUIT-Medium";
}

#main>div>section>div>article h3 {
	font-family: "SUIT-Medium";
}

#main>div>section>div>article a {
	font-family: "SUIT-Medium";
	margin-right: 2em;
}

a {
	text-decoration: none;
	color: #f45c5c;
}

#map_search {
	font-size: 11px;
	float: left;
}

#main_map {
	background-color: #f56a6a;
	border-radius: 0.25em;
	border: 0px;
	outline: none;
	float: right;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%-- 유효성 검사 --%>
<script>
	$(function() {
		$("form").submit(function() {
			if ($("#name").val() === "") {
				alert("이름 입력");
				$("#name").focus();
				return false;
			}
			if ($("#passwd").val() === "") {
				alert("비밀번호 입력");
				$("#passwd").focus();
				return false;
			}
			if ($("#subject").val() === "") {
				alert("제목 입력");
				$("#subject").focus();
				return false;
			}
			if ($("#content").val() === "") {
				alert("내용 입력");
				$("#content").focus();
				return false;
			}
		})
	})
</script>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header"> <a href="main.jsp" class="logo"><h1>
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
				<center>
					<h3>글 수정 양식</h3>
					<%-- 확인 시 post 방식으로 해당 값을 갖고 update.jsp로 이동 --%>
					<form action="communityUpdate.jsp" method="post">
						<%-- hidden 값으로 no를 갖고 넘어감 / primary key --%>
						<input type="hidden" name="no" value="<%=no%>">
						<table border="1">
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" id="name"
									value="<%=board.getName()%>"></td>
								<td>비밀번호</td>
								<td><input type="password" name="passwd" id="passwd"></td>
							</tr>
							<tr>
								<td>제목</td>
								<td colspan="3"><input type="text" name="subject"
									id="subject" size="58" value="<%=board.getSubject()%>"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="3"><pre>
										<textarea rows="15" cols="60" name="content" id="content"><%=board.getContent()%></textarea>
									</pre></td>
							</tr>
							<tr align="center">
								<td colspan="4"><input type="submit" value="확인"> <input
									type="button" value="취소" onclick="history.go(-1)"></td>
							</tr>
						</table>
					</form>
				</center>
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
				<nav id="menu"> <header class="major">
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
				<section> <header class="major">
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>