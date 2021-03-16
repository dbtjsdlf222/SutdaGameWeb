<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>메인 헤더</title>
    <jsp:include page="../include/rel.jsp" flush="false" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed');
html,body{
	margin:0;
	height:100%;
}
html>body{
	background:linear-gradient(-212deg, #750000 9%, #000000 44%, #6654F1 98%);
	position: relative;
	padding-top:100px;
	min-width:1400px;
	background-attachment: fixed;
}
.home{
    overflow: hidden;
    margin-top: -19px;
    transition:0.9s;
}
.container{
	padding: 0px;
}
.nav{
	position: absolute;
    padding-top: 30px;
    border-bottom: 3px solid #DB3A00;
    height: 95px;
    list-style: none;
    transition: 1s;
    overflow: hidden;
    width: 100%;
    top: 0;
    z-index: 999;
    background-color:black;
}
.nav:hover{
	height: 200px;
}
.nav:hover .home{
	margin-top:10px;
	margin-left:10px;
	height:280px;
}
.dept01{
    display: flex;
    list-style-type: none;
    text-align: center;
}
.top-menu{
    position: absolute;
    left:  305px;
    top:36px;
    width:56%;
}
.dept01>li{
	margin:0 3%;
}
.dept01 li span a{
	font-size: 21px;
	font-weight: bold;
}
.dept02{
	list-style-type: none;
    padding-left: 0px;
    margin-top: 31px;
    margin-left: -8px;
    font-size: 24px;
}
.dept02 a{
	color: #DB3A00;
	text-decoration: none;
	transition: .2s;
	font-size:16px;
}
/* .dept02 a:hover{ */
/* 	color:black; */
/* 	text-shadow: 1px 1px 8px #fff; */
/* } */
a:hover{
	text-decoration:none;
}
.dept02 li{
	align-items: center;
	padding-left: 0px;
	height:20px;
	margin-bottom: 10px;
}
.login{
    width: 120px;
    height: 40px;
    margin-right: 50px;
    text-align: center;
    float: right;
}
.login a{
    text-decoration: none;
    color: #DB3A00;
    font-size: 20px;
    font-weight: bold;
}
.join{
    width: 120px;
    height: 40px;
    margin-right: 50px;
    text-align: center;
    float: right;
}
.join a{
    text-decoration: none;
    color: #DB3A00;
    font-size: 20px;
    font-weight: bold;
}
.mypage{
	margin-right: 50px;
}
.mypage a{
	text-decoration: none;
    color: white;
    font-size: 20px;
    font-weight: bold;
}
.dept01:hover .dept02{
}
.b05_3d_roll {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
}
.b05_3d_roll div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 40px;
    padding: 10px;
    border: #000000 solid 1px;
    pointer-events: none;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
   	-moz-box-sizing: border-box;
    font-weight: bold;
    font-size: 17px;
}

.b05_3d_roll div:nth-child(1) {
    color: #000000;
    background-color: #000000;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 31% 72% -25px;
    -moz-transform-origin: 50% 50% -25px;
    border: 2px solid #fff;
}

.b05_3d_roll div:nth-child(2) {
    color: #000;
    background-color: #DB3A00;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 30% -25px;
    -webkit-transform-origin: 17;
    -moz-transform-origin: 50% 50% -25px;
}

.b05_3d_roll:hover div:nth-child(1) {
    color: #ffffff;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}

.b05_3d_roll:hover div:nth-child(2) {
    background-color: #000000;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(-90deg);
    -webkit-transform: rotateX(-90deg);
    -moz-transform: rotateX(-90deg);
}

.button_base {
    margin: 0;
    border: 0;
    font-size: 18px;
    position: relative;
    width: 200px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}
.button_base:hover {
    cursor: pointer;
}
.login_btn{
    width: 110px;
    height: 47px;
}
#login_box{
    position: absolute;
    right:10px;
    top:29px;
}
footer{
    width: 100%;
    height: 95px;
    clear: both;
    border-top: 3px solid #DB3A00;
    padding-top: 17px;
    background: black;
    bottom: 0;
}
footer p{
    text-align: center;
    color: #CACACA;
}
.write_btn{
	float:right;
	width:100px;
	height:40px;
}
</style>
</head>
	<header>
    <div class="nav">
        <div class="home"><a href="/main"><img src="/img/logo.png"></a></div>
        <div class="top-menu">
        	<ul class="dept01">
        		<li style="width:101px;"> 
        			<span><a href="/board/boardList?kind=1">공지사항</a></span>
        			<!-- <ul class="dept02">
        				<li id="notice"><a href="/board/boardList?kind=1">공지사항</a></li>
        				<li id="patch"><a href="/board/boardList?kind=2">패치노트</a></li>
        				<li id="event"><a href="/board/boardList?kind=3">이벤트</a></li>
        			</ul> -->
        		</li>
        		<li style="width:126px">
        			<span><a href="/board/boardList?kind=10">자료실</a></span>
        			<ul class="dept02">
        				<li id="guide"><a href="/guide/guideView" onclick="window.open(this.href, '_blank', 'width=1200, height=800, toolbar=no, menubar=no, scrollbars=no, resizeable=yes'); return false;">게임 가이드</a></li>
        				<li id="youtube"><a href="/board/boardList?kind=10">유튜브 영상 자료실</a></li>
        			</ul>
        		</li>
        		<li style="width:181px">
        			<span><a href="/board/boardList?kind=5">커뮤니티</a></span>
        		</li>
        		<li style="width:161px">
        			<span><a href="/board/rank">명예의 전당</a></span>
        		</li>
        		<li style="width:134px">
        			<span><a href="/download">다운로드</a></span>
        		</li>
        	</ul>
       	</div>
			<div id="login_box">
        <% if(session.getAttribute("loginInfo")==null){ %>
			  <div class="button_base b05_3d_roll login_btn" style=" position: absolute; right: 108px;" onclick="location.href='/login'">
			    <div>LOGIN</div>
			    <div>로그인</div>
			  </div>
			  <div class="button_base b05_3d_roll login_btn" onclick="location.href='/join'">
			    <div>SIGUP</div>
			    <div>회원가입</div>
			  </div> 
        <% } else { %>
        	<div class="button_base b05_3d_roll login_btn" onclick="location.href='/logout'">
			    <div>LOGOUT</div>
			    <div>로그아웃</div>
			  </div> 
        	<div class="button_base b05_3d_roll login_btn" onclick="location.href='/player/mypage'" style=" position: absolute; right: 156px;top:0">
			    <div>MYPAGE</div>
			    <div>마이페이지</div>
			  </div> 
        	<!-- <div class="mypage"><a href="/player/mypage"><img id="slide-menu" src="/img/samsun.png">마이페이지</a></div> -->
        <% } %>
			</div>
    </div>
    <jsp:include page="../include/righter.jsp" flush="false"/>
    </header>
</html>