<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>메뉴 추가</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.x-git.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
body{
    background-color: midnightblue;
    padding: 50px;
}
#img-view{
    text-align: center;
}

</style>

</head>
<body>
    <form action="upload.jsp" method="post">
        <div id="img-view"><img src="img-upload.png"><br></div>
        <div id="menu-info">
            <input type="file" value="파일 선택" name="file" enctype="multipart/form-data"><br>
            <input type="text" placeholder="음식 명"><br>
            <input type="text" placeholder="가격"><br>
            <select id="menu-category" name="menu-category"></select>
            <option value="메인">메인</option>
            <option value="사이드">사이드</option>
        </div>
    </form>
</body>
</html>