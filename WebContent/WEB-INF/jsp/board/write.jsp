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
        margin: auto;
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
    	width: 80px;
    	height: 30px;
    }
    form{
    	width:800px;
    	margin-left:23%;
    }
    
</style>
<body>
    <header>
        <h1><strong>게시판</strong></h1>
        <a href="logout"><input type="submit" value="로그아웃"></a>
    </header>
    <hr size="3px"/>    
    <div id="write">
         <form action="board/insertBoard">
        	<input type="text" name="title" id="title" placeholder="제목을 입력하세요.">
        	<textarea id="contents" name="content" placeholder="내용을 입력하세요."></textarea>
        	<input type="submit" id="confirm" value="확인">
        	<a href="boardList">
        		<button id="cancel">취소</button>
        	</a>
        </form>
    </div>
</body>
</html>