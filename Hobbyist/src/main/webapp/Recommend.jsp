<%@page import="com.message.model.MarkerDAO"%>
<%@page import="com.message.model.MarkerDTO"%>
<%@page import="com.message.model.AddrDTO"%>
<%@page import="com.message.model.ReviewDTO"%>
<%@page import="com.message.model.WishlistDAO"%>
<%@page import="com.message.model.WishlistDTO"%>
<%@page import="com.message.model.RecommendDAO"%>
<%@page import="com.message.model.MessageDTO"%>
<%@page import="com.message.model.MessageDAO"%>
<%@page import="com.message.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.message.model.AcademyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<% ArrayList<MarkerDTO> locmarker = new ArrayList<MarkerDTO>();
MarkerDAO dao = new MarkerDAO();
locmarker = dao.marSelect(); %>
<%
   request.setCharacterEncoding("utf-8");
   ArrayList <AddrDTO> recommend = (ArrayList<AddrDTO>) session.getAttribute("recommend");
   MemberDTO member = (MemberDTO) session.getAttribute("member");
   int pageSize = 8; // 한 페이지에 출력할 레코드 수

   // 페이지 링크를 클릭한 번호 / 현재 페이지
   String pageNum = request.getParameter("pageNum");
   if (pageNum == null){ // 클릭한게 없으면 1번 페이지
      pageNum = "1";
   }
   session.removeAttribute("pageNum");
   session.setAttribute("pageNum", pageNum);
   
   // 연산을 하기 위한 pageNum 형변환 / 현재 페이지
   int currentPage = Integer.parseInt(pageNum);

   // 해당 페이지에서 시작할 레코드 / 마지막 레코드
   int startRow = (currentPage - 1) * pageSize;
   
   int count = 0;
   
   ArrayList <ReviewDTO> Review = (ArrayList <ReviewDTO>) session.getAttribute("Review");
   ArrayList <WishlistDTO> wishCheck = (ArrayList <WishlistDTO>) session.getAttribute("wish");
   if(wishCheck == null){
      System.out.println(wishCheck+"jsp 위시 세션 받아오기 실패");
   }else{
      System.out.println(wishCheck+"jsp 위시 세션 받아오기 성공");
   }
   ArrayList <Double> scoreAvg = (ArrayList <Double>) session.getAttribute("avgScore");
   if(recommend != null){
         count = (Integer) session.getAttribute("count");
   }
   
   
   
   int endRow = currentPage * pageSize;
   if(currentPage > count / pageSize ){
      endRow = (currentPage -1) * pageSize + (count % pageSize);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hobbyist</title>
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
   href="https://fonts.googleapis.com/
    icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
   rel="stylesheet" />
<link
   href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css"
   rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

   #category_wrapper_wrapper{
      margin : 0 auto;
      padding : 0px auto;
      width : 1300px;
      height : 65px;
      box-sizing:border-box;
      margin-top : 20px;
      border : 2px solid #f45c5c;
      border-radius: 5px 5px 5px 5px;
      padding-top : 10px;
      padding-left : 10px;
   }
   .category_wraper{
      position : relative;
      float : left;
      height : 50px;
}
   .category_wraper > span{
      font-family: "SUIT-Medium";
      color : #f45c5c;
      font-weight : bold;
      float : left;
      margin : 10px;
      height : 100px;
      
}
   .category_wraper > input.category{
      box-sizing : border-box;
      width : 250px;
      height : 40px;
      font-family: "SUIT-Medium";
      color : #f45c5c;
      font-weight : bold;
      margin-left : 50px ;
   }
   .category_wraper > button{
      box-sizing : border-box;
      font-family: "SUIT-Medium";
      width : 100%;
      height : 80%;
      margin-left : 20px;
      background-color : #f45c5c;
      opacity: 0.9;
   }
   .category_wraper > button > span{
      font-size : 20px;
      color : #fff;
   }
   #recWrapper{
      margin : 0 auto;
      padding : 0 ;
      width : 1300px;
      height : 750px;
      box-sizing:border-box;
      margin-top : 20px;
      border : 2px solid #f45c5c;
      border-radius: 5px 5px 5px 5px;
   }
   #recMap{
      margin : 0 auto;
      padding : 0 auto;
      width : 50%;
      height : 745px;
      box-sizing:border-box;
      float : right;
   }
   #rec{
      margin : 0 auto;
      padding : 0 auto;
      width : 50%;
      height : 747px;
      box-sizing:border-box;
      float : left;
      border-right : 2px solid #f45c5c;
   }
   #rec > .recView {
      margin : 0 auto;
      padding : 0 auto;
      box-sizing:border-box;
      position : relative;
   }
   #rec > .recView td{
      margin : 0 auto;
      padding : 1px;
      box-sizing:border-box;
   }
   #rec > .recView #pagebox{
      margin : 0 auto;
      position : relative;
      bottom : 0;
   }
   #rec > .recView #pagebox td{
      margin : 0 auto;
      text-align : center;
   }
   .recInfo{
      float : left;
      width : 319.5px;
      height : 85px;
      overflow: hidden;
      font-size: 14.5px;
   }
   .recInfo a{
      margin-right :10px;
      
   }
   .recReviewWish{
      box-sizing : border-box;
      float : right;
      margin : 0 auto;
      padding : 1px;
   }
   .star{
      width : 20px;
      margin-top : 2px;
      margin-right : 2px;
   }
   .acaImg{
      position : relative;
      width : 25%;
      box-sizing : border-box;
      overflow : hidden;
      float : left;
      margin-right : 10px;
   }
   .acaImg > img{
      width : 100%;
      height : 80px;
      float : left;
      opacity: 0.8;
   }
   .acaImg2{
      position : relative;
      width : 100%;
      box-sizing : border-box;
      overflow : hidden;
      margin-right : 10px;
      height : 30%;
   }
   .acaImg2 > img{
      width : 100%;
      height : 100%;
      opacity: 0.8;
   }
   .acaImg2 > .imgMemo{
      font-family: "SUIT-Medium";
      color : #fff;
      font-weight : bold;
      position: absolute;
      top : 50%;
      left : 50%;
      transform: translate(-50%,-50%);
      margin : 0 auto;
      font-size : 20px;
      width : 70%;
   }
   .acaImg > .imgMemo{
      font-family: "SUIT-Medium";
      color : #fff;
      font-weight : bold;
      position: absolute;
      top : 50%;
      left : 50%;
      transform: translate(-50%,-50%);
      margin : 0 auto;
      font-size : 20px;
      width : 70%;
   }
      .wishInput{
         width: 30px;
         height : 30px;
          float : right;
      }
      .wishInput > form > .h0{
            box-sizing: content-box;
            width: 30px;
            margin: 0 auto;
            padding: 0;
            border: 0;
            box-shadow : none;
            background-color:transparent;
        }
      .h1{
            box-sizing: content-box;
            width: 30px;
            margin: 0 auto;
            padding: 0;
            border: 0;
            box-shadow : none;
            background-color:transparent;
        }
        .wishInput .heart{
            width: 30px;
            margin: 0 auto;
            padding: 0 auto;
        }
        .reviewButton {
           font-family: 'Noto Sans KR', sans-serif;
           box-shadow : none;
            background-color:transparent;
            margin : 0 auto; 
            padding : 0 auto;
            font-color : #666;
        }
        .popUp{
           width : 652px;
           height : 749px;
           position : fixed;
           bottom : 12.5%;
           left : 26.5%;
           z-index : 10;
           background:transparent;
           border-radius: 15%;
           display : none;
        }
        .popUp > article{
           width : 652px;
           height : 751px;
           position : relative;
           z-index : 20;
           background-color : #fff;
            margin : auto;
        }
       .popDown {
          background:transparent;
          box-shadow : none;
          font-family: 'Noto Sans KR', sans-serif;
          float : right;
          display : block;
          margin : 0;
       }
      #popDark{
         position : absolute;
         width : 100%;
         height : 121%;
         background-color : #000;
         opacity : 0.5;
         z-index : 5;
         display : none;
      }
      .revUser{
         margin-right : 15px;
         display : inline-block;
         float : left;
      }
      .revDate{
       position : relative;
         display : inline-block;
         float : right;
      }
      .revContent{
         position : absolute;
         top:30px;
         display : inline;
         height : 30px;
      }   
      .revWrite{
         display : none;
         position : absolute;
         top : 48%;
      }
      .revSub{
         background-color : #fff;
         float : right;
      }
      .revWriteClose{
        background-color : #fff;
         float : left;
      }
      .revWriteButton {
         float : right;
         box-shadow : none;
        background-color:transparent;
        margin : 0 auto;
        padding : 0 auto;
      }
      .revDel{
         width : 100px;
         height : 30px;
         display : inline;
         position : absolute;
         right :0%;
         top : 35%;
         box-shadow : none;
        background-color:transparent;
        margin : 0 ;
        padding : 0;
      }
      div > .revPass{
         margin-left : 10px;
         display : inline;
         width : 120px;
         height : 25px;
      }
     .revinfo{
      position: relative;      
      }
      .form{
         margin : 0;
      }
      .wrap {position: absolute;left: 0;bottom: 40px;width: 400px;height: 120px;margin-left: -144px;text-align: left;overflow: hidden;font-size: px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;background-color: white;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 400px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;background-color: #f1f2f6;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #c44569;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;color:white;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<script type="text/javascript">
<%   
if(recommend != null){

   for(int i = startRow; i < endRow; i++){
%>   
   $(document).ready(function(){
      $("#reviewButton<%=i%>").click(function(){
         $("#popUp<%=i%>").fadeIn();
         $("#popDark").fadeIn();
         var offset = $('#recWrapper').offset(); 
         $('html').animate({scrollTop : offset.top}, 400);
      });
      $("#popDown<%=i%>").click(function(){
         $("#popUp<%=i%>").fadeOut();
         $("#popDark").fadeOut();
      })
   })
   $(document).ready(function(){
      $(".revWriteButton").click(function(){
        $(".reviewSelect").fadeOut();
         $(".revWrite").fadeIn();
      });
      $(".revWriteClose").click(function(){
         $(".revWrite").fadeOut();
          $(".reviewSelect").fadeIn();
      })
   })
<%
   }
}
%>
</script>
</head>
<body>
   <div id = "popDark"></div>
   <div id="wrapper">
      <!-- Main -->
      <div id="main">
         <div class="inner">
            <!-- Header -->
            <header id="header">
               <a href="main.jsp" class="logo"><h1>
                     <strong>Hobbyist</strong>
                  </h1></a>
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
      
      <!-- 검색 영역 -->
      <div id = "category_wrapper_wrapper">
         <form action="RecommendSelectCon" method = "post">
         <div class = "category_wraper">
         <span>지역</span>
         <input type = "text" list = "city" class = "category" name = "city">
         <datalist id = "city">
            <option value="남구"></option>
              <option value="서구"></option>
              <option value="동구"></option>
              <option value="북구"></option>
              <option value="광산구"></option>
         </datalist>
         </div>
         <!-- 
         <div class = "category_wraper">      
         <span>대분류</span>
         <input type = "text" list = "a_L_category1" class = "category" name = "a_L_category1">
         <datalist id = "a_L_category1">
            <option value="테스트1"></option>
         </datalist>
         </div>
          -->
         <div class = "category_wraper">
         <span>카테고리</span>
         <input type = "text" list = "a_m_category1" class = "category" name = "a_m_category1">
         <datalist id = "a_m_category1">
            <option value="크로스핏"></option>
            <option value="클라이밍"></option>
            <option value="요가"></option>
            <option value="수영"></option>
            <option value="요리"></option>
            <option value="베이킹"></option>
            <option value="바리스타"></option>
            <option value="필라테스"></option>
            <option value="무에타이"></option>
            <option value="킥복싱"></option>
            <option value="주짓수"></option>
            <option value="음악"></option>
            <option value="댄스"></option>
            <option value="폴댄스"></option>
            <option value="무용"></option>
            <option value="발레"></option>
            <option value="공예&화훼"></option>
         </datalist>
         </div>
         <div class = "category_wraper">
            <button type = "submit"><span id="recSearch">검색</span></button>
         </div>
         </form>
      </div>
         
         
         <!-- 지도 영역 -->
         <div id = "recWrapper">
            <div id = "rec">
               <div class = "recView">
               <table>
               <%   
                  if(recommend != null){
                  
                     for(int i = startRow; i < endRow; i++){
               %>   
                  <tr>
                     <td>
                     <div class = "popUp" id ="popUp<%=i%>">
                        <article>
                           <button type="button" class = "popDown" id = "popDown<%=i%>">[닫기]</button>
                           <div class = "acaImg2">
                            <%
                           if(recommend.get(i).getAc_img() != null){
                        %>
                           <img alt="학원이미지" src="<%= recommend.get(i).getAc_img() %>">
                        <%
                           }else{
                        %>
                           <img alt="이미지 준비중" src="./images/defaultImg.jpg">
                           <%
                           }
                           %>
                        </div>
                        <div class = "recInfo">
                           <strong>상호명 : </strong> <%= recommend.get(i).getAc_name() %> <br>
                           <strong>주소 : </strong> <%= recommend.get(i).getAc_addr() %><br>
                           <strong>관련정보 : </strong> <a href ="<%= recommend.get(i).getAc_rel() %>" target="_blank" >홈페이지 바로가기</a> <a href ="<%= recommend.get(i).getAc_rev()%>" target="_blank"> 블로그리뷰 </a><br>
                        </div>
                        <div class = "recReviewWish">
                           <img alt="star" src="./images/star.png" class = "star">
                           <strong>
                           <%
                           if(scoreAvg != null){
                              if(scoreAvg.get(i) == null){
                                 %>
                                 <%= 0 %>
                                 <%
                              }else{
                                 
                           %>
                           
                           <%= scoreAvg.get(i) %>
                           <%
                              }
                           }
                           %>
                           <br>
                            </strong>
                        </div>
                        <div class = "wishInput">
                           
                              <%if(wishCheck !=null){
                                 if(wishCheck.get(i) != null){
                                    if(wishCheck.get(i).getW_wish()>0){
                              %>
                              <form action="WishlistRecoDelCon" method="post">
                              <button type="submit" class="h1" name ="wishDelete" value = "<%= 
                                   recommend.get(i).getAc_id()
                                %>"><img src="./images/heart1.png" alt="heart1" class="heart"></button>
                                <% }}else{ %>
                              </form>
                                 <form action="WishListInputCon" method="post">
                                   <button type="submit" class="h0" name="a_idToWish" value="<%= 
                                      recommend.get(i).getAc_id()
                                   %>">
                                   <img src="./images/heart0.png" alt="heart0" class="heart"></button>
                                </form>
                                <% 
                                 } }
                                %>
                        </div>
                        <button type ="button" class = "revWriteButton">리뷰작성</button>
                           <table class = "reviewSelect">
                        <%
                        
                        if (Review != null){
                           int cnt = 0;
                           for (int j = 0; j < Review.size(); j++)   {
                              if(recommend.get(i).getAc_id().equals(Review.get(j).getRe_id()) && cnt <6){
                                 %>
                                    <tr> 
                                       <td class = "revinfo">
                                           <form action="ReviewDeleteCon" method="post" class ="form">
                                          <div class="revDate">
                                          <%
                                          if(Review.get(j).getRe_date() !=null){
                                             %>
                                                <%=Review.get(j).getRe_date()%>
                                             <%
                                          }
                                          %>
                                          <button type = "submit" class = "revDel" name = "rev_id"value="<%= recommend.get(i).getAc_id() %>">삭제</button>
                                          </div>
                                          <div class = "revUser">
                                          <%=Review.get(j).getRe_nick() %>
                                          </div>
                                          <div>
                                          평점 : <%=Review.get(j).getRe_score()%>
                                          <input type = "password" class = "revPass" name ="revPass" placeholder="비밀번호">
                                          <input type = "hidden" name ="rev_nick" value ="<%= Review.get(j).getRe_nick() %>">
                                          </div>
                                          <br>
                                          <div class ="revContent">
                                          <%=Review.get(j).getRe_content() %>
                                          </div>
                                          </form>
                                       </td>
                                    </tr>          
                                                           
                                 <%
                                 cnt++;
                              }
                              }
                           }else{
                               %>
                                    <tr>
                                          <td> 리뷰가 없습니다. <br> 첫 리뷰를 작성해보세요!</td>
                                    </tr>
                                       <%
                           }
                                %>
                                 <tr>
                                    <td align = "center">[1]</td>
                                 </tr>
                           </table>
                           <form action="ReviewWriteCon" method="post">
                  <table border="1" class = revWrite>
                     <tr>
                        <td> 점수</td>
                        <td>
                           <select name="score">
                               <option value="1">1</option>
                               <option value="2">2</option>
                               <option value="3">3</option>
                               <option value="4">4</option>
                               <option value="5" selected="selected">5</option>
                           </select>
                           <input type = "hidden" value = "<%= recommend.get(i).getAc_id() %>" name = "re_id">
                           <input type = "hidden" value = "<%= recommend.get(i).getAc_name() %>" name = "classname">
                        </td>
                        
                     </tr>
                     <tr>
                        <td>닉네임</td>
                        <td><input type="text" name="nick" class="nick"></td>
                        <td>비밀번호</td>
                        <td><input type="password" name="passwd" class="passwd"></td>
                     </tr>
                     <tr>
                        <td colspan="4"><textarea rows="7" cols="60"
                              name="content" class="content" placeholder ="여기에 리뷰를 입력해주세요."></textarea></td>
                     </tr>
                     <tr align="center">
                        <td colspan="2"><input type="submit" value="작성" class = "revSub"></td>
                        <td colspan="2"><input type= "button" value="닫기" class = "revWriteClose"></td>
                     </tr>
                  </table>
                  </form>
                        </article>
                     </div>
                        <div class = "acaImg">
                        <%
                           if(recommend.get(i).getAc_img() != null){
                        %>
                           <img alt="학원이미지" src="<%= recommend.get(i).getAc_img() %>">
                        <%
                           }else{
                        %>
                           <img alt="이미지 준비중" src="./images/defaultImg.jpg">
                           <p class = "imgMemo">이미지 준비중</p>
                           <%
                           }
                           %>
                        </div>
                        <div class = "recInfo">
                           <strong> <%= recommend.get(i).getAc_name() %></strong> <br>
                           <%= recommend.get(i).getAc_addr() %><br>
                            <a href ="<%= recommend.get(i).getAc_rel() %>" target="_blank" >홈페이지 바로가기</a><br>
                        </div>
                       <div class = "wishInput">
                           
                              <%if(wishCheck !=null){
                                 if(wishCheck.get(i) != null){
                                    if(wishCheck.get(i).getW_wish()>0){
                              %>
                              <form action="WishlistRecoDelCon" method="post">
                              <button type="submit" class="h1" name ="wishDelete" value = "<%= recommend.get(i).getAc_id() %>"><img src="./images/heart1.png" alt="heart1" class="heart"></button>
                                <% }}else{ %>
                              </form>
                                 <form action="WishListInputCon" method="post">
                                   <button type="submit" class="h0" name="a_idToWish" value="<%= recommend.get(i).getAc_id() %>">
                                   <img src="./images/heart0.png" alt="heart0" class="heart"></button>
                                </form>
                                <% 
                                 } }else{
                                    %>
                                    <form action="WishListInputCon" method="post">
                                    <button type="submit" class="h0" name="a_idToWish" value="<%= recommend.get(i).getAc_id() %>">
                                    <img src="./images/heart0.png" alt="heart0" class="heart"></button>
                                 </form>
                                 <%
                                 }
                                 %>
                        </div>
                        <div class = "recReviewWish">
                           <img alt="star" src="./images/star.png" class = "star">
                           <strong> 평점 : 
                           <%
                           if(scoreAvg != null){
                              if(scoreAvg.get(i) == null){
                                 %>
                                 <%= 0 %> 점
                                 <%
                              }else{
                           %>
                           
                           <%= scoreAvg.get(i) %> 점
                           <%
                              }
                           }
                           %>
                           <br>
                            </strong>
                           <button type="button" class = "reviewButton" id = "reviewButton<%=i %>">
                           [ 리뷰 ]
                           </button>
                        </div>
                     </td>
                  </tr>
                  
               <%            
                     }
               %>      
                  <tr id = "pagebox">
                     <td>
               <%
                     if(count > 0){
                        // 총 페이지의 수
                        int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
                        // 한 페이지에 보여줄 페이지 블럭(링크) 수
                        int pageBlock = 10;
                        // 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
                        int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
                        int endPage = startPage + pageBlock - 1;
                        
                        // 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
                        if(endPage > pageCount){
                           endPage = pageCount;
                        }
                        
                        if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
                  %>
                           <a href="Recommend.jsp?pageNum=<%=startPage - 10%>">[이전]</a>   
                  <%         
                        }
                     for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
                        if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
               %>
                           [<%=i %>]
               <%                           
                        }else{ // 현재 페이지가 아닌 경우 링크 설정
               %>
                           <a href="Recommend.jsp?pageNum=<%=i%>">[<%=i %>]</a>
               <%   
                        }
                     } // for end
                     
                     if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
               %>
                        <a href="Recommend.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
               <%      
                        }
                     }
                  }
               %>
                     </td>
                  </tr>
                  </table>
               </div>
            </div>
            
            
            
            <!-- 지도 -->
            <div id = "recMap">
                  <% if(recommend != null){ for(int i = 0 ; i < recommend.size(); i++){ %>
               <input type="hidden" value="<%= recommend.get(i).getAc_name() %>,<%= recommend.get(i).getAc_wi() %>,<%= recommend.get(i).getAc_ky() %>,<%= recommend.get(i).getAc_addr() %>,<%= recommend.get(i).getAc_img() %>,<%= recommend.get(i).getAc_rev() %>,<%= recommend.get(i).getAc_rel() %>" class="locmarker">
               <% } %>
             </div>
         <div id="map">
      <script src="./assets/js/jquery.min.js">
      
      </script>
      <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29fc3997888570a1dca257593cd4be4a&libraries=clusterer"></script>
      <script>
      var markers = [];
      var overlays = [];
      
      function makeClickListener(map, marker, overlay) {
          return function() {
              overlay.setMap(map)
          };
      }
      var myLocmarker = document.querySelectorAll('.locmarker');
      
      var locArray = new Array(myLocmarker.length);
      var map; 
      var overlay;
      
      for(var i = 0; i < myLocmarker.length; i++){
         locArray[i] = new Array(7);
         var arr = myLocmarker[i].value.split(',');
         locArray[i][0] = arr[0];
         locArray[i][1] = arr[1];
         locArray[i][2] = arr[2];
         locArray[i][3] = arr[3];
         locArray[i][4] = arr[4];
         locArray[i][5] = arr[5];
         locArray[i][6] = arr[6];
         
      }

      <%-- // 지도를 생성한다--%> 
      
   
      //window.onload = function(){
            var mapContainer = document.getElementById("recMap"), // 지도를 표시할 div 
             mapOption = {
                 center: new kakao.maps.LatLng(locArray[0][1], locArray[0][2]), // 지도의 중심좌표
                 level: 4, // 지도의 확대 레벨
                 mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
             }; 
            map = new kakao.maps.Map(mapContainer, mapOption);
           
            
            //클러스터러 추가
             var clusterer = new kakao.maps.MarkerClusterer({
                    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
                    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
                    minLevel: 3 // 클러스터 할 최소 지도 레벨 
                }); 
   
            
            for(var i =0; i<locArray.length; i++){
               // 지도에 마커를 생성하고 표시한다
               var marker = new kakao.maps.Marker({
                  position: new kakao.maps.LatLng(locArray[i][1], locArray[i][2]),
                  map: map // 마커를 표시할 지도 객체
               });
               
               
               var content = '<div class="wrap">' + 
                  '    <div class="info">' + 
                  '        <div class="title">' + 
                              locArray[i][0] + 
                  '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>' + 
                  '        </div>' + 
                  '        <div class="body">' + 
                  '            <div class="img">' +
                  '                <img src="'+locArray[i][4]+'" width="73" height="70" alt = "NO IMAGE">' +
                  '           </div>' + 
                  '            <div class="desc">' + 
                  '                <div class="ellipsis">'+locArray[i][3]+'</div>' + 
                  '                <div><a href="'+locArray[i][6]+'" target="_blank" class="link">홈페이지</a></div>' + 
                  '                <div><a href="'+locArray[i][5]+'" target="_blank" class="link">리뷰</a></div>' +
                  '            </div>' + 
                  '        </div>' + 
                  '    </div>' +    
                  '</div>';

               // 마커 위에 커스텀오버레이를 표시합니다
               // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
               overlay = new kakao.maps.CustomOverlay({
                   content: content,
                   map: null,
                   position: marker.getPosition()   
               });
               
               
               kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, overlay));
               // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
               /*kakao.maps.event.addListener(marker, 'click', function() {
                  overlay.setMap(map);
               });*/
         
               // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
               markers.push(marker);
               overlays.push(overlay);   
               }
      //}
            
      function closeOverlay(i) {
          overlays[i].setMap(null);   
          //overlay.setMap(null);
          /*$(".wrap").on("click",function(){
             $(this).hide();
          })*/
      }
      <%}%>
      </script>
              </div>
            </div>
            
            <!-- 지도 out div -->
         </div>
         
      <!-- inner out div -->    
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
                  <li><a href="towninput.jsp">우리동네에서찾기</a></li>
                  <li><a href="Recommend.jsp">카테고리별 검색</a></li>
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
                  &copy; Untitled. All rights reserved. Demo Images: <a
                     href="https://unsplash.com">Unsplash</a>. Design: <a
                     href="https://html5up.net">HTML5 UP</a>.
               </p>
            </footer>
         </div>
      </div>
   </div>
   </div>
      
</body>
</html>