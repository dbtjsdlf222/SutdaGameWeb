<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <title><c:choose><c:when test="${mypage}">내</c:when><c:otherwise>${userInfo.nickname}님의 </c:otherwise></c:choose>페이지 - DatePlanner</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <style>
		body {
		   background-repeat: no-repeat;
		   background-image: url("/tem7p/user-background/sunset-3102754_1920.jpg");
		}
		
		.first {
		   min-width: 1200px;
		}
		
		#profile_H {
		   padding-left: 69px;
		   position: relative;
		   width: 100%;
		   height: 100%;
		}
		
		#profile {
		   width: 300px;
		   height: 30%;
		   display: inline-block;
		   border: 2px solid cyan;
		}
		
		#nameBox {
		   display: inline-table;
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
		
		#update{
			text-align: right;
		}
	</style>
</head>
<body>
 <jsp:include page="../include/nav.jsp" />

<div class="jumbotron">
<div class="first container">
      <div id="profile_H">
         <div id="profile">
            <img src="/user/img/${userInfo.profile}" style="width: 100%; height: 100%;">
         </div>

         <div id="nameBox">
            <span id="name">${userInfo.name }</span> <span id="nickname">(${userInfo.nickname })</span>
            <p id="intro">${userInfo.introduction }</p>
            <p id="region">주활동지역 : ${userInfo.region}</p>
         </div> <!-- id="nameBox" -->
      </div> <!-- id="profile_H -->
      
      <c:if test="${mypage}">
      <div id="update">
	      <a href="/user/updateForm"><button class="btn btn-warning">개인정보 수정</button></a>
      </div>
      </c:if>

      <div class="myContent">
     <c:choose>
        <c:when test="${empty postList}">
         <div><span>글이 없습니다.</span></div>
      </c:when>
      <c:otherwise>
         <ul class="pagination">
            <c:if test="${1 < page.start}"><li><a href="?p=${page.start - page.pageCount}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li></c:if>
            <c:forEach var="p" begin="${page.start}" end="${page.end}">
               <li><a href="?p=${p}" aria-label="Next">${p}</a></li>
            </c:forEach>
            <c:if test="${page.next}"><li><a href="?p=${page.end + 1}" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li></c:if>
         </ul>
              <ul>
            <c:forEach var="post" items="${postList}">
            <c:set var="category">
				<c:choose>
					<c:when test="${post.packageable eq null}">package</c:when>
					<c:otherwise>post</c:otherwise>
				</c:choose>
			</c:set>
       		
               <li class="content_L" <c:if test="${category eq 'package'}">style="board:3px solid pink"</c:if>>
                  <a href="../../${category}/view/${post.no}">
                     <div class="info_box">
                        <h3>${post.title}</h3>
                        <ul>
                           <c:if test="${category eq 'package'}"><li><span>-Package-</span></li></c:if><!-- 패키지 뜻-->
                           <li><i class="fas fa-heart heart"></i><span>${post.like}</span></li><!-- 조아요 개수 -->
                           <li><i class="fas fa-comment comment"></i><span>${post.comments}</span></li><!-- 댓글 개수 -->
                        </ul>
                     </div> 
                     <img src="/${category}/img/${post.image}" height="100%" width="100%">
                  </a>
               </li>
               </c:forEach>
           </ul>
         </c:otherwise>
     </c:choose>
      </div> <!-- class="myContent -->
   </div> <!-- class="first container" --> 
</div>
   
</body>
</html>