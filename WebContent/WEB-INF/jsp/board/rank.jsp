<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>섯다-명예의 전당</title>
   	<jsp:include page="../include/rel.jsp" flush="false" />
</head>
<style>
	.rank_player_box{
		border: 1px solid black;
	    width: 900px;
	    height: 112px;
	    margin: auto;
	    position: relative;
	    background-image: linear-gradient(-225deg, #750000 0%, #000000 48%, #6654F1 100%);
	}
	.container{
		width:100%
	}
	.character{
	    position: absolute;
	    top: 11px;
	    left: 70px;
	    width: 90px;
	    height: 90px;
	    background: black;
	}
	.name{
		position: absolute;
		left:200px;
		font-size:25px;
		font-weight: bold;
		color:firebrick;
	}
	.order>h1{
		line-height: 1.6;
	}
	.money{
		position: absolute;
	    left: 207px;
	    top: 45px;
	    font-size: 17px;
	    color:burlywood;
	}
	.rating_box{
        width: 227px;
	    height: 100px;
	    position: absolute;
	    top: 14px;
	    left: 492px;
	    line-height: 4.4;
	    font-size: 18px;
	}
	.rating_box>span{
		margin-right: 10px;
	}
	.rating_box>span:nth-child(1){
		color: darkgoldenrod;
	}
	.rating_box>span:nth-child(2){
		color: blue;
	}
	.rating_box>span:nth-child(3){
		color: brown;
	}
	.odds{
		text-align: center;
	    font-size: 20px;
	    position: absolute;
	    width: 150px;
	    height: 100px;
	    right: 10px;
	    top: 14px;
	    line-height: 4;
	    font-weight: bold;
	    color:aliceblue;
	}
	.order{
		color:aliceblue;
	    height: 100%;
	    width: 50px;
	    left: 22px;
	    position: absolute;
	    line-height: 2.5;
	}
</style>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
<a class="btn btn-primary" href=/board/rank?kind=1>승률 순</a>
<a class="btn btn-primary" href=/board/rank?kind=2>머니 순</a>
<a class="btn btn-primary" href=/board/rank?kind=3>게임판 순</a>
	<div class="container">
	<c:forEach var="ranks" items="${ranks}" varStatus="num">
		<div class="rank_player_box">
			<div class="order"><h1>${num.count }</h1></div>
			<img class="character" src="/img/character/cha<c:out value='${ranks.character}'/>.png"/>
			<h2 class="name"><c:out value='${ranks.nickname}'/></h2>
			<h3 class="money"><c:out value='${ranks.strMoney}'/></h3>
			<div class="rating_box">
				<span>전 <c:out value='${ranks.win+ranks.lose}'/> </span>
				<span>승 <c:out value='${ranks.win}'/> </span>
				<span>패 <c:out value='${ranks.lose}'/> </span>
			</div>
				<div class="odds">
					<span>승률 <fmt:formatNumber value="${(ranks.win/(ranks.win+ranks.lose))*100}" pattern=".0"/>%</span>
				</div>
		</div>
	</c:forEach>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false" />
</body>
</html>