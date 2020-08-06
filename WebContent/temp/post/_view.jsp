<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>DatePlanner</title>
<style>
.navbar {
	margin-bottom: 0;
}

/*네비게이션바 고정*/
.affix {
	top: 0;
	width: 100%;
	z-index: 9999 !important;
}

.parallex {
	position: relative;
	height: 718px;
	background-image: url("img/${post.image}");
	background-position: center;
	background-repeat: no-repeat;
	background-color: dimgray;
	text-align: center;
	font-weight: bold;
	color: white;
	z-index: -1;
	opacity: .8;
}

.parallex:before {
	content: "";
	display: block;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: absolute;
	background-color: rgba(0, 0, 0, .4);
}

#good {
	display: inline-block;
}

#good a {
	font-size: 3em;
	text-decoration: none;
	color: darkgray;
}

ul li {
	list-style: none;
}

.nickname {
	font-weight: bold;
	font-size: 1.3em;
	text-align: left;
}

.comment {
	font-weight: bold;
	width: 750px;
	height: auto;
}

#board_info {
	padding-top: 300px;
}

#title {
	opacity: .9;
	width: 100%;
	font-size: 40px;
	height: 45px;
	display: block;
	text-decoration: underline;
	z-index: 5;
}

#writer {
	opacity: .9;
	font-size: 25px;
	width: 100%;
	height: 50px;
	display: inline;
	z-index: 5;
}

#write_D {
	opacity: .9;
	font-size: 15px;
	width: 100%;
	height: 20px;
	display: inline;
	z-index: 5;
}

#region {
	opacity: .9;
	width: 100%;
	font-size: 25px;
	height: 45px;
	display: block;
	padding-top: 20px;
	z-index: 5;
}

.content {
	text-align: center;
	padding-top: 50px;
}

.content p {
	margin-top: 10px;
	position: relative;
	width: 700px;
	font-weight: bold;
	font-size: 18px;
}

.container-fluid {
	background-color: white;
	text-align: center;
}

/*리모콘css시작*/
#remocon {
	position: fixed;
	margin-left: 85%;
	margin-top: 20%;
	border: 1.5px solid #909090;
	width: 200px;
	height: 300px;
	z-index: 5;
	background-color: #f9f9f9;
}

#r_Head {
	height: 10%;
	text-align: center;
	padding: 5px;
	background-color: #c2c2c2;
	opacity: .8;
	border-bottom: 1px solid #9f9f9f;
}

#placePick {
	height: 70%;
}

#placePick ul {
	width: 100%;
	height: 0;
	padding-top: 3px;
	margin-left: -18px;
	list-style: none;
	text-align: center;
}

#placePick ul li a {
	display: block;
	text-decoration: none;
	width: 156px;
	height: 20px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	/*color: black;*/
}

#directionBar {
	border-top: 1px solid #9f9f9f;
	background-color: #c2c2c2;
	padding-bottom: 10px;
	position: relative;
	height: 20%;
}

#previous {
	display: inline-block;
	position: relative;
	text-align: center;
	font-size: 3em;
	height: 100%;
	width: 50%;
	color: black;
}

#previous a {
	color: #64686f;
}

#next {
	display: inline-block;
	position: absolute;
	text-align: center;
	font-size: 3em;
	height: 100%;
	width: 50%;
}

#next a {
	color: #64686f;
}
/*리모콘끝*/
</style>
</head>
<body>
	<nav class="navbar navbar-inverse" data-spy="affix">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="../">DatePlanner</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span>
						회원가입</a></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> 로그인 <span
						class="glyphicon glyphicon-log-in"></span></a>

					<ul class="dropdown-menu">
						<li><a
							href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=tOzxSVFgBuq1ArjsmwsD&state=STATE_STRING&redirect_uri=http://localhost/main.jsp">
								네이버 로그인</a></li>
						<li><a href="#">페이스북 로그인</a></li>
						<li><a href="#">구글 로그인</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<div id="remocon">

		<div id="r_Head">
			<strong>리모콘</strong>
		</div>

		<div id="placePick">
		<!-- 장소별로 내부링크 걸기(패키지일때) -->
			<ul>
				
			</ul>
		</div>
		
		<div id="directionBar">
			<div id="previous" title="이전 장소로">
				<a href="#"><i class="fas fa-arrow-alt-circle-left"></i></a>
			</div>
			<div id="next" title="다음 장소로">
				<a href="#"><i class="fas fa-arrow-alt-circle-right"></i></a>
			</div>
		</div>
	</div>


	<div class="parallex">
		<div></div>
		<div id="board_info">
			<span id="title">${post.title}</span> <span id="writer">writer
				by ${post.user.nickname}</span> <span id="write_D">on
				${post.regdate}</span> <span id="region">이 글은 현재 <i
				class="fas fa-map-marker-alt"></i>${post.regionNo}</span>
		</div>
	</div>

	<div class="container-fluid">

		<div class="content" style="display: inline-block;">${post.content}</div>

<c:if test="${likeCheck eq 0}">
		<div id="good" style="display: block">
			<a href="like?boardNo=${post.no}"><i class="fas fa-heart"></i></a> <span style="display: block">${like }</span>
		</div>
</c:if>
<c:if test="${likeCheck eq 1}">
		<div id="good" style="display: block">
			<a href="like?boardNo=${post.no}"><i class="fas fa-heart" style="color:red"></i></a> <span style="display: block">${like }</span>
		</div>
</c:if>

	</div>

	<div class="container" style="padding: 0">
		<div class="jumbotron">
			<div>

				<div id="comment_write">
					<div id="profile">
						<img src="/user/img/${loginInfo.profile }"
							style="width: 50px; height: 50px; float: left;"> <span
							style="float: left; font-weight: bold; padding-left: 10px; margin-top: 15px">${loginInfo.nickname}</span>
					</div>
					
					<form action="commentInsert">
						<input type="hidden" name="boardNo" value="${post.no }">
						<input type="hidden" name="userNo" value="1">
					
						<textarea class="form-control" name="content" placeholder="댓글을 입력해주세요"
							style="min-height: 150px; height: auto; resize: none"></textarea>
						<button type="submit" class="btn btn-default" style="float: right">입력!</button>
					</form>
				</div>


				<table class="table table-striped" id="comment_back">

					<c:forEach var="comment" items="${comment }">
						<tr>
							<td class="nickname">${comment.userName }</td>
							<td class="comment">${commnet.content }</td>
							<td class="write_date">${comment.writeDate }</td>
						</tr>
					
					</c:forEach>


				</table>
			</div>
		</div>
	</div>

	<script src="/js/jquery.js"></script>

	<script>
		var window = $(window);
		$(window).scroll(function() {
			if ($(window).scrollTop() / 2 < 500) {
				$('.parallex').css('top', $(window).scrollTop() / 2);
			} //if
		});

		$("#good a").click(function() {
			$("#good a").css("color", "red");
		});
		
	</script>

</body>
</html>
