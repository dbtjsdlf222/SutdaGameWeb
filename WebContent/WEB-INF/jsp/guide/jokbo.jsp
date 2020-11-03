<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>족보</title>
</head>
<style>
body{
	background-color: #363636;
}
.asd{
	padding: 20px;
}
.paeCon{
	margin: 50px;
}
.paeCon table tr:nth-child(1){
	font-size: 25px;
	font-weight: bold;
	text-align: center;
	color: white;
}
p{
	font-size: 18px;
	color: white;
}
.jokboCon{
	margin: 50px;
	text-align: center;
}
.jokboCon td:nth-child(2){
	font-size: 30px;
	font-weight: bold;
}
.jokboCon td:nth-child(4){
	font-size: 30px;
	margin: 20px;
	font-weight: bold;
}
.jokboCon td:nth-child(5){
	font-size: 18px;
}
.jokboCon td{
	font-size: 15px;
	font-weight: normal;
	padding: 10px;
	color: white;
}
.specialCon{
	margin: 50px;
	color: white;
	text-align: center;
}
.specialCon td:nth-child(1){
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}
.specialCon td:nth-child(2){
	font-size: 30px;
	font-weight: bold;
}
.specialCon td:nth-child(4){
	font-size: 30px;
	margin: 20px;
	font-weight: bold;
}
.specialCon td:nth-child(5){
	font-size: 18px;
}
.specialCon td{
	font-size: 15px;
	font-weight: normal;
	padding: 10px;
	color: white;
}
</style>
<body>
<div class="asd">
	<div class="paeCon">
		<table>
			<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
			<td>7</td>
			<td>8</td>
			<td>9</td>
			<td>10</td>
			</tr>
			<tr>
			<td><img src="../../img/pae/1.png"></td>
			<td><img src="../../img/pae/2.png"></td>
			<td><img src="../../img/pae/3.png"></td>
			<td><img src="../../img/pae/4.png"></td>
			<td><img src="../../img/pae/5.png"></td>
			<td><img src="../../img/pae/6.png"></td>
			<td><img src="../../img/pae/7.png"></td>
			<td><img src="../../img/pae/8.png"></td>
			<td><img src="../../img/pae/9.png"></td>
			<td><img src="../../img/pae/10.png"></td>
			</tr>
			<tr>
			<td><img src="../../img/pae/1.5.png"></td>
			<td><img src="../../img/pae/2.5.png"></td>
			<td><img src="../../img/pae/3.5.png"></td>
			<td><img src="../../img/pae/4.5.png"></td>
			<td><img src="../../img/pae/5.5.png"></td>
			<td><img src="../../img/pae/6.5.png"></td>
			<td><img src="../../img/pae/7.5.png"></td>
			<td><img src="../../img/pae/8.5.png"></td>
			<td><img src="../../img/pae/9.5.png"></td>
			<td><img src="../../img/pae/10.5.png"></td>
			</tr>
		</table>
		<p>섯다에서 사용되는 패는 1월부터 10월 까지의 패 중 피를 제외한 두 장씩 총 20장 입니다.<br>이 20장으로 정해진 족보의 우선순위를 가려 겨루게 됩니다.</p>
		<p><strong>게임 진행 중에 오른쪽 하단에 내가 가지고 있는 패로 만들 수 있는 족보가 표시됩니다.</strong></p><br><br>
	</div>
		
	<p style="font-size:35px;"><strong>족보</strong></p>
	<p>점수가 높은 순서대로 입니다.<br>특수 족보는 제일 아래에 있습니다.</p>
	<div class="jokboCon">
		<table>
			<tr>
				<td><img src="../../img/pae/3.png">&emsp;<img src="../../img/pae/8.png"></td>
				<td></td>
				<td></td>
				<td>삼팔광땡</td>
				<td>삼광과 팔광으로 이루어진<br><strong>섯다 최강의 족보입니다.</strong></td>
			</tr>
			<tr>
				<td><img src="../../img/pae/1.png"></td>
				<td>+</td>
				<td><img src="../../img/pae/3.png">&emsp;<img src="../../img/pae/8.png"></td>
				<td>광땡</td>
				<td>광으로만 이루어진<br><strong>삼팔광땡 다음으로 좋은 족보입니다.</strong></td>
			</tr>
			<tr>
				<td><img src="../../img/pae/10.png">&emsp;<img src="../../img/pae/10.5.png"></td>
				<td>></td>
				<td><img src="../../img/pae/1.png">&emsp;<img src="../../img/pae/1.5.png"></td>
				<td>땡</td>
				<td>같은 월의 조합입니다.<br><strong>월의 숫자가 높을수록 높은 점수</strong>를 가지고 있습니다.<br>(10월은 '장땡'이라고 불립니다.)</td>
			</tr>
			<tr>
				<td><img src="../../img/pae/1.png">&emsp;<img src="../../img/pae/1.5.png"></td>
				<td>+</td>
				<td><img src="../../img/pae/2.png">&emsp;<img src="../../img/pae/2.5.png"></td>
				<td>알리</td>
				<td>순서와 패 상관없이<br><strong>1월과 2월의 조합</strong>입니다.</td>
			</tr>
			<tr>
				<td><img src="../../img/pae/1.png">&emsp;<img src="../../img/pae/1.5.png"></td>
				<td>+</td>
				<td><img src="../../img/pae/4.png">&emsp;<img src="../../img/pae/4.5.png"></td>
				<td>독사</td>
				<td>순서와 패 상관없이<br><strong>1월과 4월의 조합</strong>입니다.</td>
			</tr><tr>
				<td><img src="../../img/pae/9.png">&emsp;<img src="../../img/pae/9.5.png"></td>
				<td>+</td>
				<td><img src="../../img/pae/1.png">&emsp;<img src="../../img/pae/1.5.png"></td>
				<td>구삥</td>
				<td>순서와 패 상관없이<br><strong>9월과 1월의 조합</strong>입니다.</td>
			</tr><tr>
				<td><img src="../../img/pae/10.png">&emsp;<img src="../../img/pae/10.5.png"></td>
				<td>+</td>
				<td><img src="../../img/pae/1.png">&emsp;<img src="../../img/pae/1.5.png"></td>
				<td>장삥</td>
				<td>순서와 패 상관없이<br><strong>10월과 1월의 조합</strong>입니다.</td>
			</tr>
			<tr>
				<td><img src="../../img/pae/10.png">&emsp;<img src="../../img/pae/10.5.png"></td>
				<td>+</td>
				<td><img src="../../img/pae/4.png">&emsp;<img src="../../img/pae/4.5.png"></td>
				<td>장사</td>
				<td>순서와 패 상관없이<br><strong>10월과 4월의 조합</strong>입니다.</td>
			</tr>
			<tr>
				<td><img src="../../img/pae/4.png">&emsp;<img src="../../img/pae/4.5.png"></td>
				<td>+</td>
				<td><img src="../../img/pae/6.png">&emsp;<img src="../../img/pae/6.5.png"></td>
				<td>세륙</td>
				<td>순서와 패 상관없이<br><strong>4월과 6월의 조합</strong>입니다.</td>
			</tr>
			<tr>
				<td><img src="../../img/pae/2.png">&emsp;<img src="../../img/pae/7.5.png"></td>
				<td>></td>
				<td><img src="../../img/pae/5.png">&emsp;<img src="../../img/pae/9.png"></td>
				<td>끗</td>
				<td>월 수를 더한 값인<strong> 끗 수 조합(족보가 아닌 일반 조합)</strong>입니다.<br>(끗 수가 9인 경우는 '갑오'라고 불립니다. 끗 조합 중 가장 높은 점수입니다.)</td>
			</tr>
			<tr>
				<td><img src="../../img/pae/2.png">&emsp;<img src="../../img/pae/2.5.png"></td>
				<td>+</td>
				<td><img src="../../img/pae/8.png">&emsp;<img src="../../img/pae/8.5.png"></td>
				<td>망통</td>
				<td><strong>끗 수가 0인 조합</strong>입니다.<br><strong>가장 낮은 점수의 조합</strong>입니다.</td>
			</tr>
		</table>
	</div>
	
		<p style="font-size:35px;"><strong>특수 족보</strong></p>
	<div class="specialCon">
		<table>
			<tr>
				<td><img src="../../img/pae/3.png">&emsp;<img src="../../img/pae/3.5.png"></td>
				<td>+</td>
				<td><img src="../../img/pae/7.png">&emsp;<img src="../../img/pae/7.5.png"></td>
				<td>땡잡이</td>
				<td>순서와 패 상관없이<br><strong>3월과 7월의 조합</strong>입니다.<br><strong>'장땡'을 제외한 '땡 조합'</strong>을 이길 수 있는 <strong>특수 족보</strong>입니다.<br>(상대방 패에 땡 조합이 없는 경우는 '망통'으로 처리됩니다.)</td>
			</tr>
			<tr>
				<td><img src="../../img/pae/9.png">&emsp;<img src="../../img/pae/9.5.png"></td>
				<td>+</td>
				<td><img src="../../img/pae/4.png">&emsp;<img src="../../img/pae/4.5.png"></td>
				<td>구사(재경기)</td>
				<td>순서와 패 상관없이<br><strong>9월과 4월의 조합</strong>입니다.<br>상대방 패에 <strong>'알리' 이하의 족보</strong>가 나올 경우, <br>이번 판을 물리고 재경기를 진행합니다.<br>(이를 제외한 경우는 '삼끗'으로 처리됩니다.)</td>
			</tr>
			<tr>
				<td><img src="../../img/pae/9.png">&emsp;<img src="../../img/pae/4.png"></td>
				<td></td>
				<td></td>
				<td>멍텅구리 구사</td>
				<td><strong>열자리 9월과 열자리 4월</strong>의 조합입니다.<br>상대방 패에 <strong>'장땡' 이하의 족보</strong>가 나올 경우, <br>이번 판을 물리고 재경기를 진행합니다.<br>(이를 제외한 경우는 '삼끗'으로 처리됩니다.)</td>
			</tr>
			<tr>
				<td><img src="../../img/pae/4.png">&emsp;<img src="../../img/pae/7.png"></td>
				<td></td>
				<td></td>
				<td>암행어사</td>
				<td><strong>열자리 4월과 열자리 7월</strong>의 조합입니다.<br>상대방 패에 <strong>'일팔광땡' 또는 '일삼광땡' 족보</strong>가 나올 경우, 이길 수 있습니다.<br>(이를 제외한 경우는 '일끗'으로 처리됩니다.)</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>