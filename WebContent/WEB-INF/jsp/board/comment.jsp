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
   background-color: #363636;
   color: white;
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
   height:92px;
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
.commentCon > button{
   margin-top: 20px;
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
   margin-bottom: 0px;
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
.asd{
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
}
#reCommentBtn, #reCommentView, #commentView, #commentBtn{
   background-color: #363636;
   color: white;
}
.addComment{
   width: 470px;
   height: 50px;
}
#commentDelete{
	background-color: #363636;
	color: white;
}
#commentUpdate{
	background-color: #363636;
	color: white;
}
.commentWrite{
	margin-bottom:134px;
}
</style>
<body>
   <div class="comment-box container">
      <h3 style="color: white; font-family: 'Rosewood Std'">댓글</h3>
      <div class="commentList">
      
      <c:if test="${fn:length(comment)>=10}">
      <button id="commentView" onclick="selectComment(this)"
         data-no='${post.no }' data-p="2" data-end='${page.end }'>댓글 더보기</button>
      </c:if>
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
                        <br>
                  </div>
                        <c:if test="${comment.replyCount ne 0}">&emsp;
                        <button id="reCommentView" onclick="selectReComment(this)"
							data-no='${comment.no}' data-p="1" data-end='${page.end}'>
							답글이 <span><c:out value="${comment.replyCount}" /></span>개 있습니다.
                        </button>
                        </c:if>
                        &emsp;<button class="reCommentWrite" onclick="reCommentWrite(this)">답글 쓰기</button>
                        <c:if test="${comment.myComment eq 1 || admin eq true}">
                       		&emsp;<button id="commentUpdate" onclick="updateComment(this)" data-no='${comment.no }' data-orderno='${comment.orderNo }'>수정</button>
                        	&emsp;<button id="commentDelete" onclick="deleteComment(this)" data-no='${comment.no }' data-orderno='${comment.orderNo }'>삭제</button>
                        </c:if>
                        <div class="asd">
                        &emsp;<input class="reComment" placeholder="답글">
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
      </div>
      <div class="addComment">
         
      </div>
      <div class="commentWrite" >
         <input type="text" id="commentBox" placeholder="댓글 입력..">
         <button id="commentBtn" onclick="writeComment()">확인</button>
      </div>
   </div>
</body>

<script>
   //답글 더보기
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
                  if(data[i].myComment == 1||admin){btn="<button class='updateComment'>수정</button>&emsp;<button class='deleteComment' data-no='"+data[i].no+"' data-orderno='"+data[i].orderNo+"' onclick='deleteComment(this)'>삭제</button>"; }
                 $(e).prev().after(
                       "<div class='reCommentCon'><div class='nickname'>"+data[i].player.nickname+"</div><div class='content'>"+data[i].content+"</div><br><div class='regdate'>"+writeTime+"</div>"+btn+"</div>");
                 /* if (data[i].no == myno){
                    "<button value="삭제"></button>"+"<button value="수정"></button>"
                 } */
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
   
   //답글 쓰기 버튼
   function reCommentWrite(e){
      $(e).parent().find(".asd").toggle();
   }
   var admin = ${admin};
   //댓글 더보기
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
                  if(data[i].myComment == 1||admin){ btn = "<button class='updateComment'>수정</button>&emsp;<button class='deleteComment' data-no='"+data[i].no+"' data-orderno='"+data[i].orderNo+"' onclick='if(confirm('댓글을 삭제하시겠습니까?))'>삭제</button>"; }
				$(e).parent().append(
					"<div class='commentConPa'><div class='commentCon'><div class='nickname'>"
					+data[i].player.nickname+"</div><div class='content'>"+data[i].content+
					"</div><br><div class='regdate'>"+writeTime+"</div></div>"+
					(data[i].replyCount != 0 ? "&emsp;<button id='reCommentView' onclick='selectReComment(this)' data-no='"+ data[i].no +
					"' data-p='1'>답글이 <span>"+data[i].replyCount+"개 있습니다.</button>" : " ") +
					"&emsp;<button class='reCommentWrite' onclick='reCommentWrite(this)'>답글 쓰기</button>&emsp; :"+btn+" <div class='asd'><input class='reComment' placeholder='답글'><button id='reCommentBtn' onclick='reCommentInsert(this)'>답글 입력</button></div></div>");
              } 
              if(data.length < 5) {
                 $(e).remove();
              } else{
                 $(e).find("span").text($(e).find("span").text()-data.length);
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
                     $("#commentBox").val("");
//                      avComment();
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
   
//       var myno= ${loginInfo.nickname};
//       function avComment(){
//          $(".commentCon").clone().insertAfter(".addComment");
//       }
   //답글 입력
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
            data: {  content:$(e).prev().val(), no:$(e).data("no") },
            success: function() {
               alert("댓글 입력 성공");
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
   
   //답글 삭제
   function deleteComment(e) {
      <c:choose>
      <c:when test="${loginInfo ne null}">
      $.ajax({
           url:'/ajax/commentDelete',
           type: 'POST',
            data: {  no:$(e).data("no"), orderNo: $(e).data("orderno") },
            success: function() {
               alert("댓글 삭제 성공");
               $(e).parent().remove();
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
            data: {  content:$(e).parent().children(".reCommnet").val(), orderNo:$(e).data("no"),no:$(e).data("orderno") },
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