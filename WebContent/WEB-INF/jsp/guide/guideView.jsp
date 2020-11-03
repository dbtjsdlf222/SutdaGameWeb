<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>게임 가이드</title>
    <jsp:include page="../include/rel.jsp" flush="false" />
    <frameset rows="15%, 85%" frameborder="1">
		<frame src="guideHeader" scrolling="no">
		<frameset cols="15%, 85%">
			<frame src="guideMenu">
			<frame src="" name="guideScreen">
		</frameset>
	</frameset>
</head>
<body>

</body>
</html>