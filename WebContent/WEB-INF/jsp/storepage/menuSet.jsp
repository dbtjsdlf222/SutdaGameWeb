<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>메뉴 관리</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.x-git.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
body{
    background-color: midnightblue;
    text-align: center;
    align-items: center;
}
#menuAdd{
    width: 200px;
    height: 190px;
    background-color: white;
    font-size: 100px;
    color: midnightblue;
    padding: 30px;
}
a{
    text-decoration: none;
}
</style>
</head>
<body>
    <div id="menuAdd"><a href="menuAdd" target="screen">+</a></div>
</body>
</html>