<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>자료실</title>
    <jsp:include page="../include/rel.jsp" flush="false" />
</head>
<style>
.container{
	margin: auto;
}
.title{
	background-color: #FFDF24;
	padding-top: 10px;
	font-weight: bold;
}
.title h1{
	font-weight: bold;
	padding-left: 20px;
}
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background-color: #9E9E9E;
	color: white;
	display: inline-block;
	cursor: pointer;
	width: 49.8%;
	font-size: 30px;
	text-align: center;
}
ul.tabs li.current{
	border-bottom: 10px solid #DB9700;
	color: white;
}
.tab-content{
	display: none;
	background-color: #ededed;
	padding: 20px;
}
.tab-content.current{
	display: inherit;
}
.tab-content.current tr{
	border-bottom: 1px solid white;
}
.tab-content.current p{
	border-bottom: 1px solid white;
	font-size: 20px;
}
.tab-content.current tr td:nth-child(1){
	width: 200px;
	font-size: 20px;
	text-align: center;
}
.tab-content.current tr td:nth-child(2){
	width: 800px;
	font-size: 20px;
	text-align: center;
}
.tab-content.current tr td:nth-child(3){
	width: 300px;
	font-size: 20px;
	text-align: center;
}
.tab-content.current tr td:nth-child(4){
	width: 300px;
	font-size: 20px;
	text-align: center;
}
</style>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	
<div class="container">
	<div class="title">
		<h1>자료실</h1>
	<ul class="tabs">
		<a href="/download"><li class="tab-link current" data-tab="tab-1">다운로드</li></a>
		<a href="/guide/guideView" onclick="window.open(this.href, '_blank', 'width=1200, height=800, toolbar=no, menubar=no, scrollbars=no, resizeable=yes'); return false;"><li class="tab-link" data-tab="tab-2">게임 가이드</li></a>
	</ul>
	</div>
	<div id="tab-1" class="tab-content current">
		<a href="https://drive.google.com/file/d/1pkjSCJg5_KFpaW67MfsgLPa24rtpq7X4/view?usp=sharing">다운로드</a>
	</div>
	<div id="tab-2" class="tab-content">
		
	</div>
</div>
<jsp:include page="../include/footer.jsp" flush="false" />

<script>
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
})
</script>
</body>
</html>