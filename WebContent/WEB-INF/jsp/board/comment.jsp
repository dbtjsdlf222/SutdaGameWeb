<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
.commentList button{
	color:#fff;
}
h3{
   border-bottom: 1px solid white;
}
.comment-box{
	width:890px;
}
#commentBox{
    margin-top: 20px;
    width: 80%;
    height: 50px;
    resize: none;
    color: white;
    border: none;
    background-color: transparent;
    border-bottom: 2px #fff solid;
    outline: none;
}
#commentBtn{
   width: 10%;
   height: 50px;
   background-color: #363636;
   color: white;   
}
.commentCon{
   background-image: url('/img/comment.png');
   background-repeat: no-repeat;
   width: 472.5px;
   margin: 20px;
   margin-bottom: 10px;
   color: white;
   word-wrap: break-word;
   padding-right: 15px;
}
.commentCon .nickname{
   color: black;
   margin-left: 30px;
   height: 30px;
}
.content{
    width: 448px;
    height: 50px;
}
.commentCon .content{
   margin-left: 20px;
   margin-top: -5px;
}
.regdate{
    position: relative;
    right: -6px;
    float:right;
}
.commentCon > button{
   background-color: #363636;
   color: white;
}
.reCommentCon{
   background-image: url('/img/reComment.png');
   background-repeat: no-repeat;
   background-size: cover;
   width: 472.5px;
    height: 90px;
   margin: 20px;
   margin-left: 100px;
   margin-bottom: 43px;
   color: white;
   word-wrap: break-word;
   padding-right: 15px;
}
.reCommentCon .nickname{
   color: black;
   margin-left: 30px;
   height: 30px;
}
.reCommentCon .content{
   margin-left: 20px;
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
   height: auto;
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
.commentBox{
   display: none;
}
.mycomment{
	display: none;
}
.reCommentWrite{
   background-color: #363636;
   color: white;
}
input[class="reComment"]{
   width: 400px;
   background-color: #363636;
   color: white;
   margin-top: 10px;
   border:none;
   border-bottom:2px #fff solid;
   background:transparent;
   outline:none;
}
#reCommentBtn, #reCommentView, #commentView, #commentBtn{
   background-color: #363636;
   color: white;
}
#commentDelete{
	background-color: #363636;
	color: white;
}
.commentUpdate{
	background-color: #363636;
	color: white;
}
#commentView{
    margin-top: 20px;
    width: 100px;
    margin-left: 13px;
}
.updateInputBox{
	border: none;
    opacity: 0.4;
    color: black;
    font-weight: 900;
    margin-left: 12px;
    width: 448px;
    height: 50px;
    border-radius: 7px;
    font-size: 11px;
    margin-bottom: 20px;
}
</style>
<body>
   <div class="comment-box container">
      <h3 style="color: white; font-family: 'Rosewood Std'">댓글</h3>
      <div class="commentWrite" >
         <input type="text" id="commentBox" placeholder="댓글 입력.." maxlength="60" minlength="3">
         <button id="commentBtn" onclick="writeComment()">확인</button>
      </div>
      <div class="commentList">
      
         <c:choose>
            <c:when test="${comment ne null}">
               <c:forEach var="comment" items="${comment}" varStatus="status">
               <div class="commentConPa">
                  <div class="commentCon">
                        <div class="nickname"><c:out value="${comment.player.nickname}"/></div>
                        <div class="content">${comment.content}</div>
                        <br><div class="regdate">
                        <c:choose>
                           <c:when test="${comment.regdate gt 31536000}">
                              <fmt:parseNumber var="percent" value="${comment.regdate/31536000}" integerOnly="true"/>
                              <c:out value="${percent}년 전"/>
                           </c:when>
                           <c:when test="${comment.regdate gt 604800}">
                              <fmt:parseNumber var="percent" value="${comment.regdate/604800}" integerOnly="true"/>
                              <c:out value="${percent}주 전"/>
                           </c:when>
                           <c:when test="${comment.regdate gt 86400}">
                              <fmt:parseNumber var="percent" value="${comment.regdate/86400}" integerOnly="true"/>
                              <c:out value="${percent}일 전"/>
                           </c:when>
                           <c:when test="${comment.regdate gt 3600}">
                              <fmt:parseNumber var="percent" value="${comment.regdate/3600}" integerOnly="true"/>
                              <c:out value="${percent}시간 전"/>
                           </c:when>
                           <c:when test="${comment.regdate gt 60}">
                              <fmt:parseNumber var="percent" value="${comment.regdate/60}" integerOnly="true"/>
                              <c:out value="${percent}분 전"/>
                           </c:when>
                           <c:when test="${comment.regdate le 60}">
                              <c:out value="방금 전"/>
                           </c:when>
                        </c:choose>
                        </div>
                        <c:if test="${comment.replyCount ne 0}">&emsp;
                        <button id="reCommentView" onclick="selectReComment(this)"
							data-no='${comment.no}' data-p="1" data-end='${page.end}'>
							답글이 <span><c:out value="${comment.replyCount}" /></span>개 있습니다.
                        </button>
                        </c:if>
                        &emsp;<button class="reCommentWrite" onclick="reCommentWrite(this)">답글 쓰기</button>
                        <c:if test="${comment.myComment eq 1 || admin eq true}">
                       		&emsp;<button class="updateComment" data-no='${comment.no }' data-orderno='${comment.orderNo }'>수정</button>
                        	&emsp;<button id="commentDelete" data-no='${comment.no }' data-orderno='${comment.orderNo }' onclick="deleteComment(this)">삭제</button>
                        </c:if>
                  </div>
                        <div class="commentBox">
                        &emsp;<input class="reComment" placeholder="답글" maxlength="60">
                           <button id="reCommentBtn" onclick="reCommentInsert(this)" data-no='<c:out value="${comment.no}"/>' >답글 입력
                           </button>
                        </div>
              		</div>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <h3>댓글이 없습니다.</h3>
            </c:otherwise>
         </c:choose>
      <c:if test="${fn:length(comment)>=10}">
      	<button id="commentView" onclick="selectComment(this)" data-no='${post.no }' data-p="2" data-end='${page.end }'>댓글 더보기</button>
      </c:if>
      </div>
   </div>
</body>

<script>
	<%--답글 더보기--%>
   function selectReComment(e){
      $.ajax({
           url:'/ajax/selectReComment',
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
               var writeTime = data[i].regdate;
                  if(writeTime > 3153600){
                     writeTime = Math.floor(writeTime/31536000) + '년 전';
                  } else if(writeTime > 604800){
                     writeTime = Math.floor(writeTime/604800) + '주 전';
                  } else if(writeTime > 86400){
                     writeTime = Math.floor(writeTime/86400) + '일 전';
                  } else if(writeTime > 3600){
                     writeTime = Math.floor(writeTime/3600) + '시간 전';
                  } else if(writeTime > 60){
                     writeTime = Math.floor(writeTime/60) + '분 전';
                  } else if(writeTime < 60){
                     writeTime = '방금 전';
                  }
                  var btn="";
                  if(data[i].myComment == 1||admin){btn="<button class='updateComment'  data-no='"+data[i].no+"' data-orderno='"+data[i].orderNo+"'>수정</button>&emsp;<button class='deleteComment' data-no='"+data[i].no+"' data-orderno='"+data[i].orderNo+"' onclick='deleteComment(this)'>삭제</button>"; }
                 $(e).parent().append(
                       "<div class='reCommentCon'><div class='nickname'>"+data[i].player.nickname+"</div><div class='content'>"+data[i].content+"</div><br><div class='regdate'>"+writeTime+"</div>"+btn+"</div>");
               }
               if(data.length < 5) {
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
   
   <%--답글 쓰기 버튼--%>
   function reCommentWrite(e){
      $(e).parent().parent().find(".commentBox").toggle();
   }
   var admin = ${admin};
   <%--댓글 더보기--%>
   function selectComment(e){
      $.ajax({
           url:'/ajax/selectComment',
           type: 'POST',
            data: {  no:$(e).data("no"), p:$(e).data("p") },
            success: function(data) {
               $(e).data("p",$(e).data("p")+1);
              for(var i=0; i<data.length;i++){
                 var writeTime = data[i].regdate;
                  if(writeTime > 3153600){
                     writeTime = Math.floor(writeTime/31536000) + '년 전';
                  } else if(writeTime > 604800){
                     writeTime = Math.floor(writeTime/604800) + '주 전';
                  } else if(writeTime > 86400){
                     writeTime = Math.floor(writeTime/86400) + '일 전';
                  } else if(writeTime > 3600){
                     writeTime = Math.floor(writeTime/3600) + '시간 전';
                  } else if(writeTime > 60){
                     writeTime = Math.floor(writeTime/60) + '분 전';
                  } else if(writeTime < 60){
                     writeTime = '방금 전';
                  }
                  var btn = "";
                  if(data[i].myComment == 1||admin){ btn = "<button class='updateComment' data-no='"+data[i].no+"' data-orderno='"+data[i].orderNo+"'>수정</button>&emsp;<button class='deleteComment' data-no='"+data[i].no+"' data-orderno='"+data[i].orderNo+"' onclick='if(confirm('댓글을 삭제하시겠습니까?))'>삭제</button>"; }
				$(e).before(
					"<div class='commentConPa'><div class='commentCon'><div class='nickname'>"
					+data[i].player.nickname+"</div><div class='content'>"+data[i].content+
					"</div><br><div class='regdate'>"+writeTime+"</div>"+
					(data[i].replyCount != 0 ? "&emsp;<button id='reCommentView' onclick='selectReComment(this)' data-no='"+ data[i].no +
					"' data-p='1'>답글이 <span>"+data[i].replyCount+"개 있습니다.</button>":"") +
					"&emsp;<button class='reCommentWrite' onclick='reCommentWrite(this)'>답글 쓰기</button>&emsp; "+btn+" </div><div class='commentBox'><input class='reComment' placeholder='답글' maxlength='60'><button id='reCommentBtn' onclick='reCommentInsert(this)'>답글 입력</button></div></div>");
              }
              if(data.length < 5) {
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

   <%--댓글 입력--%>
   function writeComment() {
      <c:choose>
         <c:when test="${loginInfo ne null}">
	         if($.trim($("#commentBox").val())==""){
	        	 alert("글자를 입력 해주세요");
	           } else { 
	            $.ajax({
	                 url:'/ajax/commentInsert',
	                 type: 'POST',
	                  data: {  content:$("#commentBox").val(), boardNo:${post.no} ,csrf_token:"${csrf_token}" },
	                  success: function(data) {
		                  if(data=='limit'){
		                	  alert("요청이 너무 많습니다. \n잠시 후 시도해 주세요");
			               }else{
			            	   alert("댓글이 입력 되었습니다.");
			               }
	                     location.reload();
	                     $("#commentBox").val("");
	                  },
	                  error:function(textStatus, errorThrown){
	                      alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n나중에 다시 시도해주세요");
	                 }
	            });
	         }
         </c:when>
      <c:otherwise>
         alert("로그인을 해주세요");
      </c:otherwise>
      </c:choose>
   }
   
   <%--답글 입력--%>
   function reCommentInsert(e) {
      <c:choose>
      <c:when test="${loginInfo ne null}">
      if($(e).prev().val().trim()==""||$(e).data("no")=="") {
         alert("내용을 입력해주세요");
         return;
      }
      $.ajax({
           url:'/ajax/commentReInsert',
           type: 'POST',
            data: {  content:$(e).prev().val(), no:$(e).data("no"), csrf_token:"${csrf_token}" },
            success: function(data) {
            	if(data=='limit'){
               	  alert("요청이 너무 많습니다. \n잠시 후 시도해 주세요");
	           }else{
	              alert("댓글이 입력 되었습니다.");
	           }
               location.reload();
               $(e).prev().val("");
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
   
   <%--답글 삭제--%>
   function deleteComment(e) {
      <c:choose>
      <c:when test="${loginInfo ne null}">
      $.ajax({
           url:'/ajax/commentDelete',
           type: 'POST',
           data: {  no:$(e).data("no"), orderNo: $(e).data("orderno") ,csrf_token:"${csrf_token}"},
           success: function(data) {
                if(data=="error") { alert("권한이 없습니다.");
                } else if(data=="remove") { alert("이미 삭제 되었습니다.");
				} else {
					alert("댓글 삭제 성공");
               		$(e).parent().remove();
				}
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

   <%-- 대, 댓글 수정 --%>
	$('.commentList>.commentConPa>.commentCon').on("click",".updateComment",function(){
		var $content = $(this).parent().children(".content");
		$content.replaceWith("<textarea class='updateInputBox'> "+$content.text()+"</textarea>");
		$(this).addClass("updateCommentAction");
		$(this).parent().find(".updateInputBox").focus();
	})
	
	$('.commentList>.commentConPa').on("click",".updateCommentAction",function(){
		$(this).removeClass("updateCommentAction");
		var $updateInputBox = $(this).parent().children(".updateInputBox");
		if($updateInputBox.val().trim().length  < 1){
			alert("글자를 입력해 주세요");
			return;
		}
		updateComment($(this).data('no'),$(this).data('orderno'),$updateInputBox.val(),$updateInputBox);
	})
	
  function updateComment(no,orderNo,content,$updateInputBox){
		<c:choose>
	      <c:when test="${loginInfo ne null}">
	      $.ajax({
			 url:'/ajax/commentUpdate',
			 type: 'POST',
			  data: {  content:content, orderNo:orderNo, no:no ,csrf_token:"${csrf_token}"},
			  success: function(data) {
				  if(data=='error'){
					  alert("권한이 없습니다.");
				  } else {
					  $updateInputBox.replaceWith("<div class='content'>"+$updateInputBox.val()+"</div>");
					  alert("댓글이 수정 되었습니다.");
				  }
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
   
	<%--좋아요--%>
    var likeCheck = ${likeCheck eq 0};
   function likeBoard() {
   <c:choose>
      <c:when test="${loginInfo ne null}">
      $.ajax({
           url:'/ajax/likeBoard',
           type: 'POST',
            data: {  no:${post.no} ,csrf_token:"${csrf_token}"},
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