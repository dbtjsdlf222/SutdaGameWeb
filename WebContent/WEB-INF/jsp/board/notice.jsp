<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>섯다-커뮤니티</title>
</head>
<style>
#container{
	margin: auto;
	margin-top: -9px;
    width: 890px;
}
.title{
	background-color: #FF8224;
	padding: 10px;
	font-weight: bold;
	margin-top:20px;
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
	background: #9E9E9E;
	color: white;
	display: inline-block;
	cursor: pointer;
	width: 33.1%;
	font-size: 30px;
	text-align: center;
}
ul.tabs li.current{
	border-bottom: 10px solid #DB3A00;
	color: white;
}
.tab-content{
	display: none;
	background: #ededed;
	padding: 20px;
}
.tab-content.current{
	display: inherit;
}
.tab-content.current tr{
	border-bottom: 1px solid white;
}
.pagination>li>a{
	board:0px;
}
.table tr{
	cursor: pointer;
}
.table .table-hover span{
	display:inline;
}
.boardColumn{
	color: #ddd;
}
#board-list{
	width:100%;
}
#board-list tr:hover{
	background:linear-gradient(120deg, red -40%, black 50%, blue 150%);
	cursor:pointer
	padding:10px;
}
#board-list tr{
	border-bottom:1px solid #fff;
	cursor:pointer;
}
@keyframes back {
     0% {
     background:linear-gradient(0deg, red 0%, black 50%, blue 100%);
     }
     25% {
       background:linear-gradient(90deg, red 0%, black 50%, blue 100%);
     }
     50% {
       background:linear-gradient(180deg, red 0%, black 50%, blue 100%);
     }
     100% {
       background:linear-gradient(300deg, red 0%, black 50%, blue 100%);
     }
}
</style>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
    
<div id="container">
	<div class="title">
		<h1>커뮤니티</h1>
	</div>
	<div>
		<fieldset>
			<table id="board-list">
				<!-- <tr>
					<td id="post_no">No.</td>
					<td id="post_title">제목</td>
					<td id="post_date">작성일</td>
					<td id="post_view">조회수</td>
				</tr> -->
				<c:forEach var="post" items="${boardList}" varStatus="status">
				<tr onclick="location.href='/board/view/${post.no}'">
					<td>
						<div class="boardColumn">
							<h3>${post.title}</h3>
							<span class="nickname">${post.writerName}</span>
							<span class="date">${post.writeDate}</span>
							<span><i class="fas fa-eye"></i>${post.view }</span>
							<%-- <span><i class="far fa-heart"></i>${post.like }</span> --%>
							<span><i class="far fa-comments"></i>${post.commentCount}</span>
						</div>
					</td>
				</tr>
				</c:forEach>
			</table>
		</fieldset>
		<%@ include file="../include/pagination.jsp" %>
	</div>
<%-- 	<div id="tab-2" class="tab-content">
		<fieldset>
			<table>
				<tr>
					<td>버전</td>
					<td>제목</td>
					<td>업데이트 날짜</td>
				</tr>
				<tr>
					<td>버전</td>
					<td>${post.title}</td>
					<td>${post.writeDate}</td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div id="tab-3" class="tab-content">
		<fieldset>
			<table>
				<tr>
					<td>${post.title}</td>
					<td>이벤트 기간</td>
				</tr>
			</table>
		</fieldset>
	</div> --%>
</div>
<jsp:include page="../include/footer.jsp" flush="false" />
<script>
/* $(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
}) */
</script>
</body>
</html>