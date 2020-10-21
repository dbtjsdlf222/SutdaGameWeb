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
	color: white;
}
ul li{
	list-style: none;
	font-size: 20px;
}
input[type="text"], input[type="password"]{
	background-color: #363636;
	color: white;
	width: 300px;
	height: 30px;
}
</style>
<body onload="window.resizeTo(750,600)">
	<form action="/updateAction" method="post" autocomplete="off">
		<ul>
			<li>닉네임</li>
			<li><input name="updateNick" type="text" placeholder="변경할 닉네임을 입력하세요"></li>
		</ul>
		<ul>
			<li>비밀번호</li>
			<li><input name="updatePW" type="password" placeholder="변경할 비밀번호를 입력하세요"></li>
			<li><input name="updatePWC" type="password" placeholder="변경할 비밀번호 확인"></li>
		</ul>
		<ul>
			<li>캐릭터</li>
			<table>
				<tr>
					<% for(int i=0; i<=6; i++){ %>
					<td>
						<label for="cha<%=i%>"><img src="/img/character/cha<%=i%>.png" /></label>
					</td>
					<%}  %>
				</tr>
				<tr>
				<% for(int i=0; i<=6; i++){ %>
					<td>
						<input type="radio" id="cha<%=i %>" name="updateCha" class="character" required style="margin-left:40%">
					</td>
				<%} %>
				</tr>
			</table>
		</ul>
		<div id="confirm">
			<input type="submit" value="변경">&emsp;
			<input type="reset" value="취소">
		</div>
	</form>
</body>
<script>
	
</script>
</html>