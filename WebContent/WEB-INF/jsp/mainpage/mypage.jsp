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
.profile{
	margin: auto;
	margin-top: 100px;
	margin-bottom: 50px;
	width: 100px;
	height: 100px;
	background-color: #DB3A00;
}
.myinfo{
	margin: auto;
	margin-bottom: 50px;
	color: #DB3A00;
	font-size: 20px;
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
<jsp:include page="header.jsp" flush="false" />
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
            <p><button type="button" class="btn btn-success btn-sm">회원 정보 수정</button></p>
            <p><button type="button" class="btn btn-danger btn-block" onclick="showPopup2();">회원 탈퇴</button></p>
        </div>
<script>
	$("#jc").click(function(){
		var result = confirm('정말 회원 탈퇴를 하시겠습니까? \n 정보는 되돌릴 수 없습니다.'); 
		if(result) { location.replace('/player/delete'); } 
		else {  }
	})
	
	$(".btn.btn-success.btn-sm").click(function showPopup1(){
		window.open("/update", "a", "left=800, top=300");
	})
</script>
</body>
</html>