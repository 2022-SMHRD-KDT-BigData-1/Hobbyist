<%@page import="com.message.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% MemberDTO member = (MemberDTO) session.getAttribute("member"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		
		<link rel="stylesheet" href="assets/css/main.css" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <title>UPDATE</title>
		
	</head>
	<style>
	.btn > button{	
		box-sizing : border-box;
		font-family: "SUIT-Medium";
		width : 10em;
		height : 80%;
		margin-left : 20px;
		background-color : #f45c5c;
		opacity: 0.9;
	}
	button > span{
		font-size : 20px;
		color : #fff;
	}
	
	</style>
	<body style="text-align: center;">

		 <form action="UpdateCon.do" method="get">
      <fieldset>
        <legend align="center"><h3>Hobbyist Update</h3></legend>
        <table align="center">
          <tr>
            <td align="center">
              <strong>접속한 이메일</strong>
            </td>
            <td>
              ${member.m_email }
            </td>
          </tr>
          <tr>
            <td align="center">
              <strong>비밀번호</strong>
            </td>
            <td>
              <input type="password" name="pw" placeholder="비밀번호 입력" />
            </td>
          </tr>
          <tr>
            <td align="center">
              <strong>이름</strong>
            </td>
            <td>
              <input type="text" name="name" placeholder="ex) 김지은" />
            </td>
          </tr>
          <tr>
            <td align="center">
              <strong>닉네임</strong>
            </td>
            <td>
              <input type="text" name="nick" placeholder="ex) 바보" />
            </td>
          </tr>
          <tr>
            <td align="center">
              <strong>주소</strong>
            </td>
            <td>
              <input type="text" name="address" placeholder="ex) 동구" />
            </td>
          </tr>
          <tr>
            <td align="center">
              <strong>나이</strong>
            </td>
            <td>
              <input type="text" name="age" placeholder="25" />
            </td>
          </tr>
          <tr>
            <td align="center">
              <strong>성별</strong>
            </td>
            <td align="left">
              <input type="radio" id="man" name="gender" value="남자" />
              <label for="man">남자</label>
              <input type="radio" id="woman" name="gender" value="여자" />
              <label for="woman">여자</label>
            </td>
          </tr>
          <tr>
            <td align="center">
              <strong>학원코드</strong>
            </td>
            <td>
              <input
                type="text"
                name="a_id"
                placeholder="다니고 있는 학원코드"
              />
            </td>
          </tr>
        </table>
        <div class="btn">
        	<button type = "submit"><span id="update">UPDATE</span></button>
        </div>
      </fieldset>
    </form>
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

