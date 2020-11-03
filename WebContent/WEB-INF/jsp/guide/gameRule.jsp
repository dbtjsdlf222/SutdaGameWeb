<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 룰</title>
</head>
<style>
body{
	background-color: #363636;
}
#rule{
	margin: 50px;
	widht: 800px;
	color: white;
	font-size: 15px;
	text-align: center;
}
#rule tr:nth-child(1){
	font-size: 30px;
}
#rule td{
	padding: 20px;
}
</style>
<body>
	<div class="ruleCon">
		<table id="rule">
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
			</tr>
			<tr>
				<td><img src="../../img/pae/Pae.png"></td>
				<td><img src="../../img/bet/Call.png"></td>
				<td><img src="../../img/pae/Pae.png">&emsp;<img src="../../img/pae/Pae.png"></td>
				<td><img src="../../img/bet/Call.png"></td>
				<td><img src="../../img/pae/1.png">&emsp;<img src="../../img/pae/2.png"></td>
				<td><img src="../../img/money.jpg" style="width: 180px; height: 200px; border-radius: 30%"></td>
			</tr>
			<tr>
				<td>1장의 패를 받습니다.</td>
				<td>베팅을 합니다.</td>
				<td>모든 사람이 Call이면<br>한 장씩 더 받습니다.</td>
				<td>최종 베팅을 합니다.<br>(남은 사람 모두 Call 할 때 까지)</td>
				<td>패를 오픈 합니다.</td>
				<td>승패를 가르고 승자가 베팅된<br>모든 돈을 가져갑니다.</td>
			</tr>
		</table>
	</div>
</body>
</html>