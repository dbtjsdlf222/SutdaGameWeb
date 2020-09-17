<%@page import="project.qrpay.vo.StoreVO"%>
<%@page import="project.qrpay.vo.OwnerVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>마이 페이지</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.x-git.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<style type="text/css">
.nav{
    display: flex;
    border-bottom: 2px solid midnightblue;
    height: 100px;
    margin: auto;
    align-items: center;
}
.home{
    margin-left: 30px;
    font-size: 50px;
    color: midnightblue;
    font-weight: bold;
    font-family: stencil;
}
.home a{
    text-decoration: none;
}
.title{
    font-size: 50px;
    font-weight: bold;
    color: midnightblue;
    display: flex;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
}
.logout{
    width: 100px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: midnightblue;
    margin-right: 50px;
    text-align: center;
}
.logout a{
    text-decoration: none;
    color: white;
    font-size: 20px;
    font-weight: bold;
}
.profile{
	margin: auto;
	margin-top: 100px;
	margin-bottom: 50px;
	width: 100px;
	height: 100px;
	background-color: midnightblue;
}
.myinfo{
	margin: auto;
	margin-bottom: 50px;
	color: midnightblue;
}
input[type="submit"]{
	width: 100px;
	height: 40px;
	background-color: midnightblue;
	color: white;
	font-weight: bold;
	font-size: 20px;
	cursor: pointer;
}
.storeSetButton{
	width: 100px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: midnightblue;
    text-align: center;
}
.storeSetButton a{
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-weight: bold;
}
</style>
</head>
<body>
	<header>
    <div class="nav">
        <div class="home"><a href="main">QRPAY</a></div>
        <div class="title">마이 페이지</div>
        <div class="logout"><a href="logout">로그아웃</a></div>
    </div>
    </header>
	<% OwnerVO ownerInfo=(OwnerVO)request.getAttribute("myInfo"); %>
	<% StoreVO storeInfo=(StoreVO)request.getAttribute("storeInfo"); %>
    <div class="profile"></div>
    <div class="myinfo">
    <table>
    	<tr>
    		<td>이름</td>
    		<td><%=ownerInfo.getName() %></td>
    	</tr>
    	<tr>
    		<td>이메일</td>
    		<td><%=ownerInfo.getEmail() %></td>
    	</tr>
    	<tr>
    		<td>전화번호</td>
    		<td><%=ownerInfo.getPhone() %></td>
    	</tr>
    	<tr>	
    		<td>가게이름</td>
    		<td><%=storeInfo.getStoreName() %></td>
    	</tr>
    	<tr>
    		<td>가게주소</td>
    		<td><%=storeInfo.getAddress() %></td>
    	</tr>
    </table>
    	<div class="infoRevise"><input type="submit" value="정보 수정"></span>
    </div>
    <div class="storeSetButton"><a href="/store/">매장 관리</a></div>
</body>
</html>