<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
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
#cancel{
	margin-top: 20px;
	margin-left: 200px;
	width: 150px;
	height: 40px;
	border: 1px solid #DB3A00;
	border-radius: 30%;
	color: #DB3A00;
	background-color: #363636;
	float: right;
}
#likeBtn{
	margin: auto;
	margin-top: 20px;
	border: 1px solid #DB3A00;
	border-radius: 100%;
	width: 50px;
	height: 50px;
	text-align: center;
	align-items: center;
	color: #DB3A00;
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
</style>
<body>
<jsp:include page="../mainpage/header.jsp" flush="false" />
    <div class="container">
	    <div id="write">
	         <form action="/board/QAupdateBoard">
	        	<input type="text" name="title" id="title" placeholder="제목을 입력하세요." value="${post.title}">
	        	<textarea id="contents" name="content" placeholder="내용을 입력하세요.">${post.content }</textarea>
	        	<input type="hidden" value="${post.no }" name="no"/>
	        	<button id="back" onclick="location.href='boardList'"> 뒤로가기</button>
	        	<input type="submit" id="revise" value="수정">
	        	<button id="cancel" onclick="location.href='board/deleteBoard?no=${post.no}'">게시글 삭제하기</button>
	        </form>
		</div>        	
    </div>
    <div id="likeBtn"></div>
    
    <div class="commentList"><a href="board?no=${post.no }">${post.comment}</a></div>
    
    <footer>
        <p></p>
        <p>서울특별시 구로구 디지털로 306 2층(구로동 182-13, 대륭포스트타워2차)<br/>
        전화번호: 010-5716-0288 / E-mail: asino0226@gmail.com<br/>
        Copyrightⓒ2020QRPAY.All rights reserved.</p>
    </footer>
</body>
</html>