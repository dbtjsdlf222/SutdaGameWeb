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
    <jsp:include page="../mainpage/header.jsp" flush="false" />
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