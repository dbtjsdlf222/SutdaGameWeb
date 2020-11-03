<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>게시물 보기</title>
</head>
<style>
.container{
	margin: auto;
	overflow: hidden;
	color:#fff;
}
#contentBox{
	text-align: center;
	margin-top: 20px;
	min-height: 300px;
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
#good_box{
	text-align: center;
}
</style>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
<jsp:include page="../include/righter.jsp" flush="false" />
    <div class="container">
        	<h1>${post.title}</h1>
        	<c:choose>
        	<c:when test="${post.kindNo==10}">	<%-- 유튜브 게시판일 경우 --%>
        	<div id="contentBox">
        	<iframe width="900" height="500" src="https://www.youtube.com/embed/${post.content }" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        	</div>
        	</c:when>
        	<c:otherwise>
        	<div id="contentBox">${post.content }</div>
        	</c:otherwise>
        	</c:choose>
        	<%-- <button id="back" onclick="goBack();"> 뒤로가기 ${loginInfo.admin}</button> --%>
        	<c:if test="${(post.writerNo eq loginInfo.no) || (loginInfo.admin == true) }">
         	<button id="deleteBoard" onclick="if(confirm('게시글을 삭제하시겠습니까?')){location.href='/board/delete?no=${post.no}'}">게시글 삭제하기</button>
         	<button id="updateBoard" onclick="location.href='/board/update_form?no=${post.no}'">게시글 수정하기</button>
	       	</c:if>
      			<div id="good_box">
			<c:choose>
				<c:when test="${likeCheck eq 1}">
					<button onclick="likeBoard()"><img id="like" width="90px" src="/img/likeBtn2.png"/></button>
				</c:when>
				<c:otherwise>
					<button onclick="likeBoard()"><img id="like" width="90px" src="/img/likeBtn1.png"/></button>
				</c:otherwise>
			</c:choose>
			<span id="likeCount" style="display: block">${like}</span>
			</div>
		</div>
<jsp:include page="comment.jsp" flush="false"/>
<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>