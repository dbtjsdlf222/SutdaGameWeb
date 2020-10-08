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
				<td id="post_title">제목</td>
				<td id="user_id">작성자</td>
				<td id="post_like">추천</td>
				<td id="post_date">작성일</td>
			</tr>
		<c:forEach var="post" items="${boardList} varStatus="status>
			<tr>
				<td><c:out value="${post.no}"/></td>
				<td><a href="board?no=${post.no}">${post.title}</a></td>
		        <td>${post.writerName}</td>
		        <td>${post.like}</td>
		        <td>${post.writeDate}</td>
			</tr>
		</c:forEach>
		</table>
		<a href="wirte"><input type="submit" value="글 작성" name="write"></a>
	</fieldset>
</body>
</html>