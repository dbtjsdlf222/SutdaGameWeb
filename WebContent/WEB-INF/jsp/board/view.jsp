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
    <h3>댓글</h3>
    <div>
	    <textarea class="commentBox" placeholder="댓글 입력">
	    
	    </textarea>
	    <button id="writeComment" onclick="writeComment()">
	    	댓글 치기
	    </button>
    </div>
    <div class="commentList">
    	<c:choose>
    		<c:when test="${comment ne null}">
		    <table>
				<c:forEach var="comment" items="${comment}" varStatus="status">
					<tr>
						<td>작성일:</td><td>${comment.regdate}</td>
					</tr>
					<tr>
						<td><c:out value="${comment.player.nickname}" /></td>
						<td><c:out value="${comment.content}" /></td>
					</tr>
					<tr>
						<td><input placeholder="답글 달기" class="reCommnet" /><button id="reCommentBtn" onclick="writeReComment(this)" data-no='<c:out value="${comment.no}"/>'>답글 치기</button></td>
					</tr>
					<tr>
						<td><button onclick="selectRecomment(this)" data-no="<c:out value='${comment.no }' />" data-p="1">답글이 <c:out value="${comment.replyCount}" />개 있습니다.</button></td>
					<tr>
				</c:forEach>
				<tr><td><button onclick="selectComment(this)" data-p="1" data-no="${post.no}">댓글 더 보기</button></td></tr>
			</table>
	    		</c:when>
    		<c:otherwise>
    			<h3>댓글이 없습니다.</h3>
    		</c:otherwise>
    	</c:choose>
    </div>
    
    <footer>
        <p></p>
        <p>서울특별시 구로구 디지털로 306 2층(구로동 182-13, 대륭포스트타워2차)<br/>
        전화번호: 010-5716-0288 / E-mail: asino0226@gmail.com<br/>
        Copyrightⓒ2020SUTDA.All rights reserved.</p>
    </footer>
<script>
	//답글 더보기
	function selectRecomment(e){
		
		$.ajax({
	  		url:'/ajax/selectRecomment',
	  		type: 'POST',
		      data: {  no:$(e).data("no"), p:$(e).data("p") },
		      success: function(data) {
			      $(e).data("p",$(e).data("p")+1);
			     for(var i=0; i<data.length;i++){
				     $(e).parent().parent().prepend(
						     "<tr><td>작성일:</td><td>"+data[i].regdate+"</td></tr>"+
							"<tr><td>"+data[i].player.nickname + "</td><td>"+data[i].content+"</td></tr>");
			     }
		      },
		      error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
	      }
		});
	}
	//댓글 더보기
	function selectComment(e){
		$.ajax({
	  		url:'/ajax/selectComment',
	  		type: 'POST',
		      data: {  no:$(e).data("no"), p:$(e).data("p") },
		      success: function(data) {
		    	  $(e).data("p",$(e).data("p")+1);
			     for(var i=0; data.length;i++){
				     $(e).parent().parent().prepend(
						     "<tr><td>작성일:</td><td>"+data[i].regdate+"</td></tr>"+
							"<tr><td>"+data[i].player.nickname + "</td><td>"+data[i].content+"</td></tr>");
			     }
		      },
		      error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
	      }
		});
	}

	//댓글 입력
	function writeComment() {
		$.ajax({
	  		url:'/ajax/commentInsert',
	  		type: 'POST',
		      data: {  content:$(".commentBox").val(), boardNo:${post.no } },
		      success: function() {
			      alert("댓글 입력 성공");
		      },
		      error: function(statusText) {
		    	  console.log(statusText);
			  }
		});
	}

	//답글 입력
	function writeReComment(e) {
		$.ajax({
	  		url:'/ajax/commentReInsert',
	  		type: 'POST',
		      data: {  content:$(e).parent().children(".reCommnet").val(), no:$(e).data("no") },
		      success: function() {
			      alert("댓글 입력 성공");
		      },
	    	  error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
			}
		});
	}
	//답글 삭제
	function deleteComment(e) {
		$.ajax({
	  		url:'/ajax/commentDelete',
	  		type: 'POST',
		      data: {  content:$(e).parent().children(".reCommnet").val(), no:$(e).data("no") },
		      success: function() {
			      alert("댓글 입력 성공");
		      },
	    	  error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
			}
		});
	}
	
	//답글 수정
	function updateComment(e) {
		$.ajax({
	  		url:'/ajax/commentUpdate',
	  		type: 'POST',
		      data: {  content:$(e).parent().children(".reCommnet").val(), no:$(e).data("no") },
		      success: function() {
			      alert("댓글 입력 성공");
		      },
	    	  error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
			}
		});
	}

	//좋아요
    var likeCheck = ${likeCheck};
	function likeBoard() {
		likeCheck = !likeCheck;

		$.ajax({
	  		url:'/ajax/likeBoard',
	  		type: 'POST',
		      data: {  no:${post.no} },
		      success: function(data) {
		    	  $('#likeCount').text(data);
					var src = "/img/";
		    	  if(likeCheck){
		    		  src+="likeBtn2.png";
			   	  } else {
			   		src+="likeBtn1.png";
				 }
			     $('#like').attr("src",src)
		      },
	    	  error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
			}
		});
	}
	</script>
</body>
</html>