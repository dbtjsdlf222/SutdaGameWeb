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
	img {
	    display: block;
	}
	.container {
	    max-width: 93.5rem;
	    margin: 0 auto;
	    padding: 0 2rem;
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
	.youbtube {
	    display: flex;
	    flex-wrap: wrap;
	    margin: -1rem -1rem;
	    padding-bottom: 3rem;
	}
	.youbtube-item {
	    position: relative;
	    flex: 1 0 22rem;
	    margin: 1rem;
	    color: #fff;
	    cursor: pointer;
	}
	.youbtube-item-type {
	    position: absolute;
	    top: 1rem;
	    right: 1rem;
	    font-size: 2.5rem;
	    text-shadow: 0.2rem 0.2rem 0.2rem rgba(0, 0, 0, 0.1);
	}
	.youbtube-image {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
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
	<div class="container">
		<div class="youbtube">
		<c:forEach items="${boardList }" var="post">
 			<div class="youbtube-item" tabindex="0">
				<img src="https://img.youtube.com/vi/${post.content }/0.jpg" class="youbtube-image" alt="${post.title}">
				<div class="youbtube-item-info">
					${post.title}
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>