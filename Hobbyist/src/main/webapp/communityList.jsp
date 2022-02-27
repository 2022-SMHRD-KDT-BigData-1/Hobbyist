<%@page import="com.message.model.MemberDTO"%>
<%@page import="com.message.model.ExBoardDTO"%>
<%@page import="com.message.model.ExBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
MemberDTO member = (MemberDTO) session.getAttribute("member");
SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm");

String sel = request.getParameter("sel"); // 검색 옵션의 value
String find = request.getParameter("find"); // 검색어 value

int pageSize = 10; // 한 페이지에 출력할 레코드 수

// 페이지 링크를 클릭한 번호 / 현재 페이지
String pageNum = request.getParameter("pageNum");
if (pageNum == null) { // 클릭한게 없으면 1번 페이지
	pageNum = "1";
}
// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
int currentPage = Integer.parseInt(pageNum);

// 해당 페이지에서 시작할 레코드 / 마지막 레코드
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;

int count = 0;
int fCount = 0;

ExBoardDAO manager = ExBoardDAO.getInstance();
count = manager.getCount(); // 데이터베이스에 저장된 총 갯수

fCount = manager.getfCount(sel, find); // DB에 저장된 검색어와 일치하는 총 갯수

List<ExBoardDTO> list = null;
List<ExBoardDTO> flist = null;

if (count > 0 && find == null) {
	// getList()메서드 호출 / 해당 레코드 반환
	list = manager.getList(startRow, endRow);
}

if (fCount > 0) {
	flist = manager.getfList(startRow, endRow, sel, find);
}
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
<%-- 검색버튼 클릭시 유효성 검사 --%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("form").submit(function() {
			if ($("#find").val() === "") {
				alert("검색어를 입력하세요.");
				$("#find").focus();
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
					<h3>게시글 목록</h3>
					(총 레코드 수 :
					<%=count%>
					/ 검색 데이터 수 :
					<%=fCount%>)
					<table border="1" width="900">
						<tr>
							<td width="10%">번호</td>
							<td width="15%">이름</td>
							<td width="30%">제목</td>
							<td width="20%">작성일</td>
							<td width="10%">조회수</td>
						</tr>
						<%
						if (count > 0 && fCount == 0 && find == null) { // 데이터베이스에 데이터가 있으면
							int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
							for (int i = 0; i < list.size(); i++) {
								ExBoardDTO board = list.get(i); // 반환된 list에 담긴 참조값 할당
						%>
						<tr>
							<td><%=number--%></td>
							<td><%=board.getName()%></td>
							<td>
								<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum을 갖고 content.jsp로 이동 --%>
								<a
								href="communityContent.jsp?no=<%=board.getNo()%>&pageNum=<%=currentPage%>"><%=board.getSubject()%></a>
							</td>
							<td><%=df.format(board.getReg_date())%></td>
							<td><%=board.getReadCount()%></td>
						</tr>
						<%
						}
						} else if (count == 0) { // 데이터가 없으면
						%>
						<tr>
							<td colspan="6" align="center">게시글이 없습니다.</td>
						</tr>
						<%
						} else if (count > 0 && fCount != 0) { // 검색한 데이터가 있으면
						int number = fCount - (currentPage - 1) * pageSize; // 글 번호 순번
						for (int i = 0; i < flist.size(); i++) {
							ExBoardDTO board = flist.get(i);
						%>
						<tr>
							<td><%=number--%></td>
							<td><%=board.getName()%></td>
							<td>
								<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum, sel, find를 갖고 content.jsp로 이동 --%>
								<a
								href="communityContent.jsp?no=<%=board.getNo()%>&pageNum=<%=currentPage%>&sel=<%=sel%>&find=<%=find%>"><%=board.getSubject()%></a>
							</td>
							<td><%=df.format(board.getReg_date())%></td>
							<td><%=board.getReadCount()%></td>
							<td><%=board.getIp()%></td>
						</tr>
						<%
						}
						} else { // 검색된 데이터가 없으면
						%>
						<tr>
							<td colspan="6" align="center">게시글이 없습니다.</td>
						</tr>
						<%
						}
						%>
						<tr>
							<td colspan="6" align="right">
								<%-- 버튼을 클릭하면 writeForm.jsp로 이동 --%> <input type="button"
								value="글작성" onclick="location.href='communityWriteForm.jsp'">
							</td>
						</tr>
						<tr>
							<td colspan="6" align="center">
								<%
								// 페이징  처리(모든 레코드)
								if (count > 0 && fCount == 0 && find == null) {
									// 총 페이지의 수
									int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
									// 한 페이지에 보여줄 페이지 블럭(링크) 수
									int pageBlock = 10;
									// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
									int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
									int endPage = startPage + pageBlock - 1;

									// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
									if (endPage > pageCount) {
										endPage = pageCount;
									}

									if (startPage > pageBlock) { // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
								%> <a href="communityList.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
								<%
								}

								for (int i = startPage; i <= endPage; i++) { // 페이지 블록 번호
								if (i == currentPage) { // 현재 페이지에는 링크를 설정하지 않음
								%> [<%=i%>] <%
								} else { // 현재 페이지가 아닌 경우 링크 설정
								%> <a href="communityList.jsp?pageNum=<%=i%>">[<%=i%>]
							</a> <%
 }
 } // for end
 if (endPage < pageCount) { // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
 %> <a href="communityList.jsp?pageNum=<%=startPage + 10%>">[다음]</a> <%
 }
 } else if (fCount > 0) { // 페이징 처리(검색 데이터)
 // 검색된 레코드의 총 페이지의 수
 int pageCount = fCount / pageSize + (fCount % pageSize == 0 ? 0 : 1);
 // 한 페이지에 보여줄 페이지 블럭(링크) 수
 int pageBlock = 10;
 // 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
 int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
 int endPage = startPage + pageBlock - 1;

 // 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
 if (endPage > pageCount) {
 endPage = pageCount;
 }

 if (startPage > pageBlock) {
 %> <a
								href="communityList.jsp?pageNum=<%=startPage - 10%>&sel=<%=sel%>&find=<%=find%>">[이전]</a>
								<%
								}

								for (int i = startPage; i <= endPage; i++) {
								if (i == currentPage) { // 현재 페이지는 링크를 설정하지 않음
								%> [<%=i%>] <%
								} else { // 현재 페이지가 아닌 경우 링크
								%> <a
								href="communityList.jsp?pageNum=<%=i%>&sel=<%=sel%>&find=<%=find%>">[<%=i%>]
							</a> <%
 }
 }

 if (endPage < pageCount) {
 %> <a
								href="communityList.jsp?pageNum=<%=startPage + 10%>&sel=<%=sel%>&find=<%=find%>">[다음]</a>
								<%
								}
								}
								%>
							</td>
						</tr>
						<form method="get" action="communityList.jsp">
						<tr>
							<td colspan="2">
								<%-- 검색어 입력 form / get방식 / option value는 데이터베이스 칼럼과 동일하게 설정 --%>
								<select name="sel">
									<option value="name">이름</option>
									<option value="subject">제목</option>
							</select>
							</td>
							<td colspan="3"><input type="text" name="find" id="find"></td>
							<td><input type="submit" value="검색"></td>
						</tr>
						</form>
					</table>
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
                  <li><a href="towninput.jsp">우리동네에서찾기</a></li>
                  <li><a href="RecommendMove.jsp">카테고리별 검색</a></li>
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