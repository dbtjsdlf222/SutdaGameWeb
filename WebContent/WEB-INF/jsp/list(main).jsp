<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>DatePlanner</title>
    <style>
        body{
            background-color: #F2F4F7;
        }

        #search_wrap{
            position: relative;
            padding-bottom: 50px;
        }

        #search_box{
            width: 95%;
            position: absolute;
            display: inline-block;
        }

        .input-group-btn{
            width: 5%;
            float: right;
        }

        #myCarousel{
            display: inline-block;
            width: 65%;
        }

        #login_box{
            float: right;
            width: 30%;
        }

        #login_info{
            width: 100%;
            display: inline;
        }

        #login_btn{
            width: 100%;
            height: 100%;
            display: inline;
        }

        #join{
            width: 100%;
            height: 100%;
            display: inline;
        }

        #preview_box{
            width: 100%;
            height: 350px;
        }

        table tr th{
            text-align: center;
        }

        table tr td{
            height: 50px;
        }

        table tbody tr:hover{
            background-color: #d6d8db;
        }

        .no{
            width: 10%;
        }

        #new_list{
            float: left;
            width: 50%;
            height: 100%;
            overflow: hidden;
        }

        #popular_list{
            float: left;
            width: 50%;
            height: 100%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse">
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

<div class="container">
    <form action="#">
        <div id="search_wrap" class="form-group">
            <div id="search_box">
                <input type="text" class="form-control" name="search" placeholder="게시물 검색">
            </div>

            <div class="input-group-btn">
                <button type="submit" class="btn btn-info"><i class="fas fa-search"></i></button>
            </div>
        </div>
    </form>

    <div id="head_wrap" class="row">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">

                <div class="item active">
                    <img src="img/la.jpg" alt="Los Angeles" style="width:100%;">
                    <div class="carousel-caption">
                        <h3>Los Angeles</h3>
                        <p>LA is always so much fun!</p>
                    </div>
                </div>

                <div class="item">
                    <img src="img/chicago.jpg" alt="Chicago" style="width:100%;">
                    <div class="carousel-caption">
                        <h3>Chicago</h3>
                        <p>Thank you, Chicago!</p>
                    </div>
                </div>

                <div class="item">
                    <img src="img/ny.jpg" alt="New York" style="width:100%;">
                    <div class="carousel-caption">
                        <h3>New York</h3>
                        <p>We love the Big Apple!</p>
                    </div>
                </div>

            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div id="login_box" class="input-group" style="display: inline-block">
            <form action="#">
                <div id="login_info" style="display: inline-block">
                    <input type="text" class="form-control" placeholder="아이디">
                    <input type="password" class="form-control" placeholder="비밀번호">
                </div>
            </form>

            <div>
                <button id="login_btn" class="btn btn-default" type="submit">로그인</button>
                <button id="join" class="btn btn-default"><a href="#"></a>회원가입</button>
            </div>

            <br>
            <div id="api_login_box">
                <a id="naver_login" href="#"><img src="img/네이버 아이디로 로그인_완성형_Green.PNG" height="70px" width="100%"/></a>
                <a id="facebook_login" href="#"><img src="img/facebook.png" height="70px" width="100%"/></a>
            </div>
        </div>
    </div>

    <div id="preview_box" style="text-align: center; padding-top: 15px">
        <div id="new_list">
            <h3 id="new_info">최신게시물</h3>
            <table class="table">
                <thead>
                <tr>
                    <th class="no">번호</th>
                    <th class="title">제목</th>
                    <th class="writer">글쓴이</th>
                    <th class="w_date">날짜</th>
                    <th class="like">추천수</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td>7894</td>
                    <td>우우우우우우우</td>
                    <td>다팬다</td>
                    <td>18-04-08 05:56</td>
                    <td>79845</td>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="popular_list" style="border-left: 2px solid #DDDDDD">
            <h3 id="popular_info">인기게시물</h3>
            <table class="table">
                <thead>
                <tr>
                    <th class="no">번호</th>
                    <th class="title">제목</th>
                    <th class="writer">글쓴이</th>
                    <th class="w_date">날짜</th>
                    <th class="like">추천수</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td>7894</td>
                    <td>우우우우우우우</td>
                    <td>다팬다</td>
                    <td>18-04-08 05:56</td>
                    <td>79845</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>