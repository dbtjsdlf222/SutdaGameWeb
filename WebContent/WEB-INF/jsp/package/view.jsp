<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>${pack.post.title} - DatePlanner</title>
	<style>
		#selected { background-color: gray; color:#fff; }
		
		 .navbar{
            margin-bottom: 0;
        }

        /*네비게이션바 고정*/
        .affix{
            top: 0;
            width: 100%;
            z-index: 9999 !important;
        }

        .parallex{
            position: relative;
            height: 718px;
            background-image: url("/package/img/${pack.post.image}");
            background-position: center;
            background-repeat: no-repeat;
            background-color: dimgray;
            text-align: center;
            font-weight: bold;
            color: white;
            z-index: -1;
            opacity: .8;
        }

        .parallex:before{
            content: "";
            display: block;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            position: absolute;
            background-color: rgba(0,0,0,.4);
        }

        #good{
            display: inline-block;
        }

        #good a{
            font-size: 3em;
            text-decoration: none;
            color: darkgray;
        }

        ul li{
            list-style: none;
        }

        .nickname{
            font-weight: bold;
            font-size: 1.3em;
        }

        .comment{
            font-weight: bold;
            width: 750px;
            height: auto;
        }

        #board_info{
            padding-top: 300px;
        }

        #title{
            opacity: .9;
            width: 100%;
            font-size: 40px;
            height: 45px;
            display: block;
            text-decoration: underline;
            z-index: 5;
        }

        #writer{
            opacity: .9;
            font-size: 25px;
            width: 100%;
            height: 50px;
            display: inline;
            z-index: 5;
        }

        #write_D{
            opacity: .9;
            font-size: 15px;
            width: 100%;
            height: 20px;
            display: inline;
            z-index: 5;
        }

        #region{
            opacity: .9;
            width: 100%;
            font-size: 25px;
            height: 45px;
            display: block;
            padding-top: 20px;
            z-index: 5;
        }

        .content{
            text-align: center;
            padding-top: 50px;
        }


        .container-fluid{
            background-color: white;
            text-align: center;
        }

        .re_comment{
            text-align: right;
        }

        .profile img{
            display: block;
            width: 50px;
            height: 50px;
        }

        .comment_box:nth-child(1){
            padding-top: 10px;
            background-color: #F9F9F9;
            border-top: #00ACC1 1px solid;
        }

        .comment_box{
            padding-top: 10px;
            background-color: #F9F9F9;
            border-bottom: #00ACC1 1px solid;
            float: left;
            text-align: left;
            width: 100%;
        }

        .reply_btn{
            text-align: right;
            width: 50%;
            padding: 10px;
            float: right;
            display: inline-block;
        }

        .reply_btn input{
            width: 80%;
        }

        .update{
            text-align: right;
            float: right;
            width: 85%;
            padding: 10px;
            display: inline-block;
        }

        .delete{
            text-align: right;
            float: right;
            padding: 10px;
            display: inline-block;
        }


        .update input{
            width: 75%;
        }

        .comment_control{
            text-align: right;
            width: 50%;
            float: right;
            display: inline-block;
        }
        
        #my_post{
        	padding: 15px;
        }
	</style>
</head>
<body>
<nav class="navbar navbar-inverse" data-spy="affix">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="../">DatePlanner</a>
        </div>
        <c:choose>
            <c:when test="${empty loginInfo}">
                <ul class="nav navbar-nav navbar-right" >

                    <li><a href="../user/join"><span
                            class="glyphicon glyphicon-user"></span>회원가입</a></li>

                    <li><a href="../user/login"><span
                            class="glyphicon glyphicon-log-in"></span>로그인</a></li>

                </ul>
            </c:when>
            <c:otherwise>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/user/mypage"><span
                            class="glyphicon glyphicon-user"></span><strong>${loginInfo.nickname}</strong>로
                        로그인중</a></li>
                    <li><a href="../../user/logout">로그아웃</a></li>
                </ul>
            </c:otherwise>

        </c:choose>

    </div>
</nav>
<div class="parallex">
    <div id="board_info">
        <span id="title">${pack.post.title}</span>
        <span id="writer">writer by ${pack.post.user.nickname}</span>
        <span id="write_D">on ${pack.post.regdate}</span>
        <span id="region">이 글은 현재 <i class="fas fa-map-marker-alt"></i>${pack.post.region}</span>
    </div>
</div>

<div class="container-fluid">
	<c:forEach var="post" items="${pack.placeList}">
		제목: ${post.title}
	    <div class="content">
	
	        ${post.content}
	        
	    </div>
			글쓴이_닉네임: ${post.user.nickname}
			지역: ${post.regionNo}
			작성일: ${post.regdate}
		<hr />
	</c:forEach>

    <div id="good">
	    <a href="../like?boardNo=${pack.post.no}">
	    <c:choose>
	    	<c:when test="${likeCheck eq 1}"><!-- 좋아요 눌렀는지 확인 -->
	    		<i class="fas fa-heart" style="color: red"></i>
	    	</c:when>
	    	<c:otherwise>
		        <i class="fas fa-heart"></i>
	    	</c:otherwise>
	    </c:choose>
	    </a>
	    <span style="display: block">${like}</span>
    </div>
    <c:if test="${userNo eq pack.post.user.no}">
	    <div id="my_post">
	       <%-- <a href="../update/${post.no}"><button class="btn btn-warning">수정</button></a> --%>
	       <a href="../delete/${post.no}"><button class="btn btn-danger">삭제</button></a>
	    </div>
	</c:if>
<div class="container" style="padding: 0">
    <div class="jumbotron" style="float: left; width: 100%;">
        <div>
            <div id="comment_write">
                <div id="profile">
                    <a href="/user/mypage"><img src="/user/img/${loginInfo.profileWithDefault}" style="width: 50px; height: 50px; float: left;"></a>
                    <span style="float: left; font-weight: bold; padding-left: 10px; margin-top: 15px">${loginInfo.nickname}</span>
                </div>
                <form action="../commentInsert">
                    <input type="hidden" name="boardNo" value="${pack.post.no}">
                    <textarea class="form-control" name="content" placeholder="댓글을 입력해주세요" style="min-height: 150px; height: auto; resize: none"></textarea>
                    <button type="submit" class="btn btn-default" style="float: right">입력!</button>
                </form>
            </div>

            <div id="comment_wrap" style="float: left; width: 100%">
                <c:forEach var="comment" items="${comment}">
                    <div class="comment_box" <c:if test="${comment.orderNo != 0}">style="background:wheat"></c:if>>
                    <div class="user_info" style="padding-left: 10px">
                        <div class="profile"><a href="/user/page/${comment.user.no}"><img src="/user/img/${comment.user.profileWithDefault}"/></a></div>
                        <div class="nickname"><span>${comment.user.nickname}</span></div>
                    </div>

                    <div class="comment_content" style="padding-left: 10px">
                        <div class="comment"><span>${comment.content}</span></div>
                        <div class="write_date"><span>${comment.regdate}</span></div>
                    </div>

                    <div class="comment_control">
                        <c:if test="${userNo eq comment.user.no}">

                            <form class="delete" action="../commentDelete">
                                <input type="hidden" name="boardNo" value="${pack.post.no}"/>
                                <input type="hidden" name="orderNo" value="${comment.orderNo}"/>
                                <input type="hidden" name="no" value="${comment.no}"/>
                                <button type="submit" class="btn btn-default">삭제</button>
                            </form>

                            <div class="update">
                            <form  action="../commentUpdate">
                                <input type="hidden" name="orderNo" value="${comment.orderNo}"/>
                                <input type="hidden" name="no" value="${comment.no}"/>
                                <input type="hidden" name="boardNo" value="${pack.post.no}"/>
                                <input type="text" name="content" placeholder="수정할 내용"/>
                                <button type="submit" class=" btn btn-default">수정하기</button>
                            </form>
                        </div>
                        </c:if>
                    </div>

                    <div class="reply_btn">
                        <c:if test="${comment.orderNo == 0}"> <!-- 대댓글일경우 -->
                            <form action="../reCommentInsert">
                                <input type="hidden" name="no" value="${comment.no}"/>
                                <input type="hidden" name="boardNo" value="${pack.post.no}"/>
                                <input type="text" name="content" placeholder="답글달기"/>
                                <button type="submit" class=" btn btn-default">답글달기</button>
                            </form>
                        </c:if>
                    </div>
            </div>
            </c:forEach>
            <!--대댓글 처리하기-->
        </div>
    </div>
</div>

	<ul class="pagination">
		<%-- 이전 페이지로 --%>
		<c:if test="${1 < page.start}"> 
			<li><a href="?p=${page.start - page.pageCount}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		</c:if>
		
		<%-- 페이지 블럭 생성 --%>
		<c:forEach var="p" begin="${page.start}" end="${page.end}"> 
			<li><a href="?p=${p}" <c:if test="${p eq page.current}">id="selected"</c:if>>${p}</a></li>
		</c:forEach>
		
		<%-- 다음 페이지로 --%>
		<c:if test="${page.next}">	
			<li>
				<a href="?p=${page.end + 1}"aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</c:if>
	</ul><!-- pagination -->

</div>
	<script>
	/* st = $(this).scrollTop()/2
		$(window).scroll(function(){if(st < 500) $('.parallex').css('top',st)}) */
		
		 var window = $(window);

	    $(window).scroll(function () {
	        if ($(window).scrollTop()/2 < 500) {
	            $('.parallex').css('top', $(window).scrollTop() / 2);
	        } //if
	    });
	</script>
</body>
</html>