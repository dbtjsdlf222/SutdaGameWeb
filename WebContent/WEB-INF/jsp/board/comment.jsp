<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
</head>
<style>
body{
	background-color: #363636;
}
.container{
	margin: auto;
}
h3{
	border-bottom: 1px solid white;
}
textarea{
	width: 80%;
	resize: none;
	background-color: #363636;
	color: white;
}
#commentBtn{
	width: 10%;
	background-color: #363636;
	color: white;
}
.commentCon{
	background-image: url('/img/comment.png');
	background-repeat: no-repeat;
	width: 472.5px;
	margin: 20px;
	margin-bottom: 0px;
	color: white;
}
.commentCon .nickname{
	color: black;
	margin-left: 30px;
	height: 30px;
}
.commentCon .content{
	margin-left: 20px;
}
.commentCon .regdate{
	float: right;
}
.reCommentCon{
	background-image: url('/img/reComment.png');
	background-repeat: no-repeat;
	width: 472.5px;
	height: 90px;
	margin: 20px;
	margin-left: 100px;
	margin-bottom: 0px;
	color: white;
}
.reCommentCon .nickname{
	color: black;
	margin-left: 30px;
	height: 30px;
}
.reCommentCon .content{
	margin-left: 20px;
}
.reCommentCon .regdate{
	float: right;
}
table tr:nth-child(2) td{
	color: white;
}
table tr:nth-child(3) td{
	color: white;
	float: right;
}
table tr:nth-child(4) td{
	background-image: url('/img/reComment.png');
	background-repeat: no-repeat;
}
#good_box>button:focus{
	outline:none;
}
#like:hover{
	transform:scale(1.2);
}
#like:active{
	transform:scale(0.7);
}
#like{
-webkit-transition-timing-function: ease-in-out;
    transition-timing-function: ease-in-out;
	transition:0.5s;
}

#good_box>button{
	outline:none;
    border-radius: 126px;
    width: 152px;
    height: 119px;
    background-color: firebrick;
}
</style>
<body>
	<div class="container">
		<h3 style="color: white; font-family: 'Rosewood Std''">댓글</h3>
		<div class="commentList">
			<c:choose>
				<c:when test="${comment ne null}">
					<c:forEach var="comment" items="${comment}" varStatus="status">
						<div class="commentCon">
								<div class="nickname"><c:out value="${comment.player.nickname}"/></div>
								<div class="content">${comment.content}</div>
								<br><div class="regdate">${comment.regdate}</div>
								<br>
								<c:if test="${comment.replyCount ne 0}">
								<button onclick="selectRecomment(this)" 
									data-no='${comment.no}' data-p="1" data-end='${page.end}'>
									답글이 <span><c:out value="${comment.replyCount}" /></span>개 있습니다.
								</button>
								</c:if>
						</div>
								<br><input placeholder="답글" class="reComment">
									<button id="reCommentBtn" 
											onclick="writeReComment(this)"  
											data-no='<c:out value="${comment.no}"/>' >답글 입력
									</button>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h3>댓글이 없습니다.</h3>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="commentWrite">
			<textarea placeholder="댓글 입력.." id="commentBox"></textarea>
			<button id="commentBtn" onclick="writeComment()">확인</button>
		</div>
	</div>
</body>

<script>
	// 	var myno= ${loginInfo.no};
	//답글 더보기
	function selectRecomment(e){
		$.ajax({
	  		url:'/ajax/selectRecomment',
	  		type: 'POST',
		      data: {  no:$(e).data("no"), p:$(e).data("p") },
		      success: function(data) {
			     /*  
			      if(data.length < 5) {
						$(e).text("더이상 답글이 없습니다.");
						$(e).attr("disabled","true");
			      } */
			      $(e).data("p",$(e).data("p")+1);
			      for(var i=0; i<data.length;i++){
				     $(e).prev().after(
						     "<div class='reCommentCon'><div class='nickname'>"+data[i].player.nickname+"</div><div class='content'>"+data[i].content+"</div><br><div class='regdate'>"+data[i].regdate+"</div></div>");
				     /* if (data[i].no == myno){
					     "<button value="삭제"></button>"+"<button value="수정"></button>"
				     } */
			      }
			      if(data.length < 10) {
				     $(e).remove();
				  } else {
					  $(e).find("span").text($(e).find("span").text()-data.length);
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
						     "<tr><td>작성일:</td><td>"+data[i].regdate+"</td></tr>"+"<tr><td>"+data[i].player.nickname + "</td><td>"+data[i].content+"</td></tr>");
			     }
			     if(data.length < 5) {
			     	$(e).remove();
			     }
		      },
		      error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
	      	  }
		});
	}

	//댓글 입력
	function writeComment() {
		<c:choose>
		<c:when test="${loginInfo ne null}">
		$.ajax({
	  		url:'/ajax/commentInsert',
	  		type: 'POST',
		      data: {  content:$("#commentBox").val(), boardNo:${post.no } },
		      success: function() {
			      alert("댓글 입력 성공");
		      },
		      error: function(statusText) {
		    	  console.log(statusText);
			  }
		});
		</c:when>
		<c:otherwise>
			alert("로그인을 해주세요");
		</c:otherwise>
		</c:choose>
	}

	//답글 입력
	function writeReComment(e) {
		<c:choose>
		<c:when test="${loginInfo ne null}">
		if($(e).prev().val().trim()==""||$(e).data("no")=="") {
			alert("내용을 입력해주세요");
			return;
		}
		$.ajax({
	  		url:'/ajax/commentReInsert',
	  		type: 'POST',
		      data: {  content:$(e).prev().val(), no:$(e).data("no") },
		      success: function() {
			      alert("댓글 입력 성공");
		      },
	    	  error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
			}
		});
		</c:when>
		<c:otherwise>
			alert("로그인을 해주세요");
		</c:otherwise>
		</c:choose>
	}
	
	//답글 삭제
	function deleteComment(e) {
		<c:choose>
		<c:when test="${loginInfo ne null}">
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
		</c:when>
		<c:otherwise>
			alert("로그인을 해주세요");
		</c:otherwise>
		</c:choose>
	}
	
	//답글 수정
	function updateComment(e) {
		<c:choose>
		<c:when test="${loginInfo ne null}">
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
		</c:when>
		<c:otherwise>
			alert("로그인을 해주세요");
		</c:otherwise>
		</c:choose>
	}

	//좋아요
    var likeCheck = ${likeCheck eq 0};
	function likeBoard() {
	<c:choose>
		<c:when test="${loginInfo ne null}">
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
			     $('#like').attr("src",src);
			     likeCheck=!likeCheck;
		      },
	    	  error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
			}
		});
		</c:when>
		<c:otherwise>
		alert("로그인을 해주세요");
		</c:otherwise>
	</c:choose>
	}
	</script>
</html>