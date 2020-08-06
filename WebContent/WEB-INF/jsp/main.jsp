<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.dateplanner.commons.Region"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>DatePlanner</title>
	<style>
	 	#search_wrap{
            position: relative;
            padding-bottom: 50px;
        }

        #search_box{
            width: 95%;
            position: absolute;
            display: inline-block;
        }

        .input-group-btn{
            width: 5%;
            float: right;
        }
        
		#list_view {
			width: 70%; 
			padding-right: 5%;
			float: left;
		}
		
		h2 {
			text-align: center;
		}
		
		#no {
			width: 5%;
			font-size: 10px;
		}
		
		#title {
			width: 50%;
			font-size: 10px;
		}
		
		#writer {
			width: 20%;
			font-size: 10px;
		}
		
		#w_date {
			width: 20%;
			font-size: 10px;
		}
		
		#like {
			width: 5%;
			font-size: 10px;
		}
		
		#profile {
			width: 100%;
			overflow: hidden;
			float: left;
		}
		
		#name_box {
			text-align: center;
			padding-top: 5%;
			display: inline-block;
		}
		
		#nickname {
			font-size: large;
			font-weight: bold;
		}
		
		#greetings {
			font-size: large;
			height: 50%;
		}
		
		#btn_box {
			float: left;
			padding: 15px;
			display: block;
			width: 100%;
		}
		
		#btn_box button {
			width: 40%;
			padding: 10px;
		}
		
		table thead tr th {
			text-align: center;
		}
		
		tbody tr:hover {
			background-color: #d6d8db;
		}
		
		table {
			text-align: center;
		}
		
		#side_bar {
			text-align: center;
			width: 30%;
			float: left;
		}
		
		#user_info {
			padding-top: 3.5%;
		}
        #region_select{
            float: left;
            padding-top: 15px;
            width: 100%;
        }
        .list-group-item:hover {
			background-color:silver;
			cursor:pointer;
		}
	    .pagination {
	     	text-align: center;
	     	padding-left: 50%
	    }
		#selected {
			background-color: gray;
			color:#fff;
		}
		
	</style>
</head>
<body>
	<jsp:include page="include/nav.jsp" flush="false"/>
	<div class="container">
	<form action="/">
        <div id="search_wrap" class="form-group">
            <div id="search_box">
                <input type="text" class="form-control" name="title" placeholder="게시글 검색">
            </div>

            <div class="input-group-btn">
                <button type="submit" class="btn btn-info"><i class="fas fa-search"></i></button>
            </div>
        </div>
    </form>
		<div id="list_view">
			<c:choose>
				<c:when test="${empty postList}">
					<h1 style="padding-top: 50%; text-align: center">아직 게시글이 없네요
						ㅜㅜ</h1>
				</c:when>

				<c:otherwise>
					<h2>게시글 목록</h2>
					<table class="table">
						<thead>
							<tr>
								<th id="no">번호</th>
								<th id="title">제목</th>
								<th id="writer">글쓴이</th>
								<th id="w_date">날짜</th>
								<th id="like">추천</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="post" items="${postList}">
								<c:set var="category">
									<c:choose>
										<c:when test="${post.packageable eq null}">package</c:when>
										<c:otherwise>post</c:otherwise>
									</c:choose>
								</c:set>

								<tr <c:if test="${category eq 'package'}">style="background:lightgray"</c:if>>
									<td>${post.no}</td>
									<td><a href="${category}/view/${post.no}">${post.title}</a></td>
									<td>${post.user.nickname}</td>
									<td>${post.formattedRegdate}</td>
									<td>${post.like}</td>
								</tr>
 
							</c:forEach>

						</tbody>
					</table>

					<ul class="pagination">
						<c:if test="${1 < page.start}">
							<li><a
								href="?<c:if test="${!empty param.r}">r=${regionNo}&</c:if>p=${page.start - page.pageCount}"
								aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<c:forEach var="p" begin="${page.start}" end="${page.end}">
							<li><a href="?<c:if test="${!empty param.r}">r=${regionNo}&</c:if><c:if test="${!empty title}">title=${title}&</c:if>p=${p}" <c:if test="${p eq page.current}">id="selected"</c:if>>${p}</a></li>
						</c:forEach>
						<c:if test="${page.next}">
							<li><a
								href="?<c:if test="${!empty param.r}">r=${regionNo}&</c:if>p=${page.end + 1}"
								aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
					</ul>

				</c:otherwise>
			</c:choose>

		</div>

		<div id="side_bar" style="border: 2px solid #cbcbcb">
			<div id="user_info">
				<c:choose>
					<c:when test="${empty loginInfo}">
						<a href="user/login">
							<button style="width: 70%" class="btn btn-warning">로그인해주세요</button>
						</a>
					</c:when>

					<c:otherwise>
						<div id="profile">
							<a href="user/mypage"><img src="/user/img/${loginInfo.profileWithDefault}" height="85%"
								width="85%" /></a>
						</div>

						<div id="name_box" style="border: 2px blueviolet">
							<div id="nickname">${loginInfo.nickname}</div>
							<div id="greetings">어서오세요</div>
						</div>

						<div id="btn_box" style="border-bottom: 2px solid #cbcbcb">
							<a href="user/mypage">
								<button class="btn btn-info">마이페이지</button>
							</a>
							<a href="user/logout">
								<button class="btn btn-info">로그아웃</button>
							</a>
							<a href="post/write">
								<button class="btn btn-info">글쓰기</button>
							</a>
							<a href="package/create">
								<button class="btn btn-info">패키지 만들기</button>
							</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<div id="region_select">
				<h4>지역별 게시물 보기</h4>
				<input class="form-control" id="myInput" type="text"
					placeholder="검색"> <br>
				<ul class="list-group" id="myList">
					<c:forEach var="region" items="${Region.LIST}" varStatus="status">
						<li class="list-group-item" value="${status.index}"
							<c:if test="${status.index eq regionNo}">id="selected"</c:if>>${region}</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<script>
		$("#myInput") .on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$("#myList li").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
		
		$(".list-group-item") .on("click", function() {
			location.href = '?r=' + $(this).val();
		});
	</script>

</body>
</html>