
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML>
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
                <a href="#"><span class="label">Login</span></a>
              </li>
              <li>
                <a href="#"><span class="label">Join</span></a>
              </li>
              <li>
                <a href="#"><span class="label">MyPage</span></a>
              </li>
            </ul>
          </header>

          <!-- Banner -->
          <section id="banner">
            <div class="content">
            <span class="image object">
              <img src="images/yoga.jpg" alt="" />
            </span>
            <div class="content">
            <span class="image object">
              <img src="images/brushes.jpg" alt="" />
            </span>
            <div class="content">
            <span class="image object">
              <img src="images/knit.jpg" alt="" />
            </span>
          </section>
          
          <section id="map_frame">
          <div id="map" style="width: 1200px; height: 500px"></div>
          <script
            type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbeb5d9508706363c850c1665cf88589"
          ></script>
          
          <script>
            var container = document.getElementById("map");
            var options = {
              center: new kakao.maps.LatLng(35.15062349964835, 126.91592863607318),
              level: 3,
            };

            var map = new kakao.maps.Map(container, options);
          </script>
          </section>
          <section id="search_map" class="alt">
            <form method="post" action="#">
              <input type="text" name="query" id="query_map" placeholder="Search" />
            </form>
          </section>

          <!-- Section -->
          <section>
            <header class="major">
              <h2>Ipsum sed dolor</h2>
            </header>
            <div class="posts">
              <article>
                <a href="#" class="image"
                  ><img src="images/pic01.jpg" alt=""
                /></a>
                <h3>Gym / Sports</h3>
                <p>
                  Aenean ornare velit lacus, ac varius enim lorem ullamcorper
                  dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
                  lorem feugiat tempus aliquam.
                </p>
                <ul class="actions">
                  <li><a href="#" class="button">More</a></li>
                </ul>
              </article>
              <article>
                <a href="#" class="image"
                  ><img src="images/pic02.jpg" alt=""
                /></a>
                <h3>Music / Dance</h3>
                <p>
                  Aenean ornare velit lacus, ac varius enim lorem ullamcorper
                  dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
                  lorem feugiat tempus aliquam.
                </p>
                <ul class="actions">
                  <li><a href="#" class="button">More</a></li>
                </ul>
              </article>

              <article>
                <a href="#" class="image"
                  ><img src="images/pic04.jpg" alt=""
                /></a>
                <h3>Cooking / Barista</h3>
                <p>
                  Aenean ornare velit lacus, ac varius enim lorem ullamcorper
                  dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
                  lorem feugiat tempus aliquam.
                </p>
                <ul class="actions">
                  <li><a href="#" class="button">More</a></li>
                </ul>
              </article>
              <article>
                <a href="#" class="image"
                  ><img src="images/pic05.jpg" alt=""
                /></a>
                <h3>북구</h3>
                <p>
                  Aenean ornare velit lacus, ac varius enim lorem ullamcorper
                  dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
                  lorem feugiat tempus aliquam.
                </p>
                <ul class="actions">
                  <li><a href="#" class="button">More</a></li>
                </ul>
              </article>
              <article>
                <a href="#" class="image"
                  ><img src="images/pic05.jpg" alt=""
                /></a>
                <h3>광산구</h3>
                <p>
                  Aenean ornare velit lacus, ac varius enim lorem ullamcorper
                  dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
                  lorem feugiat tempus aliquam.
                </p>
                <ul class="actions">
                  <li><a href="#" class="button">More</a></li>
                </ul>
              </article>
              <h3>광산구</h3>
                <p>
                  Aenean ornare velit lacus, ac varius enim lorem ullamcorper
                  dolore. Proin aliquam facilisis ante interdum. Sed nulla amet
                  lorem feugiat tempus aliquam.
                </p>
                <ul class="actions">
                  <li><a href="#" class="button">More</a></li>
                </ul>
              </article>
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
              <li><a href="m1.html">Sports / Workout</a></li>
              <li><a href="m2.html">Dance / Music </a></li>
              <li><a href="m3.html">Art / Drawing</a></li>
              <li><a href="m4.html">Beauty / Make-up </a></li>
              <li><a href="m5.html">Cooking / Barista</a></li>
            </ul>
          </nav>

          <!-- Section -->
          <section>
            <header class="major">
              <h2>Community</h2>
            </header>
            <p></p>
            <ul class="contact">
              <li class="icon solid fa-envelope">
                <a href="#">information@untitled.tld</a>
              </li>
              <li class="icon solid fa-phone">(000) 000-0000</li>
              <li class="icon solid fa-home">
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

