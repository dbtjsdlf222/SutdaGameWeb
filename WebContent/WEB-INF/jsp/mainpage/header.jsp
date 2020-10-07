<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>메인 헤더</title>
    <jsp:include page="../include/rel.jsp" flush="false" />

<style type="text/css">
.home{
    margin-left: 30px;
    margin-right: 30px;
}
.home a{
    text-decoration: none;
    font-size: 50px;
    color: #0A4600;
    font-weight: bold;
    font-family: stencil;
}
.nav{
    display: flex;
    margin: auto;
    padding-top: 30px;
/*     border-bottom: 2px solid #0A4600; */
    height: 200px;
	list-style: none;
}
.dept01{
    display: flex;
    list-style: none;
    text-align: center;
}
.dept01 li span{
	margin-right: 65px;
}
.dept01 li span a{
	font-size: 25px;
	color: #0A4600;
	font-weight: bold;
}
.dept02{
 	display: none;
	list-style: none;
	padding-left: 0px;
}
.dept02 li{
	align-items: center;
	padding-left: 0px;
}
.login{
    width: 100px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: #0A4600;
    margin-right: 50px;
    text-align: center;
}
.login a{
    text-decoration: none;
    color: white;
    font-size: 20px;
    font-weight: bold;
}
.join{
    width: 120px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: #0A4600;
    margin-right: 50px;
    text-align: center;
}
.join a{
    text-decoration: none;
    color: white;
    font-size: 20px;
    font-weight: bold;
}
.mypage{
	margin-right: 50px;
}
.mypage a{
	text-decoration: none;
    color: white;
    font-size: 20px;
    font-weight: bold;
}
</style>
</head>
<body>
	<header>
    <div class="nav">
        <div class="home"><a href="/main">SUTDA</a></div>
        <div class="top-menu">
        	<ul class="dept01">
        		<li>
        			<span><a href="/news">새 소식</a></span>
        			<ul class="dept02">
        				<li id="notice">공지사항</li>
        				<li id="patch">패치노트</li>
        				<li id="event">이벤트</li>
        			</ul>
        		</li>
        		<li>
        			<span><a href="/reference">자료실</a></span>
        			<ul class="dept02">
        				<li id="download">다운로드</li>
        				<li id="guide">게임 가이드</li>
        			</ul>
        		</li>
        		<li>
        			<span><a href="/community">커뮤니티</a></span>
        		</li>
        		<li>
        			<span><a href="/shop">상점</a></span>
        		</li>
        		<li>
        			<span><a href="/rank">명예의 전당</a></span>
        		</li>
        		<li>
        			<span><a href="/customer">고객센터</a></span>
        			<ul class="dept02">
        				<li id="1to1">1:1 문의</li>
        				<li id="often">자주하는 질문</li>
        			</ul>
        		</li>
        	</ul>
       	</div>
        <% if(session.getAttribute("loginInfo")==null){ %>
        
	        <div class="login"><a href="/login">로그인</a></div>
	        <div class="join"><a href="/join">회원가입</a></div>
        <% } else{ %>
        	<div class="mypage"><a href="/mypage"><img id="slide-menu" src="/img/samsun.png"></a></div>
        <% } %>
    </div>
    </header>
    <script>
    $(document).on('mouseover', '.top-menu span', function () {
        $('.dept02').slideDown(200);
    });
    $(document).on('mouseout', 'div', function () {
        if (!$(this).hasClass('top-menu')) {
            $('.dept02').slideUp(200);
        }
    });
    </script>
</body>
</html>