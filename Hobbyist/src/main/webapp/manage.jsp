<%@page import="com.message.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	MemberDTO member = (MemberDTO) session.getAttribute("member");%>
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
            <a href="main2.jsp" class="logo"
              ><h1><strong>Hobbyist</strong></h1></a
            >
            <ul class="icons">
                  <%
                     if(member != null) {
                  %>
                  <li><a href="logout.jsp"><span class="label">로그아웃</span></a></li>
                  <li><a href="HistoryCon"><span class="label">수강관리</span></a></li>
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

          <!-- Banner -->

          <!-- Section -->
          <section>
            <div>
              <div class="row">
                <form action="ManageCon" method="post">
                  <strong align="center"><h1>수강 관리</h1></strong>
                  <br />
                  <p><strong class="inin">수강 정보 입력</strong></p>
                  <br />
                  <table width="300px" height="400px" align="center">
                    <tr class="row2">
                      <td class="text1">학
                      원 명</td>
                      <td>
                        <input
                          type="text"
                          name="classname"
                          placeholder="내용을 입력하세요"
                        />
                      </td>
                    </tr>
                    <tr class="row2">
                      <td class="text1">지역명</td>
                      <td>
                        <input
                          type="text"
                          name="city"
                          placeholder="내용을 입력하세요"
                        />
                      </td>
                    </tr>
                    <tr class="row2">
                      <td>요일</td>
                      <td>
                      	
                        <input type="checkbox" name="day" value="월" id="mon"/>
                        <label for="mon">월요일</label>
                        
                        <input type="checkbox" name="day" value="화" id="tue"/>
                        <label for="tue">화요일</label>
                        
                        <input type="checkbox" name="day" value="수" id="wed"/>
                        <label for="wed">수요일</label>
                        
                        <input type="checkbox" name="day" value="목" id="thu"/>
                        <label for="thu">목요일</label>
                        
                        <input type="checkbox" name="day" value="금" id="fri"/>
                        <label for="fri">금요일</label>
                        
                        <input type="checkbox" name="day" value="토" id="sat"/>
                        <label for="sat">토요일</label>
                        
                        <input type="checkbox" name="day" value="일" id="sun"/>
                        <label for="sun">일요일</label>
                        
                      </td>
                    </tr>
                    <tr class="row2">
                      <td class="text1">시간</td>
                      <td>
                        <select name="time">
                          <option value="6:00 - 8:00" >6:00 - 8:00</option>
                          <option value="8:00 - 10:00" >8:00 - 10:00</option>
                          <option value="10:00 - 12:00" >10:00 - 12:00</option>
                          <option value="12:00 - 14:00" >12:00 - 14:00</option>
                          <option value="14:00 - 16:00" >14:00 - 16:00</option>
                          <option value="16:00 - 18:00" >16:00 - 18:00</option>
                          <option value="18:00 - 20:00" >18:00 - 20:00</option>
                          <option value="20:00 - 22:00" >20:00 - 22:00</option>
                        </select>
                      </td>
                    </tr>

                    <tr class="lastsub">
                      <td> </td>
                      <td align="center">
                      	<input type = "submit" value = "등록">
                      </td>
                       
                      
                    </tr>
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
