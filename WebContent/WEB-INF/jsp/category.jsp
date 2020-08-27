<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>매장 관리 페이지(카테고리)</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.x-git.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
    body{
        background-color: midnightblue;
    }
    .nav a{
        text-decoration: none;
    }
    .nav li{
        margin-top: 150px;
        margin-bottom: 150px;
        list-style-type: none;
        font-size: 30px;
        color: white;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="nav">
        <a href="menuSet" target="screen"><li>메뉴 관리</li></a>
        <a href="salesSet" target="screen"><li>매출 관리</li></a>
        <a href="employeeSet" target="screen"><li>직원 관리</li></a>
    </div>
</body>
</html>