
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>메인 페이지</title>
    <link rel="stylesheet" href="/css/owl.carousel.min.css" />
	<link rel="stylesheet" href="/css/owl.theme.default.css" />
    <jsp:include page="../include/rel.jsp" flush="false" />
<style>
.main_banner{
	position: relative;
}
.main_banner .owl-prev{
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	height: 100%;
	width: 100px;
	outline: none;
}
.main_banner .owl-prev::before{
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-position: -328px -651px;
	background-repeat: no-repeat;
	width: 22px;
	height: 38px;
	content: "";
	margin: auto;
}
.main_banner .owl-next{
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	outline: none;
	width: 100px;
}
.main_banner .owl-next::before{
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-position: -1056px -369px;
	background-repeat: no-repeat;
	width: 22px;
	height: 38px;
	content: "";
	margin: auto;
}
.main_banner .item{
	padding-top: 100px;
    height: 360px;
    box-sizing: border-box;
    color: black;
    text-align: center;
}
.main_banner .item .first{
	background-color: midnightblue;
}
.main_banner .item .second{
	background-color: lightgrey;
}
.main_banner .item .third{
	background-color: lightblue;
}
.main_banner .item .title{
	display: inline-block;
	vertical-align: top;
	line-height: 60px;
	font-size: 50px;
	letter-spacing: -2.5px;
	font-weight: normal;
	position: relative;
}
.main_banner .item .title .em{
	display: block;
}
.main_banner .item .title::before{
	position: absolute;
	top: 35px;
	left: -55px;
	font-size: 124px;
	font-weight: 100;
	content: "[";
}
.main_banner .item .title::after{
	position: absolute;
	top: 35px;
	left: -55px;
	font-size: 124px;
	font-weight: 100;
	content: "]";
}
.main_banner .item .subtitle{
	display: inline-block;
	vertical-align: top;
	display: block;
	margin-top: 15px;
	font-size: 24px;
	line-height: normal;
	letter-spacing: -1.2px;
}
@media screen and (max-width: 998px){
	.main_banner{
		height: 645px;
	}
	.main_banner .item{
		background: no-repeat;
		padding-top: 241px;
		height: 645px;
	}
	.main_banner .item .title{
		font-size: 35px;
	}
	.main_banner .item .title::before, .main_banner .item .title::after{
		font-size: 92px;
	}
}
@media screen and (max-width: 768px){
	.main_banner{
		height: 645px;
	}
	.main_banner .item{
		padding-top: 241px;
		height: 645px;
	}
	.main_banner .item .title{
		font-size: 30px;
	}
	.main_banner .item .title::before, .main_banner .item .title::after{
		font-size: 92px;
	}
	.main_banner .item .subtitle{
		font-size: 20px;
	}
}
@media screen and (max-width: 475px){
	.main_banner{
		height: 645px;
	}
	.main_banner .item{
		background: no-repeat url("../img/mb_main_banner.png") 0/cover;
		padding-top: 241px;
		height: 645px;
	}
	.main_banner .item .title{
		font-size: 24px;
		line-height: 40px;
	}
	.main_banner .item .title::before, .main_banner .item .title::after{
		top: 20px;
		font-size: 70px;
	}
	.main_banner .item .title::before{
		left: -30px;
	}
	.main_banner .item .title::after{
		right: -30px;
	}
	.main_banner .item .subtitle{
		font-size: 16px;
	}
}
#wrap{
    position: relative;
    width: 1000px;
    left: 50%;
    margin-left: -562px;
    height: 1181px;
}
section{
	width:100%;
	height:400px;
	border:1px solid black;
	text-align:center;
	margin-top:7px;
	background:#363636;
	color:#DB3600;
}
.youtube_list{
	padding: 10px;
}
li{
	list-style:none;
	padding:0;
	margin:0;
}
.youtube_list li strong{
    display: block;
    width: 288px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
ul{
	margin: 0;
	padding:0;
}
.youtube_list li{
	list-style: none;
    margin-left: 10px;
    border-left: 1px solid black;
    padding-left: 10px;
    float: left;
    width: 300px;
    height: 220px;
    overflow: hidden;
}
.youtube_list img{
	width:287px;
}
owl-carousel {
    display: none;
    width: 100%;
    z-index: 9;
    background: wheat;
    height: 300px;
}
.youtube_list li:nth-child(1){
	margin-left:0;
	border-left:none;
}
.small_box{
    width: 488px;
    border: 1px solid black;
    height: 355px;
    float: left;
    margin: 9px 6px;
}
.rate_rank_ul,.money_rank_ul{
	font-size:12px;
	font-weight: 900;
}
.rate_rank_ul>li{
   	text-align: justify;
    font-size: 18px;
    background: black;
    border-radius: 0 0px 80px 0;
    padding-left: 14px;
    width: 415px;
    margin: 15px 1px;
    height: 73px;
}

.money_rank_ul>li{
    text-align: justify;
    font-size: 18px;
    background: gold;
    border-radius: 3px 3px 3px 51px;
    padding-left: 14px;
    width: 415px;
    margin: 15px 1px;
    height: 73px;
    margin-left: auto;
}
.ranker_box{
	
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false" />
 	<div id="wrap">
 	<jsp:include page="../include/righter.jsp" flush="false" />
		<section class="owl-carousel owl-theme">
			<div class="main_banner owl-carousel owl-theme">
				<div class="item first">
					<h3 class="title">오픈기념<strong class="em">이벤트!!</strong></h3>
					<span class="subtitle">2020.11 - 2020.12</span>
				</div>
				<div class="item second">
					<h3 class="title">ㅁㄴㅇ<strong class="em">이벤트!!</strong></h3>
					<span class="subtitle">2020.11 - 2020.12</span>
				</div>
				<div class="item first">
					<h3 class="title">ㅂㅈㄷ<strong class="em">이벤트!!</strong></h3>
					<span class="subtitle">2020.11 - 2020.12</span>
				</div>
			</div>
		</section>
		<section>
			<h3>유튜브 영상 자료실</h3>
			<hr />
			<ul class="youtube_list">
				<li>
					<div>
						<img src="https://ssl.pstatic.net/tveta/libs/1306/1306995/78b8da1d98512d4f840e_20201023182122685.jpg">
						<strong>[속보]보속소복소소소보송보송</strong>
						<p>속보였던속보이던글인걸알리는속속보였던속보이던글인걸알리는속속보였던속보이던글인걸알리는속속보였던속보이던글인걸알리는속보이자속보이는기사입니다.</p>				
					</div>
				</li>
				<li>
					<div>
						<img src="https://ssl.pstatic.net/tveta/libs/1306/1306995/78b8da1d98512d4f840e_20201023182122685.jpg">
						<strong>[속보]보속소복소소소보송보송</strong>
						<p>속보였던속보이던글인걸알리는속보이자속보이는기사입니다.</p>				
					</div>
				</li>
				<li>
					<div>
						<img src="https://ssl.pstatic.net/tveta/libs/1306/1306995/78b8da1d98512d4f840e_20201023182122685.jpg">
						<strong>[속보]보속소복소소소보송보송</strong>
						<p>속보였던속보이던글인걸알리는속보이자속보이는기사입니다.</p>				
					</div>
				</li>
			</ul>
		</section>
		
		<section class="small_box">
			<h3>재산가</h3>
			<hr/>
			<ul class="money_rank_ul">
				<li>
					<span>1</span>
					<div class="ranker_box">
						<p>현호 짱짱맨</p>
						<p>10조</p>
					</div>
				</li>
				<li>
					<span>2</span>
					<div class="ranker_box">
						<p>현호 짱짱맨</p>
						<p>10조</p>
					</div>
				</li>
				<li>
					<span>3</span>
					<div class="ranker_box">
						<p>현호 짱짱맨</p>
						<p>10조</p>
					</div>
				</li>
			</ul>
		</section>
		
		<section class="small_box">
			<h3>타짜</h3>
			<hr/>
			<ul class="rate_rank_ul">
				<li>
					<p>현호 짱짱맨</p>
					<p>10전 5승 5패 50%</p>
				</li>
				<li>
					<p>test1</p>
					<p>10전 4승 6패 40%</p>
				</li>
				<li>
					<p>test2</p>
					<p>10전 2승 8패 20%</p>
				</li>
			</ul>
		</section>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />
	<jsp:include page="../include/rel.jsp" flush="false" />
<script>
	(function(window){
		"use strict";

		document.addEventListener("DOMContentLoaded", function(){

		$(".owl-carousel").owlCarousel({
			loop: true,
			responsiveClass: true,
			autoplay: true,
			autoplayTimeout: 5000,
			dots: false,
			nav: true,
			responsive: {
				0: {
					items: 1
					}
				}
			});
			});
		})();
</script>
</body>
</html>