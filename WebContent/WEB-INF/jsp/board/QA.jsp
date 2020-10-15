<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>고객센터</title>
    <jsp:include page="../include/rel.jsp" flush="false" />
</head>
<style>
.container{
   margin: auto;
}
.title{
   background-color: #A465FD;
   padding-top: 10px;
   font-weight: bold;
}
.title h1{
   font-weight: bold;
   padding-left: 20px;
}
ul.tabs{
   margin: 0px;
   padding: 0px;
   list-style: none;
}
ul.tabs li{
   background-color: #9E9E9E;
   color: white;
   display: inline-block;
   cursor: pointer;
   width: 49.8%;
   font-size: 30px;
   text-align: center;
}
ul.tabs li.current{
   border-bottom: 10px solid #5C1DB5;
   color: white;
}
.tab-content{
   display: none;
   background-color: #ededed;
   padding: 20px;
}
.tab-content.current{
   display: inherit;
}
/* .tab-content.current tr{ */
/*    border-bottom: 1px solid white; */
/* } */
/* .tab-content.current p{ */
/*    border-bottom: 1px solid white; */
/*    font-size: 20px; */
/* } */
.tab-content.current tr td:nth-child(1){
   width: 200px;
   font-size: 20px;
   text-align: center;
}
.tab-content.current tr td:nth-child(2){
   width: 800px;
   font-size: 20px;
   text-align: center;
}
.tab-content.current tr td:nth-child(3){
   width: 300px;
   font-size: 15px;
   text-align: center;
}
#QList{
   border: 1px solid #fff;
   padding: 1em;
   margin-bottom: 30px;
   width: 90%;
}
#AList{
   border: 1px solid #fff;
   padding: 1em;
   margin-bottom: 30px;
   width: 90%;
   margin-left: 10%;
}
#write{
   width: 150px;
   height: 40px;
   background-color: #DB3A00;
   color: white;
   float: right;
}
input[type="button"]{
   width: 80px;
   height: 30px;
   background-color: #DB3A00;
   color: white;
   float: right;
}
</style>
<body>
   <jsp:include page="../mainpage/header.jsp" flush="false"/>
   
<div class="container">
   <div class="title">
      <h1>고객센터</h1>
   <ul class="tabs">
      <a href="/board/boardList?kind=7"><li class="tab-link current" data-tab="tab-1">1:1문의</li></a>
      <a href="/board/boardList?kind=8"><li class="tab-link" data-tab="tab-2">자주묻는 질문</li></a>
   </ul>
   </div>
   <div id="tab-1" class="tab-content current">
      <fieldset>
            <c:forEach var="post" items="${boardList}" varStatus="status">
            <div id="QList">
               <table class="table table-hover">
                  <tr>
                     <td><a href="/board/view/${post.no}">${post.title}</a></td>
                     <td>${post.writerName}</td>
                     <td>${post.writeDate}</td>
                  </tr>
                  <tr>
                     <td id="post_content"><c:out value="${post.content}"/></td>
                  </tr>
                  <tr>
                     <input type="button" value="삭제" name="delete">
                     <input type="button" value="수정" name="update">
                  </tr>
               </table>
            </div>
            <p>(☞ﾟヮﾟ)☞</p>
            <div id="AList">
               <table>
                  <tr>
                     <td><c:out value="${ans.title}"/></td>
                     <td>관리자</td>
                     <td>${ans.writeDate}</td>
                  </tr>
                  <tr>
                     <td id="ans_content"><c:out value="${ans.content}"/></td>
                  </tr>
               </table>
            </div>
            </c:forEach>
      </fieldset>
      <a href="/board/write"><input type="button" value="글 작성" name="write" id="write"></a>
   </div>
   <div id="tab-2" class="tab-content">
      <fieldset>
         <p>자주하는 질문</p>
            <div id="FQboardList">
            <c:forEach var="post" items="${FQboardList}" varStatus="status">
               <div class="FQ_title"><c:out value="${post.title}"/></div>
               <div class="FQ_content"><c:out value="${post.content}"/></div>
            </c:forEach>
            </div>      
      </fieldset>
   </div>
   <ul class="pagination">
      <c:if test="${1 < page.start}">
         <li><a href="?p=${page.start - page.pageCount}" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span></a></li>
      </c:if>
      <c:forEach var="p" begin="${page.start}" end="${page.end}">
         <li><a href="?<c:if test="${!empty title}">title=${title}&</c:if>p=${p}" <c:if test="${p eq page.current}">id="selected"</c:if>>${p}</a></li>
      </c:forEach>
      <c:if test="${page.next}">
         <li><a href="?p=${page.end + 1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
      </c:if>
   </ul>
</div>


<script>
$(document).ready(function(){
   
   $('ul.tabs li').click(function(){
      var tab_id = $(this).attr('data-tab');

      $('ul.tabs li').removeClass('current');
      $('.tab-content').removeClass('current');

      $(this).addClass('current');
      $("#"+tab_id).addClass('current');
   })
})
</script>
</body>
</html>