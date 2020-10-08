<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>고객센터</title>
    <jsp:include page="../include/rel.jsp" flush="false" />
</head>
<style>
fieldset{
	margin-top: 100px;
    margin-left: 100px;
    margin-right: 100px;
    width: auto;
    height: auto;
    padding: 50px;
    border: 1px solid midnightblue;
}
legend{
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    color: midnightblue;
}
table{
    border: 1px solid #eeeeee;
    background-color: #eeeeee;
    text-align: center;
    width: 1600px;
    font-size: 15px;
}
#post_no{
    width: 5%;
    background-color: #dddddd;
    font-weight: bold;
}
#post_title{
    width: 70%;
    background-color: #dddddd;
    font-weight: bold;
}
#user_id{
    width: 15%;
    background-color: #dddddd;
    font-weight: bold;
}
#post_date{
    width: 10%;
    background-color: #dddddd;
    font-weight: bold;
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
    cursor: pointer;
}

.FQ_title,.FQ_content{
	width: 1600px;
	 height:30px;
	 padding:10px;
}

.FQ_title {
	 background-color: #e0e0e0;
	 margin-top:20px;
}
.FQ_content{
	background-color: gray;
}
</style>
<body>
	<jsp:include page="header.jsp" flush="false"/>
	
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
        
        <fieldset>
            <legend>자주 하는 질문</legend>
        <div id="boardList">
		<c:forEach var="post" items="${FQboardList}" varStatus="status">
			 <div class="FQ_title"><c:out value="${post.title}"/></div>
			 <div class="FQ_content"><c:out value="${post.content}"/></div>
		</c:forEach>
  		</div>		
       </fieldset>
    </div>
	
</body>
</html>