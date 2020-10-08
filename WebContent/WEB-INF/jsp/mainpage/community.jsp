<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>커뮤니티</title>
    <jsp:include page="../include/rel.jsp" flush="false" />
</head>
<style>
	
</style>
<body>
	<jsp:include page="header.jsp" flush="false"/>
	<fieldset>
		<legend>커뮤니티</legend>
		<table>
			<tr>
				<td id="post_no">No.</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
		</table>
	</fieldset>
</body>
</html>