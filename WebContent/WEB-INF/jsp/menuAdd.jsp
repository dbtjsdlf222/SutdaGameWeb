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
    <form action="/store/menu/upload" method="post" enctype="multipart/form-data">
        <div id="imgView"><img src="imgUpload.png"><br></div>
        <div id="menuInfo">
            <input type="file" value="이미지 선택" name="img"><br>
            <input type="text" placeholder="음식 명" name="foodName"><br>
            <input type="text" placeholder="가격" name="price"><br>
            <select id="menu-category" name="menuCategory">
               <option value="main">메인</option>
               <option value="side">사이드</option>
            </select>
        </div>
    </form>
</body>
</html>