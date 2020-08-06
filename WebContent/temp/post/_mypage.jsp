<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script defer
   src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>DatePlanner</title>
<style>
body {
   background-repeat: no-repeat;
   background-image: url("/temp/user-background/sunset-3102754_1920.jpg");
}

.first {
   min-width: 1200px;
}

#profile_H {
   /*border: 2px solid black;*/
   padding-left: 69px;
   position: relative;
   width: 100%;
   height: 100%;
}

#profile {
   width: 300px;
   height: 30%;
   display: inline-block;
   /*position: relative;*/
   /*float: left;*/
   border: 2px solid cyan;
}

#nameBox {
   display: inline-table;
   color: white;
   margin-bottom: -50px;
}

#name {
   font-weight: bold;
   font-size: xx-large;
}

#nickname {
   font-weight: bold;
   font-size: large;
}

#intro {
   font-weight: bold;
}

#region {
   font-weight: bold;
}

ul {
   list-style: none;
   padding: 0;
   margin: 0;
}

.myContent {
   text-align: center;
   padding-top: 20px;
   margin-left: 5%;
   position: relative;
   width: 100%;
}

.content_L {
   float: left;
   overflow: hidden;
   transition: .1s ease;
   /*padding: 20px;*/
   margin: 10px;
   position: relative;
   width: 240px;
   height: 240px;
}

.info_box {
   color: antiquewhite;
   width: 240px;
   height: 240px;
   position: absolute;
   transition: .1s ease;
   bottom: -240px;
}

.content_L:hover {
   box-shadow: 0 16px 28px 0 rgba(0, 0, 0, 0.22), 0 25px 55px 0
      rgba(0, 0, 0, 0.21);
}

.content_L:hover .info_box {
   bottom: -70px;
   transition: .1s ease;
}

.content_L:hover:before {
   content: "";
   display: block;
   width: 240px;
   height: 240px;
   top: 0;
   left: 0;
   position: absolute;
   background-color: rgba(0, 0, 0, .7);
}

.heart {
   color: indianred;
   padding-right: 3px;
   font-size: 1.3em;
}

.comment {
   color: cadetblue;
   padding-right: 3px;
   font-size: 1.3em;
}
</style>
</head>
<body>

   <nav class="navbar navbar-inverse">
      <div class="container">
         <div class="navbar-header">
            <a class="navbar-brand" href="#">DatePlanner</a>
         </div>
         <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span>
                  회원가입</a></li>

            <li class="dropdown"><a class="dropdown-toggle"
               data-toggle="dropdown" href="#"> 로그인 <span
                  class="glyphicon glyphicon-log-in"></span></a>

               <ul class="dropdown-menu">
                  <li><a
                     href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=tOzxSVFgBuq1ArjsmwsD&state=STATE_STRING&redirect_uri=http://localhost/main.jsp">
                        네이버 로그인</a></li>
                  <li><a href="#">페이스북 로그인</a></li>
                  <li><a href="#">구글 로그인</a></li>
               </ul></li>
         </ul>
      </div>
   </nav>

   <div class="first container">

      <div id="profile_H">

         <div id="profile">
            <img src="img/애흥이.jpg" alt="손화민" style="width: 100%; height: 100%;">
         </div>
		 
         <div id="nameBox">
            <span id="name">${loginInfo.name }</span> <span id="nickname">(${loginInfo.nickname })</span>
            <p id="intro">${loginInfo.introduction }</p>
            <p id="region">주활동지역 : ${loginInfo.regionNo }</p>
         </div>

      </div>

      <div class="myContent">
         <ul>
         <c:forEach var="post" items="${postList }">
            <li class="content_L">
            	<a href="#">

                  <div class="info_box">
                     <h3>${post.title }</h3>
                     <ul>
                        <li><i class="fas fa-heart heart"></i><span>3,600개</span></li>
                        <li><i class="fas fa-comment comment"></i><span>57,800개</span>
                        </li>
                     </ul>
                  </div> <img src="/post/img/애흥이.jpg" alt="이쁜여자"
                  style="height: 100%; width: 100%" />

            	</a>
            </li>
            </c:forEach>
         </ul>
      </div>

   </div>
   
   

</body>
</html>