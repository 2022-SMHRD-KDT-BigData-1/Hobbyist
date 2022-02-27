<%@page import="com.message.model.AddrDTO"%>
<%@page import="com.message.model.MemberDTO"%>
<%@page import="com.message.model.HistoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.message.model.HistoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	MemberDTO member = (MemberDTO) session.getAttribute("member");
	ArrayList <AddrDTO> addr = (ArrayList <AddrDTO>) session.getAttribute("H_select2");
	ArrayList <HistoryDTO> his = (ArrayList <HistoryDTO>) session.getAttribute("H_select");

%>   

<!DOCTYPE html>
<!--
   Editorial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
  <head>
    <title>Hobbyist</title>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, user-scalable=no"
    />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link
      href="https://fonts.googleapis.com/
    icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <style type="text/css">
      a {
        text-decoration: none;
        color: #f45c5c;
      }
      .lastsub {
        width: 50px;
      }
      .inin {
        color: #f45c5c;
      }
    </style>
  </head>
  <body class="is-preload">
    <!-- Wrapper -->
    <div id="wrapper">
      <!-- Main -->
      <div id="main">
        <div class="inner">
          <!-- Header -->
          <header id="header">
            <a href="main.jsp" class="logo"
              ><h1><strong>Hobbyist</strong></h1></a
            >
            <!-- <ul class="icons">
              <li>
                <a href="#"><span class="label">로그아웃</span></a>
              </li>
              <li>
                <a href="#"><span class="label">메인페이지</span></a>
              </li>
              <li>
                <a href="#"><span class="label">개인정보수정</span></a>
              </li>
            </ul> -->
             <ul class="icons">
                  <%
                     if(member != null) {
                  %>
                  <li><a href="logout.jsp"><span class="label">로그아웃</span></a></li>
                  <li><a href="HistoryCon"><span class="label">수강관리</span></a></li>
                  <li><a href="update.jsp"><span class="label">정보수정</span></a></li>
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

          
          <!-- Section -->
          <section>
            <div>
              <div class="row">
                  <strong align="center"><h1>My Page</h1></strong>
                  <br />
                  <!-- <p><strong class="inin">My Page</strong></p> -->
                  <br />
                  <table align="center">
                  	<tr>
                  	<td align="center">번호</td>
                  	<td align="center">학원명</td>
                  	<td align="center">위치</td>
                  	<td align="center">요일</td>
                  	<td align="center">시간</td>
                  	<td align="center">홈페이지</td>
                  	<td align="center"></td>
                  	</tr>
                  	<%
                  		int cnt = 1;
                  		for(int i = 0; i < his.size(); i++) {
                  	%>
                  	<form action ="HistoryDeleteCon" method="post">
                  	<tr>
                  	<td align="center"><%= cnt %></td>
                  	<td align="center"><%= addr.get(i).getAc_name() %></td>
                  	<td align="center"><%= addr.get(i).getAc_addr()%></td>
                  	<td align="center"><%= his.get(i).getH_day() %></td>
                  	<td align="center"><%= his.get(i).getH_time() %></td>
                  	<td align="center"><a href="<%= addr.get(i).getAc_rel()%>" target="_blank"><%= addr.get(i).getAc_rel()%></a></td>
                  	<td align="center"><button type ="submit" name="ac" value ="<%=addr.get(i).getAc_id() %>">[삭제]</button></td>
                  	</tr>
                  	</form>
                  <%
                  	cnt++;
                  		}
                  %>
					<tr>
						<td colspan="6" align="center"><a href="manage.jsp" >수강 정보 추가하기</a></td>
					</tr>
                  </table>
              </div>
            </div>
          </section>
        </div>
      </div>
      
      <input type = "checkbox">

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
              &copy; Untitled. All rights reserved. Demo Images:
              <a href="https://unsplash.com">Unsplash</a>. Design:
              <a href="https://html5up.net">HTML5 UP</a>.
            </p>
          </footer>
        </div>
      </div>
    </div>
    
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
</html>
