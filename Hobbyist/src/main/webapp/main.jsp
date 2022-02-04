<%@page import="com.message.model.MessageDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.message.model.MessageDAO"%>
<%@page import="com.message.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
// MemberDTO member = session.getAttribute("member");
//	object타입으로 세션을 받아오기 때문에 다운캐스팅 필수
	MemberDTO member = (MemberDTO) session.getAttribute("member");
	
	MessageDAO dao = new MessageDAO();
	ArrayList<MessageDTO> msglist=null;
	
	if(member!=null){ //로그인한 상태임을 조건으로 명시
		msglist=dao.messageSelect(member.getM_email());
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt"> <a href="index.html"
			class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a> <nav>
		<!-- 로그인 후 Logout.jsp로 이동할 수 있는'로그아웃'링크와 '개인정보수정'링크를 출력하시오. --> 
		<%
		if (member == null) { %>
		<a href="#menu">로그인</a> <%
 } else {
 	if(member.getM_email().equals("admin")){%> 			
 		<a href="MemberSelectAllCon">회원관리</a>
 		<a href="logout.jsp">로그아웃</a>
 	<% }else{%>
 		<a href="update.jsp">개인정보수정</a> 
 		<a href="logout.jsp">로그아웃</a>
	<%}
 }%>
  </nav> </header>

		<!-- Menu -->
		<nav id="menu">
		<ul class="links">
			<li><h5>로그인</h5></li>
			<form action="LoginCon.do" method="post">
				<li><input type="text" name="email" placeholder="Email을 입력하세요"></li>
				<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>
		<ul class="actions vertical">
			<li><h5>회원가입</h5></li>
			<form action="JoinCon.do" method="post">
				<li><input type="text" name="m_email"
					placeholder="Email을 입력하세요"></li>
				<li><input type="password" name="m_pw" placeholder="PW를 입력하세요"></li>
				<li><input type="text" name="m_tel" placeholder="전화번호를 입력하세요"></li>
				<li><input type="text" name="m_address"
					placeholder="집주소를 입력하세요"></li>
				<li><input type="submit" value="JoinUs" class="button fit"></li>
			</form>
		</ul>
		</nav>
		<!-- Banner -->
		<section id="banner" class="major">
		<div class="inner">
			<header class="major"> <%
 if (member == null) {
 %>
			<h1>로그인 한 세션아이디를 출력해주세요</h1>
			<%
			} else {
			%>
			<h1><%=member.getM_email()%></h1>
			<%
			}
			%> </header>
			<div class="content">
				<p>
					아래는 지금까지 배운 웹 기술들입니다.<br>
				</p>
				<ul class="actions">
					<li><a href="#one" class="button next scrolly">확인하기</a></li>
				</ul>
			</div>
		</div>
		</section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one" class="tiles"> <article> <span
				class="image"> <img src="images/pic01.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">HTML</a>
			</h3>
			<p>홈페이지를 만드는 기초 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic12.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">CSS</a>
			</h3>
			<p>HTML을 디자인해주는 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic03.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Servlet/JSP</a>
			</h3>
			<p>Java를 기본으로 한 웹 프로그래밍 언어/스크립트 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic04.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">JavaScript</a>
			</h3>
			<p>HTML에 기본적인 로직을 정의할 수 있는 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic05.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">MVC</a>
			</h3>
			<p>웹 프로젝트 중 가장 많이 사용하는 디자인패턴</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic06.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Web Project</a>
			</h3>
			<p>여러분의 최종프로젝트에 웹 기술을 활용하세요!</p>
			</header> </article> </section>
			<!-- Two -->
			<section id="two">
			<div class="inner">
				<header class="major">
				<h2>나에게 온 메세지 확인하기</h2>
				</header>
				<p></p>
				<ul class="actions">
				<%
					if(member==null){
						out.print("<li>로그인을 하세요.</li>");
					}else{
						//isEmpty(): 리스트 내 데이터가 없는 경우 true를 반환
						if(msglist.isEmpty()){
							out.print("<li>현재 도착한 메시지가 없습니다.</li>");
						}else{
							for(int i =0;i<msglist.size();i++){
								out.print("<li>");
								out.print("<strong>보낸 사람</strong>:"+msglist.get(i).getM_sendName()+"<br>");
								out.print("<strong>내용</strong>"+msglist.get(i).getM_content()+"<br>");
								out.print("<strong>날짜</strong>"+msglist.get(i).getM_sendDate()+"<br>");
								out.print("<a href='MsgDeleteCon?num="+msglist.get(i).getM_num()+"'>삭제</a>");
								out.print("</li>");
							}
							out.print("<li><a href='MsgDeleteAllCon' class=\"button next scrolly\">전체삭제하기</a></li>");
						}
					}
				
				%>
					
					
				</ul>
			</div>
			</section>

		</div>

		<!-- Contact -->
		<section id="contact">
		<div class="inner">
			<section>
			<form action="MsgSendCon" method="post">
				<div class="field half first">
					<label for="name">Name</label> <input type="text" name="name" id="name"
						placeholder="보내는 사람 이름" />
				</div>
				<div class="field half">
					<label for="email">Email</label> <input type="text" name="email" id="email"
						placeholder="보낼 사람 이메일" />
				</div>

				<div class="field">
					<label for="message">Message</label>
					<textarea name ="message" id="message" rows="6"></textarea>
				</div>
				<ul class="actions">
					<li><input type="submit" value="Send Message" class="special" /></li>
					<li><input type="reset" value="Clear" /></li>
				</ul>
			</form>
			</section>

			<section class="split"> <section>
			<div class="contact-method">
				<span class="icon alt fa-envelope"></span>
				<h3>Email</h3>

				<%
				if (member == null) {
				%>
				<a href="#">로그인 한 사람의 이메일을 출력</a>
				
				<%
				} else {
				%>
				<a href="#"><%=member.getM_email()%></a>
				<%
				}
				%>
			</div>
			</section> <section>
			<div class="contact-method">
				<span class="icon alt fa-phone"></span>
				<h3>Phone</h3>
				<%
				if (member == null) {
				%>
				
				<span>로그인 한 사람의 전화번호를 출력</span>
				<!-- 로그인 한 사용자의 이메일을 출력하시오 -->
				<%
				} else {
				%>
				<a href="#"><%=member.getM_tel()%></a>
				<%
				}
				%>
				
				<!-- 로그인 한 사용자의 전화번호를 출력하시오 -->
			</div>
			</section> <section>
			<div class="contact-method">
				<span class="icon alt fa-home"></span>
				<h3>Address</h3>
				<%
				if (member == null) {
				%>
				
				<span>로그인 한 사람의 집주소를 출력</span>
				
				<%
				} else {
				%>
				<a href="#"><%=member.getM_address()%></a>
				<%
				}
				%>
				
			</div>
			</section> </section>
		</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon alt fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon alt fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon alt fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon alt fa-github"><span
						class="label">GitHub</span></a></li>
				<li><a href="#" class="icon alt fa-linkedin"><span
						class="label">LinkedIn</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled</li>
				<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

</body>
</html>

