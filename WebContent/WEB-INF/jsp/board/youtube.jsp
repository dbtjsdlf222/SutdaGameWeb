<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
    <html>
    <head>
    <title>유튜브 게시판</title>
<style type="text/css">
:root {
	font-size: 10px;
}
*,
*::before,
*::after {
box-sizing: border-box;
}
.title h1{
	color: white;
	text-align: center;
	padding: 30px;
    background-color: #654821;
    margin: 0;
}
img {
	display: block;
}
.container {
	max-width: 93.5rem;
    margin: 0 auto;
    padding: 0 2rem;
    background-color: #363636;
}
.btn {
    display: inline-block;
    font: inherit;
    background: none;
    border: none;
    color: inherit;
    padding: 0;
    cursor: pointer;
}
.btn:focus {
    outline: 0.5rem auto #4d90fe;
}
.youtube {
    display: flex;
    flex-wrap: wrap;
    margin: -1rem -1rem;
	margin-top: 20px;
    padding-bottom: 3rem;
}
.youtube-item {
    position: relative;
    flex: 1 0 22rem;
    margin: 1rem;
    color: #fff;
    cursor: pointer;
}
.youtube-item-type {
    position: absolute;
    top: 1rem;
    right: 1rem;
    font-size: 2.5rem;
    text-shadow: 0.2rem 0.2rem 0.2rem rgba(0, 0, 0, 0.1);
}
.youtube-image {
	margin-left: 15px;
    width: 280px;
    height: 100%;
    object-fit: cover;
}
.youtube-item-info{
	text-align: center;
}
@supports (display: grid) {
    .youbtube {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(22rem, 1fr));
        grid-gap: 2rem;
    }
    .youbtube-item,
    .youbtube {
        width: auto;
        margin: 0;
    }
}
</style>
</head>
<body>
<jsp:include page="../include/rel.jsp" flush="false" />
<jsp:include page="../include/header.jsp" flush="false" />
	<div class="container">
		<div class="title">
			<h1>유튜브 영상 자료실</h1>
		</div>
			<div class="youtube">
				<c:forEach items="${boardList }" var="post">
					<div onclick="location.href='/board/view/${post.no }'">
		 				<div class="youtube-item" tabindex="0">
							<img src="https://img.youtube.com/vi/${post.content }/0.jpg" class="youtube-image" alt="${post.title}">
							<div class="youtube-item-info">
								${post.title}
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
<!-- 페이지네이션 -->
	<ul class="pagination" style="border: 1px solid brown">
		<c:if test="${1 < page.start}">
			<li ><a href="?kind=10&p=${page.start - page.pageCount}"  aria-label="이전">
			<span aria-hidden="true">이전</span></a></li>
		</c:if>
		<c:forEach var="p" begin="${page.start}" end="${page.end}">
		<c:choose>
			<c:when test="${p eq page.current}">
				<li class="active disable">
					<a>${p}</a>
				</li>
			</c:when>
			<c:otherwise>
				<li>
					<a href="?kind=10&p=${p}">${p}</a>
				</li>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		<c:if test="${page.next}">
			<li ><a href="?kind=10&p=${page.end+1}"  aria-label="다음">
			<span aria-hidden="true">다음</span></a></li>
		</c:if>
	</ul>
	<c:if test="${ admin eq true}">
		<a href="/board/write?kind=10"><button type="button" class='write_btn'>글쓰기</button></a>
	</c:if>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>