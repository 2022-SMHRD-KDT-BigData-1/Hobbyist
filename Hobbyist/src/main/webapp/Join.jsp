<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Join</title>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, user-scalable=no"
    />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link
      href="https://fonts.googleapis.com/
    icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
      rel="stylesheet"
    />
    <style>
      table {
        width: 800px;
        display: table;
        margin-left: auto;
        margin-right: auto;
      }
      body {
        background-color: whitesmoke;
      }
    </style>
  </head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<header id="header">
					<a href="main2.jsp" class="logo"><h1>
							<strong>Hobbyist</strong>
						</h1></a>
				</header>

				<br>
    <form action="JoinCon.do" method="post">
      <fieldset>
        <legend align="center"><h3>Hobbyist JOIN</h3></legend>
        <table align="center">
          <tr>
            <td align="center">
              <strong>이메일</strong>
            </td>
            <td>
              <input type="text" name="email" placeholder="아이디 입력" />
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
          <tr>
            <td align="center">
              <strong>전화번호</strong>
            </td>
            <td>
              <input type="text" name="tel" placeholder="ex) 01012345678" />
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
            <td>
              <input type="radio" id="man" name="gender" value="남자" />
              <label for="man">남자</label>
              <input type="radio" id="woman" name="gender" value="여자" />
              <label for="woman">여자</label>
            </td>
          </tr>
          <tr>
            <td colspan="2" align="center">
              <input type="submit" value="JOIN" />
            </td>
          </tr>
        </table>
      </fieldset>
    </form>
    
    </div>
    </div>
    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
</html>
