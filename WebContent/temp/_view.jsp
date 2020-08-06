<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            background-image: url("../../img/${post.image}");
            background-position: center;
            background-repeat: no-repeat;
            background-color: dimgray;
            text-align: center;
            font-weight: bold;
            color: white;
            line-height: 500px;
            font-size: 30px;
            z-index: -1;
            opacity: .8;
        }

        .content{
            text-align: center;
            padding-top: 50px;
        }

        .sentenceContent{
            display: inline-block;
            margin-top: 10px;
            position: relative;
            width: 700px;
            font-weight: bold;
            font-size: 18px;
        }

        .container-fluid{
            background-color: white;
            text-align: center;
        }

        /*리모콘css시작*/
        #remocon{
            position: fixed;
            margin-left: 85%;
            margin-top: 20%;
            border: 1.5px solid #909090;
            width: 200px;
            height: 300px;
            z-index: 5;
            background-color: #f9f9f9;
        }

        #r_Head{
            height: 10%;
            text-align: center;
            padding: 5px;
            background-color: #c2c2c2;
            opacity: .8;
            border-bottom: 1px solid #9f9f9f;
        }

        #placePick{
            /*border:2px solid #00B8D4;*/
            height: 70%;
        }

        #placePick ul{
            /*position: absolute;*/
            width: 100%;
            height: 0;
            padding-top: 3px;
            margin-left: -18px;
            list-style: none;
            text-align: center;
        }

        #placePick ul li a{
            display: block;
            text-decoration: none;
            width: 156px;
            height: 20px;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            /*color: black;*/
        }

        #directionBar{
            border-top: 1px solid #9f9f9f;
            background-color: #c2c2c2;
            padding-bottom: 10px;
            position: relative;
            height: 20%;
        }

        #previous{
            display: inline-block;
            position: relative;
            text-align: center;
            font-size: 3em;
            height: 100%;
            width: 50%;
            color: black;
        }

        #previous a{
            color: #64686f;
        }

        #next{
            /*border: 2px solid black;*/
            display: inline-block;
            position: absolute;
            text-align: center;
            font-size: 3em;
            height: 100%;
            width: 50%;
        }

        #next a{
            color: #64686f;
        }
        /*리모콘끝*/

    </style>
</head>
<body>
<nav class="navbar navbar-inverse" data-spy="affix">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">DatePlanner</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span>
                회원가입</a></li>

            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
                로그인 <span class="glyphicon glyphicon-log-in"></span></a>

                <ul class="dropdown-menu">
                    <li><a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=tOzxSVFgBuq1ArjsmwsD&state=STATE_STRING&redirect_uri=http://localhost/main.jsp">
                        네이버 로그인</a></li>
                    <li><a href="#">페이스북 로그인</a></li>
                    <li><a href="#">구글 로그인</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<div id="remocon">

    <div id="r_Head">
        <strong>리모콘</strong>
    </div>

    <div id="placePick">
        <ul>
            <li><a href="#1">부산가즈아아아아아아아asdasda</a></li>
            <li><a href="#2">부산 가즈아아아아</a></li>
            <li><a href="#3">부산 가즈아아아아</a></li>
            <li><a href="#4">부산 가즈아아아아</a></li>
            <li><a href="#5">부산 가즈아아아아</a></li>
            <li><a href="#6">부산 가즈아아아아</a></li>
            <li><a href="#7">부산 가즈아아아아</a></li>
            <li><a href="#8">부산 가즈아아아아</a></li>
            <li><a href="#9">부산 가즈아아아아</a></li>
            <li><a href="#10">부산 가즈아아아아</a></li>
        </ul>

    </div>
    <div id="directionBar">
        <div id="previous" title="이전 장소로">
            <a href="#"><i class="fas fa-arrow-alt-circle-left"></i></a>
        </div>
        <div id="next" title="다음 장소로">
            <a href="#"><i class="fas fa-arrow-alt-circle-right"></i></a>
        </div>
    </div>
</div>


<div class="parallex">
    <p>${post.title}</p>
</div>

<div class="container-fluid">

    <div class="content">

        <div class="sentenceContent">
        	${post.content}
        </div>

    </div>

</div>

<script src="css/js/jquery.js"></script>

<script>
    var window = $(window);

    $(window).scroll(function () {
        if ($(window).scrollTop()/2 < 500) {
            $('.parallex').css('top', $(window).scrollTop() / 2);
        } //if
    });

</script>

</body>
</html>