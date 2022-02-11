
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

          <!-- Banner -->

          <!-- Section -->

          <section class="wishlist">
            <h3>Wishlist</h3>
            <div class="row">
              <div class="col-sm-3">
                <h4>Info</h4>
                <div><img src="images/sample_wishlist.jpg" /></div>
                <div>
                  <ul class="alt">
                    <li><strong>모던필라테스</strong></li>
                    <li>광주광역시 남구 봉선동</li>
                    <li>062-672-9030</li>
                    <li>광주 남구 용대로74번길 11-1</li>
                    <li><a href="#" class="button primary small">Call</a></li>
                  </ul>
                </div>
              </div>

              <div class="col-sm-9">
                <h4>map</h4>
                <div class="map">
                  <!-- <img src="images/sample_map.jpg.png" /> -->
                  <!-- * 카카오맵 - 지도퍼가기 -->
                  <!-- 1. 지도 노드 -->
                  <div class="kakao_map">
                    <div
                      id="daumRoughmapContainer1644542523530"
                      class="root_daum_roughmap root_daum_roughmap_landing"
                    ></div>
                  </div>

                  <!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
                  <script
                    charset="UTF-8"
                    class="daum_roughmap_loader_script"
                    src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"
                  ></script>

                  <!-- 3. 실행 스크립트 -->
                  <script charset="UTF-8">
                    new daum.roughmap.Lander({
                      timestamp: "1644542523530",
                      key: "2948y",
                      mapWidth: "1000",
                      mapHeight: "520",
                    }).render();
                  </script>
                </div>
              </div>
            </div>
          </section>
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

