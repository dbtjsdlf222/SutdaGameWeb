<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>게임 가이드 헤더</title>
   	<jsp:include page="../include/rel.jsp" flush="false" />
</head>
<style>
body{
	background-color: #363636;
}
#guideHeader{
	margin-top: 20px;
	font-size: 50px;
	text-align: center;
	padding-top: 10px;
	color: white;
}
.b05_3d_roll{
	perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
}
.b05_3d_roll div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 40px;
    padding: 10px;
    border: #000000 solid 1px;
    pointer-events: none;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
   	-moz-box-sizing: border-box;
    font-weight: bold;
    font-size: 17px;
}
.b05_3d_roll div:nth-child(1) {
    color: #000000;
    background-color: #000000;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 31% 72% -25px;
    -moz-transform-origin: 50% 50% -25px;
    border: 2px solid #fff;
}
.b05_3d_roll div:nth-child(2) {
    color: #000;
    background-color: #DB3A00;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 30% -25px;
    -webkit-transform-origin: 17;
    -moz-transform-origin: 50% 50% -25px;
}
.b05_3d_roll:hover div:nth-child(1) {
    color: #ffffff;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}
.b05_3d_roll:hover div:nth-child(2) {
    background-color: #000000;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(-90deg);
    -webkit-transform: rotateX(-90deg);
    -moz-transform: rotateX(-90deg);
}
.button_base {
    margin: 0;
    border: 0;
    font-size: 18px;
    position: relative;
    width: 200px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}
.button_base:hover {
    cursor: pointer;
}

</style>
<body>
	<div id="guideHeader">게임 가이드</div>
</body>
</html>