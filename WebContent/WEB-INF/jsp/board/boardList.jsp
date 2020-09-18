<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>게시판</title>
</head>
<style>
fieldset{
	margin-top: 150px;
    margin-left: 100px;
    margin-right: 100px;
    width: auto;
    height: auto;
    padding: 50px;
}
legend{
    text-align: center;
    font-size: 20px;
    font-weight: bold;
}
table{
    border: solid 1px black;
    text-align: center;
    padding: 5px;
    width: 1600px;
}
#post_no{
    width: 5%;
    border-bottom: solid 1px black;
    padding-bottom: 5px;
}
#post_title{
    width: 70%;
    border-left: solid 1px black;
    border-bottom: solid 1px black;
    padding-bottom: 5px;
}
#user_id{
    width: 15%;
    border-left: solid 1px black;
    border-bottom: solid 1px black;
    padding-bottom: 5px;
}
#post_date{
    width: 10%;
    border-left: solid 1px black;
    border-bottom: solid 1px black;
    padding-bottom: 5px;
}

input[value="글 작성"]{
	width: 100px;
	height: 40px;
	color: white;
	font-size: 15px;
    font-weight: bold;
    border-radius: 10%;
	background-color: midnightblue;
    float: right;
    margin-top: 10px;
}
</style>
<body>
    <jsp:include page="../mainpage/header.jsp" flush="false" />
    <div id="boardList">
        <fieldset>
            <legend>게시판 목록</legend>
            <table>
                <tr>
                    <td id="post_no">No.</td>
                    <td id="post_title">제목</td>
                    <td id="user_id">작성자</td>
                    <td id="post_date">작성일</td>
                </tr>
			<c:forEach var="post" items="${boardList}" varStatus="status">
                <tr>
                    <td><c:out value="${post.no}"/></td>
                    <td><a href="board?no=${post.no}">${post.title}</a></td>
                    <td>${post.writerName}</td>
                    <td>${post.writeDate}</td>
                </tr>
			</c:forEach>
            </table>         
            <a href="write"><input type="submit" value="글 작성" name="write"></a>
        </fieldset>
    </div>
</body>
</html>