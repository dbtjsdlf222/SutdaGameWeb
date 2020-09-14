<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>마이 페이지</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.x-git.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<style type="text/css">
.nav{
    display: flex;
    border-bottom: 2px solid midnightblue;
    height: 100px;
    margin: auto;
    align-items: center;
}
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
.title{
	margin-left: 30px;
    font-size: 30px;
    font-weight: bold;
    color: midnightblue;
    margin-right: 100px;
}
.logout{
    width: 100px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: midnightblue;
    margin-right: 50px;
    text-align: center;
}
.logout a{
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
        <div class="home"><a href="main">QRPAY</a></div>
        <div class="title">마이 페이지</div>
        <div class="logout"><a href="logout">로그아웃</a></div>
    </div>
    </header>
</body>
</html>