<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Page Title</title>
    <script src='js/jquery-3.5.1.min.js'></script>
    <script src='js/jquery-migrate-1.4.1.min.js'></script>
    <script src="js/jquery-ui.min.js"></script>
    <link href="intro.css" rel="stylesheet" type="text/css">
    <script>

    </script>
</head>
<body>
    <header id="container">
        <h1><a href="main.html">QRPAY</a></h1>
        <nav>
            <ul>
                <li><a href="intro"><strong>소개</strong></a></li>
                <li><a href="notice"><strong>공지사항</strong></a></li>
                <li><a href="cs"><strong>고객센터</strong></a></li>
            </ul>
        </nav>
        <a href="login.html"><div class="login">로그인</div></a>
    </header>
    <hr color="midnightblue" size="3px"/>
    <section>
        <article>
            <fieldset>
                <legend>기업 소개</legend>
                <h5>개발팀 인사</h5>
                <p>안녕하세요~ 개발팀 입니다~</p>
                <h5>연혁</h5>
                <p>2020년 7월 개발 시작</p>
                <h5>오시는 길</h5>
                <img class="map" src="image/map.PNG">
            </fieldset>
            <fieldset>
                <legend>서비스 소개</legend>
                <p>QR코드 스캔 -> 주문 -> 결제</p>
                <p>테이블 뷰 -> 주문 내역 -> 확인/처리</p>
            </fieldset>
        </article>
    </section>
</body>
</html>