<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>메인 페이지</title>
    <script src='js/jquery-3.5.1.min.js'></script>
    <script src='js/jquery-migrate-1.4.1.min.js'></script>
    <script src="js/jquery-ui.min.js"></script>
    <link href="main.css" rel="stylesheet" type="text/css">

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
    font-size: 30px;
    font-weight: bold;
    color: midnightblue;
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
.system-benefit{
    width: auto;
    height: 500px;
    background-color: midnightblue;
}
.system-explain{
    width: auto;
    height: 500px;
}
footer{
    background-color: midnightblue;
    width: 100%;
    height: 70px;
    display: block;
}
footer p{
    text-align: center;
    color: white;
}
</style>
</head>
<body>
    <header>
    <div class="nav">
        <div class="home"><a href="main">QRPAY</a></div>
        <div class="nav-right-items">
            <div class="nav-item">소개</div>
            <div class="nav-item">공지사항</div>
            <div class="nav-item">고객센터</div>
        </div>
        <div class="login"><a href="login">로그인</a></div>
        <!-- <img src="/image/user.png"> -->
    </div>
    </header>

    <div id="content">
        <img id="slide" src="../../image/slide1.png" name="slide">
    </div>

    <div class="system-benefit">
        <img src="image/benefit.png">
    </div>

    <div class="system-explain">
		설명
    </div>
    <footer>
        <p></p>
        <p>서울특별시 구로구 디지털로 306 2층(구로동 182-13, 대륭포스트타워2차)<br/>
        전화번호: 010-5716-0288 / E-mail: asino0226@gmail.com<br/>
        Copyrightⓒ2020QRPAY.All rights reserved.</p>
    </footer>
</body>
</html>