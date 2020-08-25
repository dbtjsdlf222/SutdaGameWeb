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
    <script>
    const tabs = document.querySelectorAll('[data-tab-target]')
    const tabContents = document.querySelectorAll('[data-tab-content]')
        tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            const target = document.querySelector(tab.dataset.tabTarget)
            tabContents.forEach(tabContent => {
                tabContent.classList.remove('active')
            })
            tabs.forEach(tab => {
                tab.classList.remove('active')
            })
            tab.classList.add('active')
            target.classList.add('active')
        })
    })
    </script>
<style>
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
header{
    margin-bottom: 100px;
}
.login a{
    text-decoration: none;
    color: white;
    font-size: 20px;
    font-weight: bold;
}
.tab{
    text-align: center;
    color: midnightblue;
}
input[type="text"]{
    width: 380px;
    height: 40px;
    padding-left: 10px;
}
input[type="password"]{
    width: 380px;
    height: 40px;
    padding-left: 10px;
}
input[type="submit"]{
    width: 400px;
    height: 40px;
    background-color: midnightblue;
    color: white;
    font-weight: bold;
    font-size: 20px;
    cursor: pointer;
}
form{
    position: relative;
}
.tab ul{
    list-style-type: none;
}
.login-option a{
    text-decoration: none;
    color: midnightblue;
}
.login-option{
    padding: 0px;
}
textarea{
    width: 600px;
    height: 300px;
    padding: 20px;
    line-height: 2em;
    border-radius: 5%;
}
[data-tab-content]{
    display: none;
}
.active[data-tab-content]{
    display: block;
}
.tab.active{
    color: midnightblue;
    font-weight: bold;
}
.tabs{
    cursor: pointer;
    justify-content: space-around;
    padding: 0px;
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

    <div class="tab">
        <ul class="tabs">
            <span data-tab-target="#user" class="active tab">회원 로그인</span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <span data-tab-target="#unuser" class="tab">비회원 로그인</span>
        </ul>
        <div class="tab-content">
            <div id="user" data-tab-content class="active">
                <form>
                    <span class="id"><input type="text" name="id" class="user_id" placeholder="아이디를 입력하세요."></span><br><br>
                    <span class="pw"><input type="password" name="pw" class="user_pw" placeholder="비밀번호를 입력하세요."></span><br><br>
                    <span class="login-sub"><input type="submit" value="로그인"></span>
                </form>
                <ul class="login-option">
                    <span class="join"><a href="join">회원가입</a></span>&emsp;&emsp;&emsp;
                    <span class="id-search"><a href="#">아이디 찾기</a></span>&emsp;&emsp;&emsp;
                    <span class="pw-search"><a href="#">비밀번호 찾기</a></span>
                </ul>
            </div>
            <div id="unuser" data-tab-content>
                <form>
                    <textarea>
1. 비회원 로그인 시 홈페이지의 서비스 이용에 제한이 있습니다.
2. 서비스에 가입되어 있는 소상공인 분들은 회원로그인을 이용해 주시기 바랍니다.
3. Q&A게시판 이용 시 임시 비밀번호를 통해 이용해 주시기 바랍니다.
4. 비회원 로그인 후 작성하는 글들은 모두 공개설정 됩니다.
5. =====================================================================
6. =====================================================================
7. =====================================================================
8. =====================================================================
9. =====================================================================
10. ====================================================================
11. ====================================================================
12. ====================================================================
                    </textarea><br>
                    <label class="checkbox"><input type="checkbox" id="agree"><b>비회원 체크리스트에 동의합니다.</b></label><br>
                    <span class="login-sub"><input type="submit" value="로그인"></span>
                </form>
            </div>
        </div>
    </div>
</body>
</html>