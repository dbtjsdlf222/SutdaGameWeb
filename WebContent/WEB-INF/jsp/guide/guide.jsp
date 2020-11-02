<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>게임 가이드</title>
    <jsp:include page="../include/rel.jsp" flush="false" />
</head>
<style>
</style>
<body>
<div id="wrapper">
	<div id="guide-wrapper">
		<iframe name="frame-header" id="frame-header" src="./guideHeader" width="100%" height="100%" frameborder="1" scrolling="no" allowtransparency="ture"></iframe>
		<iframe name="frame-menu" id="frame-menu" src="./guideMenu" width="20%" height="100%" frameborder="1"></iframe>
		<iframe name="frame-screen" id="frame-screen" src="./guideScreen" width="80%" height="100%" frameborder="1"></iframe>
	</div>
</div>
</body>
</html>