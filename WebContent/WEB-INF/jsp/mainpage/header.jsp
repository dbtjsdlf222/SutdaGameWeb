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
    font-size: 50px;
    color: midnightblue;
    font-weight: bold;
    font-family: stencil;
}
.home a{
    text-decoration: none;
}
.nav{
    display: flex;
    border-bottom: 2px solid midnightblue;
    height: 100px;
    align-items: center;
}
.nav-right-items{
    display: flex;
    margin-left: auto;
    margin-right: 50px;
    text-align: center;
}
.nav-item{
    margin-left: 30px;
    margin-right: 100px;
}
.login{
    width: 100px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: midnightblue;
    margin-right: 50px;
    text-align: center;
}
.login a{
    text-decoration: none;
    color: white;
    font-size: 20px;
    font-weight: bold;
}
.mypage{
	width: 120px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: midnightblue;
    margin-right: 50px;
    text-align: center;
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
    color: midnightblue;
}
</style>
</head>
<body>
	<header>
    <div class="nav">
        <div class="home"><a href="/main">QRPAY</a></div>
        <div class="nav-right-items">
            <div class="nav-item"><a href="/intro">소개</a></div>
            <div class="nav-item"><a href="/notice">공지사항</a></div>
            <div class="nav-item"><a href="/board/boardList">고객센터</a></div>
        </div>
        <% if(session.getAttribute("loginInfo")==null){ %>
        
	        <div class="login"><a href="/login">로그인</a></div>
        <% } else{ %>
        	<div class="mypage"><a href="/mypage">마이페이지</a></div>
        	
        <% } %>
    </div>
    </header>
</body>
</html>