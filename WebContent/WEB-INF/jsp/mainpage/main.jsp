
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
	padding-top: 323px;
	height: 800px;
	box-sizing: border-box;
	color: #fff;
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
</style>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
    
<div class="owl-carousel owl-theme">
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
</div>
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