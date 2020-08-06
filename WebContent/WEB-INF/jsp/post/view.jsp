<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/postView.css">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>${post.title}-DatePlanner</title>
</head>
<body>
	<nav class="navbar navbar-inverse" data-spy="affix">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="../">DatePlanner</a>
			</div>
			<c:choose>
				<c:when test="${empty loginInfo}">
					<ul class="nav navbar-nav navbar-right">

						<li><a href="../user/join"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>

						<li><a href="../user/login"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>

					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/user/mypage"><span class="glyphicon glyphicon-user"></span><strong>${loginInfo.nickname}</strong>로
								로그인중</a></li>
						<li><a href="../../user/logout">로그아웃</a></li>
					</ul>
				</c:otherwise>

			</c:choose>

		</div>
	</nav>

	<div class="parallex">
		<div id="board_info">
			<span id="title">${post.title}</span> <span id="writer">writer by ${post.user.nickname}</span> <span id="write_D">on
				${post.regdate}</span> <span id="region">이 글은 현재 <i class="fas fa-map-marker-alt"></i>${post.region}</span>
		</div>
	</div>

	<div class="container-fluid">

		<div class="content">${post.content}</div>

		<div id="good_box">
			<c:choose>
				<c:when test="${likeCheck eq 1}">
					<i id="good" class="fas fa-heart" style="color: red"></i>
				</c:when>
				<c:otherwise>
					<i id="good" class="fas fa-heart"></i>
				</c:otherwise>
			</c:choose>
			<span style="display: block">${like}</span>
		</div>
		
		<c:if test="${userNo eq post.user.no}">
			<div id="my_post">
				<a href="../update/${post.no}"><button class="btn btn-warning">수정</button></a> <a href="../delete/${post.no}"><button
						class="btn btn-danger">삭제</button></a>
			</div>
		</c:if>
		<div class="container" style="padding: 0">
			<div class="jumbotron" style="float: left; width: 100%;">
				<div>
					<div id="comment_write">
						<div id="profile">
							<a href="/user/mypage"><img src="/user/img/${loginInfo.profileWithDefault}"
								style="width: 50px; height: 50px; float: left;"></a> <span
								style="float: left; font-weight: bold; padding-left: 10px; margin-top: 15px">${loginInfo.nickname}</span>
						</div>
						
						<!-- 댓글입력 -->
						<form data-boardno="${post.no }" class="inputForm"> 
							<textarea class="form-control " placeholder="댓글을 입력해주세요"
								style="min-height: 150px; height: auto; resize: none"></textarea>
							<button class="btn btn-default" style="float: right">입력!</button>
						</form>
						
					</div>

					<div id="comment_wrap" style="float: left; width: 100%">
						<c:forEach var="comment" items="${comment}">
							<div class="comment_box" <c:if test="${comment.orderNo != 0}">style="background:wheat"></c:if>>
								<div class="user_info" style="padding-left: 10px">
									<div class="profile">
										<a style="display: inline-block;" href="/user/page/${comment.user.no}"><img
											src="/user/img/${comment.user.profileWithDefault}"></a>
									</div>
									<div class="nickname">
										<span>${comment.user.nickname}</span>
									</div>
								</div>

								<div class="comment_content" style="padding-left: 10px">
									<div class="comment">
										<span>${comment.content}</span>
									</div>
									<div class="write_date">
										<span>${comment.regdate}</span>
									</div>
								</div>

								<div class="comment_control"><!-- 댓글삭제 -->
									<c:if test="${userNo eq comment.user.no}">
										<form class="deleteForm" data-boardno="${post.no }" data-orderno="${comment.orderNo }" data-No="${comment.no }" >
											<button class=" btn btn-warning">삭제</button>
										</form>

										<div class="update"><!-- 댓글수정 -->
											<form class="updateForm" data-orderNo=${orderNo } data-No=${no } data-boardNo=${boardNo }>
												<input type="text" placeholder="수정할 내용" />
												<button class=" btn btn-default">수정하기</button>
											</form>
										</div>
									</c:if>
								</div>

								<div class="reply_btn">
									<c:if test="${comment.orderNo == 0}">
										<!-- 대댓글일경우 -->
										<form class="reInputForm" data-no="${comment.no }" data-boardNo="${post.no }">
											<input type="text" placeholder="답글달기" />
											<button class=" btn btn-default">답글달기</button>
										</form>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div id="moreTarget"></div>
		<button id="more">더보기</button>
	</div> 
	<jsp:include page="../include/postScript.jsp" flush="false"/>
</body>
</html>