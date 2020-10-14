<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>커뮤니티</title>
    <jsp:include page="../include/rel.jsp" flush="false" />
</head>
<style>
.container{
	margin: auto;
}
.title{
	background-color: #FFFF24;
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
	border-bottom: 10px solid #DBC000;
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
.tab-content.current tr{
	border-bottom: 1px solid white;
}
.tab-content.current p{
	border-bottom: 1px solid white;
	font-size: 20px;
}
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
	font-size: 20px;
	text-align: center;
}
.tab-content.current tr td:nth-child(4){
	width: 300px;
	font-size: 20px;
	text-align: center;
}
.tab-content.current tr td:nth-child(5){
	width: 300px;
	font-size: 20px;
	text-align: center;
}
input[type="button"]{
	float: right;
	background-color: #DBC000;
	color: white;
	border: none;
	width: 150px;
	height: 40px;
	margin-top: 20px;
	font-size: 15px;
	font-weight: bold;
}
</style>
<body>
	<jsp:include page="../mainpage/header.jsp" flush="false"/>
	
<div class="container">
	<div class="title">
		<h1>커뮤니티</h1>
	<ul class="tabs">
		<a href="/board/boardList?kind=5"><li class="tab-link" data-tab="tab-1">자유게시판</li></a>
		<a href="/board/boardList?kind=6"><li class="tab-link current" data-tab="tab-2">스크린샷 게시판</li></a>
	</ul>
	</div>
	<div id="tab-1" class="tab-content">
		<fieldset>
			<table>
				<tr>
					<td id="post_no">No.</td>
					<td id="post_title">제목</td>
					<td id="user_id">작성자</td>
					<td id="post_like">추천</td>
					<td id="post_date">작성일</td>
				</tr>
			<c:forEach var="post" items="${boardList}" varStatus="status">
				<tr>
					<td><c:out value="${post.no}"/></td>
					<td><a href="board/view/${post.no}">${post.title}</a></td>
			        <td>${post.writerName}</td>
			        <td>${post.like}</td>
			        <td>${post.writeDate}</td>
				</tr>
			</c:forEach>
			</table>
			<a href="/board/write"><input type="button" value="글 작성" name="write"></a>
		</fieldset>
	</div>
	<div id="tab-2" class="tab-content current">
		<fieldset>
			<table>
				<tr>
					<td id="post_no">No.</td>
					<td id="post_title">제목</td>
					<td id="user_id">작성자</td>
					<td id="post_like">추천</td>
					<td id="post_date">작성일</td>
				</tr>
			<c:forEach var="post" items="${boardList}" varStatus="status">
				<tr>
					<td><c:out value="${post.no}"/></td>
					<td><a href="board/view/${post.no}">${post.title}</a></td>
			        <td>${post.writerName}</td>
			        <td>${post.like}</td>
			        <td>${post.writeDate}</td>
				</tr>
			</c:forEach>
			</table>
			<a href="/board/write"><input type="button" value="글 작성" name="write"></a>
		</fieldset>
	</div>
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