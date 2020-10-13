<%@page import="sutdaGame.web.vo.PlayerVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>마이 페이지</title>
    <jsp:include page="../include/rel.jsp" flush="false" />

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
.mypage{
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
	font-size: 20px;
}
.asd{
    margin: auto;
}
.infoRevise{
	width: 100px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: midnightblue;
    text-align: center;
    float: left;
}
.infoRevise a{
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-weight: bold;
}
.join_cancel{
	width: 100px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: midnightblue;
    color: white;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    float: left;
}
.subscribe{
	width: 100px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: midnightblue;
    color: white;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    float: left;
}
.subscribe_cancel{
	width: 100px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: midnightblue;
    color: white;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    float: left;
}
.storeSetButton{
	width: 150px;
    height: 50px;
    padding-top: 15px;
    border-radius: 10%;
    background-color: midnightblue;
    text-align: center;
    float: left;
}
.storeSetButton a{
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-weight: bold;
}
.customerViewButton{
	width: 150px;
    height: 50px;
    padding-top: 15px;
    border-radius: 10%;
    background-color: midnightblue;
    text-align: center;
    float: left;
}
.customerViewButton a{
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-weight: bold;
}
.qrCreate{
    width: 150px;
    height: 50px;
    padding-top: 15px;
    border-radius: 10%;
    background-color: midnightblue;
    text-align: center;
    float: left;
}
.qrCreate a{
    text-decoration: none;
    color: white;
    font-size: 20px;
    font-weight: bold;
}
.wrap1 div{
    margin-left: 15%;
    margin-bottom: 150px;
    display: block;
}
.wrap2 div{
    margin-left: 17%;
    display: block;
}
</style>
</head>
<body>
	<header>
    <div class="nav">
        <div class="home"><a href="main">QRPAY</a></div>
        <div class="mypage">마이 페이지</div>
        <div class="logout"><a href="logout">로그아웃</a></div>
    </div>
    </header>
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
        <div class="wrap1">
            <div class="infoRevise"><a href="infoRevise">정보 수정</a></div>
            <p><button type="button" class="btn btn-success btn-sm">회원 정보 수정</button></p>
            <p><button type="button" class="btn btn-danger btn-block">회원 탈퇴</button></p>
        </div>
<script>
	$("#jc").click(function(){
		var result = confirm('정말 회원 탈퇴를 하시겠습니까? \n 정보는 되돌릴 수 없습니다.'); 
		if(result) { location.replace('/player/delete'); } 
		else {  }
	})
</script>
</body>
</html>