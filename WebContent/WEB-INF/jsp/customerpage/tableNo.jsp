<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>테이블 번호 입력</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.x-git.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
	input[type="text"]{
		color: midnightblue;
		font-size: 15px;
		font-weight: bold;
		width: 200px;
		height: 40px;
		text-align: center;
	}
	input[type="submit"]{
		margin-left: 20px;
		background-color: midnightblue;
		color: white;
		font-size: 15px;
		font-weight: bold;
		width: 60px;
		height: 40px;
		cursor: pointer;
	}
</style>
</head>
<body>
		<form action="tableAction" method="get">
		<input type="text" name="tableNo" placeholder="테이블 번호를 입력해주세요."><input type="submit" value="확인">
		<input type="hidden" name="storeNo">
		</form>
</body>
</html>