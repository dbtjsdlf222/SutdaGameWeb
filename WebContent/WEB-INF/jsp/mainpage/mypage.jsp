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
<jsp:include page="../include/header.jsp" flush="false" />
    
    <div class="profile">
    	<img src="/img/character/cha${myInfo.character}.png" />
    </div>
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
    		<td>&emsp;${myInfo.strMoney} </td>
    	</tr>
    	<tr>
    		<td>전</td>
    		<td>&emsp;${myInfo.win+myInfo.lose}</td>
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
    		<td id="winRate">&emsp;</td>
    	</tr>
    </table>
        <div class="wrap1">
            <p><button type="button" style="width:100%" class="btn btn-success btn-sm" onclick="location.href='/player/update?'">비밀번호 변경</button></p>
            <p><button type="button" style="width:100%" class="btn btn-danger btn-block" onclick="showDeletePopup()">회원 탈퇴</button></p>
        </div>
<jsp:include page="../include/footer.jsp" flush="false" />
<script type="text/javascript" src="/js/passwordCheck.js" ></script> 
<script>
	$(document).ready(function(){
		var winRate = ${(myInfo.win/(myInfo.win+myInfo.lose))*100};
		if(isNaN(winRate)){
			$("#winRate").text('0%');
		} else {
			$("#winRate").text(winRate.toFixed(1)+'%');
		}
	});

	function showDeletePopup(){
		var result = confirm('정보는 되돌릴 수 없습니다.\n 그래도 회원 탈퇴를 하시겠습니까? \n '); 
		if(result) { location.replace('/player/delete'); }
		else {  }
	}
</script>
</body>
</html>