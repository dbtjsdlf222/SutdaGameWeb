<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>메인 페이지</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.x-git.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<style type="text/css">
.home{
    margin-left: 30px;
    padding-bottom: 10px;
    font-size: 50px;
    color: #0A4600;
    font-weight: bold;
    font-family: stencil;
}
.home a{
    text-decoration: none;
}
.nav{
    display: flex;
    border-bottom: 2px solid darkgreen;
    height: 100px;
    align-items: center;
}
.nav-right{
    display: flex;
    margin-left: auto;
    margin-right: 50px;
    text-align: center;
}
.nav-item{
    margin-left: 20px;
    margin-right: 80px;
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
.nav-item a{
	text-decoration: none;
	font-size: 30px;
    font-weight: bold;
    color: #0A4600;
}
</style>
</head>
<body>
	<header>
    <div class="nav">
        <div class="home"><a href="/main"><img id="logo" src="/img/logo.png"></a></div>
        <div class="nav-right">
	        <div class="nav-item"><a href="/news">새 소식</a></div>
	        <div class="nav-item"><a href="/reference">자료실</a></div>
	        <div class="nav-item"><a href="/community">커뮤니티</a></div>
       		<div class="nav-item"><a href="/shop">상점</a></div>
	        <div class="nav-item"><a href="/rank">명예의 전당</a></div>
	        <div class="nav-item"><a href="/customer">고객센터</a></div>
       	</div>
        <% if(session.getAttribute("loginInfo")==null){ %>
        
	        <div class="login"><a href="/login">로그인</a></div>
	        <div class="join"><a href="/join">회원가입</a></div>
        <% } else{ %>
        	<div class="mypage"><img id="slide-menu" src="/img/samsun.png"></div>
        <% } %>
    </div>
    </header>
</body>
</html>