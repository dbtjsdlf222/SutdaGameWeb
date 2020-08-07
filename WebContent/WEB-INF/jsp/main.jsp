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

    <link href="css/main/main.css" rel="stylesheet" type="text/css">
    <script>
        $(function(){
            $(".payinfo").mouseleave(function(){
                $(".payment").fadeIn(500, "swing");
            })
            $(".payment").mouseenter(function(){
                $(this).fadeOut(1500, "swing");
            });
        });
    </script>
</head>
<body> 
    <header id="container">
        <h1><a href="/">QRPAY</a></h1>
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
    <br><br><br>
    <section>
        <article>
            <h3>QR코드로 간편하게 주문하고 결제하자!</h3>
            <img class="payment" src="img/payment.PNG">
            <br><br><br><br><br><br><br>
            <dl class="payinfo">
                <dt>QR페이로 모든걸 해결!</dt>
                <dd>테이블에 있는 QR코드를 스마트폰으로 스캔 해 보세요</dd>
            </dl>
        </article>
    </section>
    <footer>
        <p></p>
        <p>서울특별시 구로구 디지털로 306 2층(구로동 182-13, 대륭포스트타워2차)<br/>
        전화번호: 010-5716-0288 / E-mail: asino0226@gmail.com<br/>
        Copyrightⓒ2020QRPAY.All rights reserved.</p>
    </footer>
</body>
</html>