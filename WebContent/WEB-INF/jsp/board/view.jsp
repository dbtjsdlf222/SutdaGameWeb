<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>게시물 작성</title>
</head>
<style>
.container{
	margin: auto;
}
#write{
    margin: auto;
    padding-left: 50px;
    padding-top: 20px;
    text-align: center;
}
#title{
	margin-top: 100px;
    width: 1100px;
    height: 30px;
}
#contents{
	margin-top: 20px;
    width: 1100px;
    height: 500px;
}
#revise{
	margin-top: 20px;
	margin-left: 20px;
	width: 150px;
	height: 40px;
	border: 1px solid #DB3A00;
	border-radius: 30%;
	color: #DB3A00;
	background-color: #363636;
	float: right;
}
#back{
	margin-top: 20px;
	width: 150px;
	height: 40px;
	border: 1px solid #DB3A00;
	border-radius: 30%;
	color: #DB3A00;
	background-color: #363636;
}
#deleteBoard{
	margin-top: 20px;
	width: 150px;
	height: 40px;
	border: 1px solid #DB3A00;
	border-radius: 30%;
	color: #DB3A00;
	background-color: #363636;
	float: right;
}

h3{
	border-bottom: 1px solid #DB3A00;
	color: #DB3A00;
}
.commentList{
	width: 1250px;	
	margin: auto;
	margin-top: 50px;
}
.likeBtn1{
	margin: auto;
	cursor: pointer;
}
.likeBtn2{
	visibility: hidden;
	opacity: 0;
	transition: visibility 0s, opacity 0.5s ease-out;
	margin: 50px;
}
.likeBtn1:hover .likeBtn2{
	visibility: visible;
	opacity: 1;
}
footer{
	margin-top: 100px;
    width: 100%;
    height: 70px;
    display: block;
    border-top: 1px solid #DB3A00;
}
footer p{
    text-align: center;
    color: #CACACA;
}
commentBox{
	resize: none;
}
#writeComment{
	width:150px;
	height:150px;
}
</style>
<body>
<jsp:include page="../mainpage/header.jsp" flush="false" />
    <div class="container">
	    <div id="write">
        	<h1>${post.title}</h1>	
        	<div>${post.content }</div>
        	<button id="back" onclick="location.href='boardList'"> 뒤로가기</button>
        	<c:if test="${post.writerNo eq loginInfo.no}">
         	<button id="deleteBoard" onclick="location.href='/board/delete?no=${post.no}'">게시글 삭제하기</button>
         	<button id="updateBoard" onclick="location.href='/board/update_form?no=${post.no}'">게시글 수정하기</button>
	       	
	       	</c:if>
	       	${likeCheck}
	       	${likeCheck}
	       	${likeCheck}
	       	
      			<div id="good_box">
			<c:choose>
				<c:when test="${likeCheck eq 1}">
					<button onclick="likeBoard()"><img id="like" src="/img/likeBtn2.png"/></button>
				</c:when>
				<c:otherwise>
					<button onclick="likeBoard()"><img id="like" src="/img/likeBtn1.png"/></button>
				</c:otherwise>
			</c:choose>
			<span id="likeCount" style="display: block">${like}</span>
			</div>
		</div>        	
    </div>
<jsp:include page="comment.jsp" flush="false"/>
<footer>
<p></p>
	<p>서울특별시 구로구 디지털로 306 2층(구로동 182-13, 대륭포스트타워2차)<br/>
	전화번호: 010-5716-0288 / E-mail: asino0226@gmail.com<br/>
	Copyrightⓒ2020SUTDA.All rights reserved.</p>
</footer>
</body>
</html>