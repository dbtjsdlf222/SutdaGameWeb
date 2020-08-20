<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>로그인 페이지</title>
    <script src='js/jquery-3.5.1.min.js'></script>
    <script src='js/jquery-migrate-1.4.1.min.js'></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="login.js" defer></script>
    <link href="login.css" rel="stylesheet" type="text/css">
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
    <br><br><h1>QRPAY</h1>
    <div class="tab">
        <ul class="tabs">
            <li data-tab-target="#user" class="active tab">회원 로그인</li>
            <li data-tab-target="#unuser" class="tab">비회원 로그인</li>
        </ul><br><br/>
        <div class="tab-content">
            <div id="user" data-tab-content class="active">
                <form>
                    <span class="id"><input type="text" name="id" class="user_id" value="" placeholder="아이디를 입력하세요."></span><br><br/>
                    <span class="pw"><input type="password" name="pw" class="user_pw" value="" placeholder="비밀번호를 입력하세요."></span><br><br/>
                    <span class="login_sub"><input type="submit" value="로그인"></span>
                </form>
                <ul>
                    <li class="join"><a href="join.html" id="user_join">회원가입</a></li>
                    <li class="idsearch"><a href="#" id="id_search">아이디 찾기</a></li>
                    <li class="pwsearch"><a href="#" id="pw_search">비밀번호 찾기</a></li>
                </ul>
            </div>
            <div id="unuser" data-tab-content>
                <form>
                    <textarea>
1. 서비스에 가입되어 있는 소상공인 분들은 회원으로 로그인 해주세요.
2. 비회원 로그인 시 홈페이지의 서비스 이용에 제한이 있습니다.
3. 게시판에 글 작성은 가능하지만 비밀글 작성은 불가합니다.
                    </textarea><br>
                    <label class="checkbox"><input type="checkbox" id="agree"><b>비회원 체크리스트를 확인했습니다.</b></label><br><br/>
                    <span class="login_sub"><input type="submit" value="비회원 로그인"></span>
                </form>
            </div>
        </div>
    </div>
</body>
</html>