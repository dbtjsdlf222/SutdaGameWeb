<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베팅 방법</title>
</head>
<style>
body{
	background-color: #363636;
}
.betCon{
	margin: 50px;
	font-size: 18px;
	color: white;
	text-align: center;
}
.betCon tr td{
	padding: 20px;
}
.betCon tr td:nth-child(2){
	font-size: 35px;
	font-weight: bold;
}
</style>
<body>
	<div class="betCon">
		<table>
			<tr>
				<td><img src="../../img/bet/Call.png"></td>
				<td>콜</td>
				<td><strong>앞 사람이 베팅한 금액만큼</strong> 베팅합니다.</td>
			</tr>
			<tr>
				<td><img src="../../img/bet/Bbing.png"></td>
				<td>삥</td>
				<td><strong>기본 판돈 만큼</strong> 베팅합니다.</td>
			</tr>
			<tr>
				<td><img src="../../img/bet/Die.png"></td>
				<td>다이</td>
				<td>베팅하지 않고, <strong>이번 판을 포기</strong>합니다.</td>
			</tr>
			<tr>
				<td><img src="../../img/bet/Check.png"></td>
				<td>체크</td>
				<td>베팅하지 않고, <strong>다음 순서로 넘깁니다.</strong></td>
			</tr>
			<tr>
				<td><img src="../../img/bet/Ddadang.png"></td>
				<td>따당</td>
				<td><strong>앞 사람이 베팅한 금액의 두 배</strong>를 베팅합니다.</td>
			</tr>
			<tr>
				<td><img src="../../img/bet/Half.png"></td>
				<td>하프</td>
				<td><strong>앞 사람이 베팅한 금액과 전체 판돈의 1/2을 추가</strong>로 베팅합니다.</td>
			</tr>
			<tr>
				<td><img src="../../img/bet/Quater.png"></td>
				<td>쿼터</td>
				<td><strong>앞 사람이 베팅한 금액과 전체 판돈의 1/4을 추가</strong>로 베팅합니다.</td>
			</tr>
			<tr>
				<td><img src="../../img/bet/Allin.png"></td>
				<td>올인</td>
				<td><strong>보유하고 있는 머니를 모두 베팅</strong>합니다. <br>(상대방과 보유한 머니가 다른 경우, 보유머니가 가장 적은 사람의 보유머니만큼 베팅합니다.)</td>
			</tr>
		</table>
	</div>
</body>
</html>