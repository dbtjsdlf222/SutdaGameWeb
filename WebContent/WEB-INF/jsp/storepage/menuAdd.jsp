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
}
#img-view{
    margin: auto;
    padding-left: 50px;
}
#menu-info{
    color: white;
    padding-left: 100px;
}
table{
    line-height: 2em;
}
table td{
    padding-left: 10px;
}
textarea{
    width: 200px;
}
input[type="text"]{
    width: 200px;
}
select{
    width: 200px;
}
input[type="submit"]{
    background-color: midnightblue;
    color: white;
    border: 1px solid white;
    width: 150px;
    height: 30px;
}
</style>

</head>
<body>
    <form action="store/menu/upload" method="post" enctype="multipart/form-data">
        <div id="imgView"><img src="imgUpload.png" width="400px"></div>
        <div id="menu-info">
            <table>
                <tr>
                    <td>사진 선택</td>
                    <td><input type="file" value="파일 선택" name="img"><br></td>
                </tr>
                <tr>
                    <td>메뉴 명</td>
                    <td><input type="text" name="name"><br></td>
                </tr>
                <tr>
                    <td>English name</td>
                    <td><input type="text" name="eng_name"><br></td>
                </tr>
                <tr>
                    <td>카테고리</td>
                    <td>
                        <select id="menu-category" name="menu_category">
                            <option value="main">메인</option>
                            <option value="side">사이드</option>
                            <option value="liquor">주류</option>
                            <option value="option">옵션</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>가격</td>
                    <td><input type="text" name="price"><br></td>
                </tr>
                <tr>
                    <td>메뉴 소개</td>
                    <td>
                    <textarea name="description"></textarea>
                    </td>
                </tr>
            </table><br>
            <input type="submit" value="확인">
            <input type="reset" value="취소">
        </div>
    </form>
</body>
</html>