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
.guideMenuCon{
	list-style: none;
}
</style>
<body>
<div class="guideMenuCon">
	<ul class="guideMenu">
		<li>섯다란?</li>
		<li>게임 룰</li>
		<li>섯다 족보</li>
		<li>베팅</li>
	</ul>
</div>
</body>
</html>