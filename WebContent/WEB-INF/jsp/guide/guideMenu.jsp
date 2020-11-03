<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>게임 가이드 메뉴</title>
   	<jsp:include page="../include/rel.jsp" flush="false" />
</head>
<style>
.guideMenu{
	padding: 0;
	list-style: none;
	line-height: 5.0em;
	font-size: 30px;
	text-align: center;
}
.guideMenu li a{
	cursor: pointer;
}
</style>
<body>
<div class="guideMenuCon">
	<ul class="guideMenu">
		<a href="intro" target="guideScreen"><li>섯다란?</li></a>
		<a href="gameRule" target="guideScreen"><li>게임 룰</li></a>
		<a href="jokbo" target="guideScreen"><li>섯다 족보</li></a>
		<a href="betting" target="guideScreen"><li>베팅</li></a>
	</ul>
</div>
</body>
</html>