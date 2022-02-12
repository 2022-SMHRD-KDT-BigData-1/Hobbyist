<%@page import="com.message.model.HistoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.message.model.HistoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <a href="index.html" class="logo"
              ><h1><strong>Hobbyist</strong></h1></a
            >
            <ul class="icons">
              <li>
                <a href="#"><span class="label">로그아웃</span></a>
              </li>
              <li>
                <a href="#"><span class="label">메인페이지</span></a>
              </li>
              <li>
                <a href="#"><span class="label">개인정보수정</span></a>
              </li>
            </ul>
          </header>

          <%
          	HistoryDAO dao = new HistoryDAO();
          ArrayList<HistoryDTO> h_list = dao.H_Select();
          %>

          <!-- Section -->
          <section>
            <div>
              <div class="row">
                <form action="#" method="post">
                  <strong align="center"><h1>수강 이력</h1></strong>
                  <br />
                  <p><strong class="inin">수강 이력</strong></p>
                  <br />
                  <table align="center">
                  	<tr>
                  	<td align="center">번호</td>
                  	<td align="center">학원명</td>
                  	<td align="center">위치</td>
                  	<td align="center">요일</td>
                  	<td align="center">시간</td>
                  	<td align="center">전화번호</td>
                  	</tr>
                  	<% 
					if (h_list.isEmpty()) {
						 out.print("<tr><td colspan='6'>현재 가입된 회원이 없습니다.</td></tr>");
					} else {
						 for (int i = 0; i < h_list.size(); i++) {
						       out.print("<tr>");
						       out.print("<td align='center'>" + h_list.get(i).getH_seq() + "</td>");
						       out.print("<td align='center'>" + h_list.get(i).getA_name() + "</td>");
						       out.print("<td align='center'>" + h_list.get(i).getA_city() + "</td>");
						       out.print("<td align='center'>" + h_list.get(i).getH_day() + "</td>");
						       out.print("<td align='center'>" + h_list.get(i).getH_time() + "</td>");
						       out.print("<td align='center'>" + h_list.get(i).getH_tel() + "</td>");
						       out.print("</tr>");
						}
					}

					%>
                  </table>
                </form>
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
              <li><a href="m1.html">My Schedule</a></li>
              <li><a href="m2.html">My Wishlist</a></li>
              <li><a href="m3.html">My History</a></li>
            </ul>
          </nav>

          <!-- Section -->
          <section>
            <header class="major">
              <h2>My Info</h2>
            </header>
            <p></p>
            <ul class="contact">
              <li>
                <a href="#">smhrd@smhrd.co.kr</a>
              </li>
              <li>(000) 000-0000</li>
              <li>
                1234 Somewhere Road #8254<br />
                Nashville, TN 00000-0000
              </li>
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
