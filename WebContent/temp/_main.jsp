<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>DatePlanner</title>
	<style>
		.navbar { margin-bottom: 0; }
		.regionbar {
			position: relative;
			border: 2px solid darkgoldenrod;
		}
		#mainContent {
			min-width: 1100px;
			min-height: 830px;
		}
		.container {
			border: 2px solid darkcyan;
		}
		.regionbar .dropdown {
			float: right;
			margin-top: -32px;
		}
		.contentwrap {
			padding-top: 20px;
			width: 100%;
			min-width: 1000px;
			position: relative;
		}
		.boardwrap {
			position: absolute;
			border: 2px solid aquamarine;
			width: 70%;
			height: 750px;
		}
		.boardlist {
			width: 100%;
			height: 100%;
			padding: 20px;
		}
		.festivalwrap {
			border: 2px solid coral;
			width: 30%;
			height: 750px;
			float: right;
		}
		.festival {
			border: 2px solid deepskyblue;
			width: 100%;
			height: 100%;
			padding: 15px;
		}
		.festival .container { width: 100%; }
		th { text-align: center; }
		th a:link { text-decoration: none; }
		
		#viewArray button {
			float: left;
			width: 50%;
		}
		#buttonBox {
			width: 100%;
			/*float: right;*/
			font-size: 1.8em;
		}
		#buttonBox button {
			width: 40px;
			height: 40px;
			float: right;
		}
		.table { text-align: center; }
		.mainPhoto img {
			width: 40px;
			height: 40px;
		}
		.contentTitle {
			font-weight: bold;
			position: relative;
			max-width: 90%;
		}
		.contentPreview {
			width: 400px;
			height: 25px;
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;
		}
		.contentInfo a, .rank a, .writer a,
		.writeDay a { text-decoration: none; }
		.contentPreview { text-overflow: ellipsis; }
	</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">DatePlanner</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="user/join"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> 로그인 <span
						class="glyphicon glyphicon-log-in"></span></a>

					<ul class="dropdown-menu">
						<li><a href="user/login">로그인</a></li>
						<li><a href="#">네이버 로그인</a></li>
						<li><a href="#">페이스북 로그인</a></li>
						<li><a href="#">구글 로그인</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<div id="mainContent" class="container">
		<div class="regionbar">
			<p>인천</p>
			<div class="dropdown">
				<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
					지역 변경 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><input class="form-control" id="myInput" type="text" placeholder="검색하기" /></li>
					<li><a href="#">서울</a></li>
					<li><a href="#">부산</a></li>
					<li><a href="#">울산</a></li>
					<li><a href="#">대구</a></li>
					<li><a href="#">인천</a></li>
				</ul>
			</div>
		</div>

		<div class="contentwrap">
			<div class="content">
				<div class="boardwrap">
					<div class="boardlist">

						<div id="viewArray">
							<button class="btn btn-info">인기게시물</button>
							<button class="btn btn-info">최신게시물</button>
						</div>

						<div id="buttonBox">
							<button>
								<i class="fab fa-buromobelexperte"></i>
							</button>
							<button>
								<i class="fas fa-list"></i>
							</button>
						</div>

						<div class="contentList">
							<table class="table table-hover">
								<tr>
									<th>순위</th>
									<th>메인사진</th>
									<th>글 정보</th>
									<th>글쓴이</th>
									<th>날짜</th>
								</tr>
								<c:forEach var="post" items="${postList}" varStatus="status">
									<tr>
										<td class="rank"><a href="#">${status.count}</a></td>
										<td class="mainPhoto"><a href="#"><img src="${post.image}"></a></td>
										<td class="contentInfo"><a class="contentTitle" href="#">${post.title}</a><br>
											<div class="contentPreview">${post.content}</div></td>
<%-- 										<td class="writer"><a href="#">${post.userNo}</a></td> --%>
										<td class="writeDay"><a href="#">${post.regdate}</a></td>
									</tr>
								</c:forEach>

							</table>
						</div>

					</div>
				</div>
			</div>
			<div class="festivalwrap">
				<div class="festival">

					<div class="container">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
								<li data-target="#myCarousel" data-slide-to="3"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner">

								<div class="item active">
									<img src="img/la.jpg" alt="Los Angeles" style="width: 100%;">
									<div class="carousel-caption">
										<h3>Los Angeles</h3>
										<p>LA is always so much fun!</p>
									</div>
								</div>

								<div class="item">
									<img src="img/chicago.jpg" alt="Chicago" style="width: 100%;">
									<div class="carousel-caption">
										<h3>Chicago</h3>
										<p>Thank you, Chicago!</p>
									</div>
								</div>

								<div class="item">
									<img src="img/chicago.jpg" alt="Chicago" style="width: 100%;">
									<div class="carousel-caption">
										<h3>Chicago</h3>
										<p>Thank you, Chicago!</p>
									</div>
								</div>

								<div class="item">
									<img src="img/ny.jpg" alt="New York" style="width: 100%;">
									<div class="carousel-caption">
										<h3>New York</h3>
										<p>We love the Big Apple!</p>
									</div>
								</div>

							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$("#myInput").keyup(function() {
				var value = $(this).val().toLowerCase();
				$(".dropdown-menu li").filter(function() {
					$(this).toggle($(this)
							.text().toLowerCase()
							.indexOf(value) > -1)
				});
			});
		});
	</script>
</body>
</html>