<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>우측 내비</title>
</head>
<style>
.wrap{
    position: absolute;
    right: 200px;
}
#playBox{
	margin: 10px;
	background-color: #363636;
	color: #DB3600;
	text-align: center;
	padding: 20px;
}
#playBox ul li{
	list-style: none;
	float: left;
	display: flex;
	width: 100px;
	margin-right: 30px;
	cursor: pointer;
}
#startGame{
	margin: 0px;
	height: 100px;
	padding: 25px;
	border: 1px solid #DB3600;
	font-size: 30px;
	margin-bottom: 10px;
	cursor: pointer;
	transition: 1s;
}
#startGame:hover{
	background: linear-gradient(120deg, red 0%, black 50%, blue 100%);
}
#loginBox{
	margin: 10px;
	background-color: #363636;
	color: #DB3600;
	text-align: center;
	padding: 20px;
}
#login{
	margin: 0px;
	height: 100px;
	padding: 25px;
	border: 1px solid #DB3600;
	font-size: 30px;
	margin-top: 10px;
	cursor: pointer;
}
#login:hover{
	background: linear-gradient(120deg, red 0%, black 50%, blue 100%);
}
</style>
<body>
	<div class="wrap">
		<div id="playBox">
			<div id="startGame">게임 시작</div>
			<ul>
				<li onclick="location.href='download'">게임 다운로드</li>
				<li onclick="location.href='board/boardList?kind=4'">게임 가이드</li>
			</ul>
		</div>
		<div id="loginBox">
			<div>로그인 후 이용 가능합니다.</div>
			<div id="login" onclick="location.href='/login'">로그인</div>
		</div>
		<div id="newsBox">
			
		</div>
	</div>
</body>
</html>