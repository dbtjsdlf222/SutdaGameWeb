<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>소비자 페이지(카테고리)</title>
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
        list-style-type: none;
        font-size: 30px;
        color: white;
        float: left;
        margin: auto;
        margin-left: 50px;
        align-items: center;
    }
</style>
</head>
<body>
    <div class="nav">
        <a href="SetMenu" target="customerScreen"><li>Set Menu</li></a>
        <a href="SpecialMenu" target="customerScreen"><li>Special Menu</li></a>
        <a href="SignatureMenu" target="customerScreen"><li>Signature Menu</li></a>
        <a href="Chicken" target="customerScreen"><li>Chicken</li></a>
        <a href="Pasta" target="customerScreen"><li>Pasta</li></a>
        <a href="Salad" target="customerScreen"><li>Salad</li></a>
        <a href="Snack" target="customerScreen"><li>Snack</li></a>
        <a href="Soup" target="customerScreen"><li>Soup</li></a>
        <a href="Beer" target="customerScreen"><li>Beer</li></a>
        <a href="Cocktail" target="customerScreen"><li>Cocktail</li></a>
        <a href="Beverage" target="customerScreen"><li>Beverage</li></a>
    </div>
</body>
</html>