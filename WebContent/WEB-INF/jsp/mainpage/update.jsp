<%@page import="sutdaGame.web.vo.PlayerVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>회원 정보 수정</title>
</head>
<style>
body{
	background-color: #363636;
}
.myinfo{
	margin: auto;
	margin-top: 100px;
	color: #DB3A00;
}
</style>
<body onload="window.resizeTo(500,700)">
<div class="profile"></div>
    <table class="myinfo">
    	<tr>
    		<td>닉네임</td>
    		<td>&emsp;${myInfo.nickname }</td>
    	</tr>
    	<tr>
    		<td>가입자 명</td>
    		<td>&emsp;${myInfo.name }</td>
    	</tr>
	    <tr>
    		<td>아아디</td>
    		<td>&emsp;${myInfo.id} </td>
    	</tr>
    	<tr>
    		<td>이메일</td>
    		<td>&emsp;${myInfo.email} </td>
    	</tr>
    	<tr>
    		<td>머니</td>
    		<td>&emsp;${myInfo.money} </td>
    	</tr>
    	<tr>
    		<td>전</td>
    		<td>&emsp;;${myInfo.win+myInfo.lose}</td>
    	</tr>
    	<tr>
    		<td>승</td>
    		<td>&emsp;${myInfo.win} </td>
    	</tr>
    	<tr>
    		<td>패</td>
    		<td>&emsp;${myInfo.lose} </td>
    	</tr>
    	<tr>
    		<td>승률</td>
    		<td>&emsp;${(myInfo.win/(myInfo.win+myInfo.lose))*100} }</td>
    	</tr>
    	<tr>
    		<td>캐릭터</td>
    		<td>&emsp;<img src="/img/character/cha${myInfo.character} .png" /></td>
    	</tr>
    </table>
</body>
</html>