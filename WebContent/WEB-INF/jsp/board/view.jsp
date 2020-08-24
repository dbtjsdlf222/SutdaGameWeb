<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>게시물 작성</title>
</head>
<style>
    header{
        display: flex;
        padding: 20px;
    }
    h1{
        margin: auto;
    }
    input[value="로그아웃"]{
        height: 50px;
        align-items: center;
        margin-top: 10px;
        margin-right: 50px;
    }
    #write{
        margin-left:23%;
        padding-left: 50px;
        padding-top: 20px;
        text-align: center;
    }
    #title{
        margin-bottom: 20px;
        width: 800px;
        height: 30px;
    }
    #contents{
        width: 800px;
        height: 500px;
    }
    #confirm, #cancel{
    	width: 125px;
    	height: 30px;
    }
    form{
    	width:800px;
    }
    a{
    	text-decoration: none;
    }
    
</style>
<body>
    <header>
        <h1><strong>게시판</strong></h1>
        <a href="logout"><input type="submit" value="로그아웃"></a>
    </header>
    <hr size="3px"/>
    <div id="write">
         <form action="board/updateBoard">
        	<input type="text" name="title" id="title" placeholder="제목을 입력하세요." value="${post.title}">
        	<textarea id="contents" name="content" placeholder="내용을 입력하세요.">${post.content }</textarea>
        	<input type="hidden" value="${post.no }" name="no"/>
        	<input type="submit" id="confirm" value="수정">
        </form>
        		<button id="cancel" onclick="location.href='boardList'"> 뒤로가기</button>
        		<button id="cancel" onclick="location.href='board/deleteBoard?no=${post.no}'">게시글 삭제하기</button>
        	
        	
    </div>
</body>
</html>