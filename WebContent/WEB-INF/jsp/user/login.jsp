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
    <title>DatePlanner</title>
    <style>
        #login_box{
            text-align: center;
        }
        #id{
            font-size: large;
            height: 50px;
            width: 50%;
        }
        #password{
            font-size: large;
            height: 50px;
            width: 50%;
        }
    </style>
</head>
<body>

<jsp:include page="../include/nav.jsp" />
 
<div class="container">
    <div id="jumbotron_wrap" style="padding-top: 15%">
        <div class="jumbotron">
            <h1 style="text-align: center">DatePlanner</h1>
            <div id="login_box">
                <form id="loginForm" action="doLogin" method="post">
                    <input type="text" name="id" id="id" placeholder="아이디" required>
                    <input type="password" name="password" id="password" placeholder="비밀번호" required>

                    <div style="padding-top: 15px">
                        <button class="btn btn-info" style="width: 50%; height: 50px">로그인</button>
                    </div>
                </form>
                <a href="../user/join"><button class="btn btn-info" style="width: 50%; height: 50px">회원가입</button></a>
            </div>
        </div>
    </div>
</div>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="../js/sha512.js"></script>
<script>
    var $password = $('#password');
    $('#loginForm').submit(function(e) { $password.val(sha512($password.val())); }); /* 비밀번호 암호화 */
</script>

</body>
</html>