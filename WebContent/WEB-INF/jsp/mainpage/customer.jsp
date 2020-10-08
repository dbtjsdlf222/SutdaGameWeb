<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>고객센터</title>
    <jsp:include page="../include/rel.jsp" flush="false" />
</head>
<style>
fieldset{
    margin: auto;
    border: 1px solid #0A4600;
    width: auto;
    height: auto;
}
legend{
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    color: #0A4600;
}
table{
    border: 1px solid #eeeeee;
    background-color: #eeeeee;
    text-align: center;
    width: 1600px;
    font-size: 15px;
    margin: auto;
}
#post_no{
    background-color: #dddddd;
    font-weight: bold;
}
#post_title{
    background-color: #dddddd;
    font-weight: bold;
}
#user_id{
    background-color: #dddddd;
    font-weight: bold;
}
#post_date{
    background-color: #dddddd;
    font-weight: bold;
}

input[value="글 작성"]{
	width: 100px;
	height: 40px;
	color: white;
	font-size: 15px;
    font-weight: bold;
    border-radius: 10%;
	background-color: #0A4600;
    float: right;
    margin-top: 10px;
    margin-right: 50px;
    cursor: pointer;
}

.FQ_title,.FQ_content{
	width: 1600px;
	 height:30px;
	 padding:10px;
}

.FQ_title {
	 background-color: #e0e0e0;
	 margin-top:20px;
}
.FQ_content{
	background-color: gray;
}
[data-tab-content]{
	display: none;
}
.active[data-tab-content]{
	display: block;
}
.tab.active{
	color: #0A4600;
	font-weight: bold;
}
.tabs{
	cursor: pointer;
	justify-content: space-around;
	padding: 0px;
}
.tab{
	text-align: center;
	margin-top: 100px;
	color: #0A4600;
	font-size: 20px;
}
</style>
<body>
	<jsp:include page="header.jsp" flush="false"/>
	
	<div class="tab">
		<ul class="tabs">
			<a id="userTab" data-toggle="tab" class="active-tab">1:1 문의</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<a id="unuserTab" data-toggle="tab" class="tab">자주하는 질문</a>
		</ul>
		<div id="tab-content">
			<div id="user" data-tab-content class="active">
		        <fieldset>
		            <legend>게시판 목록</legend>
		            <table>
		                <tr>
		                    <td id="post_no">No.</td>
		                    <td id="post_title">제목</td>
		                    <td id="user_id">작성자</td>
		                    <td id="post_date">작성일</td>
		                </tr>
					<c:forEach var="post" items="${boardList}" varStatus="status">
		                <tr>
		                    <td><c:out value="${post.no}"/></td>
		                    <td><a href="board?no=${post.no}">${post.title}</a></td>
		                    <td>${post.writerName}</td>
		                    <td>${post.writeDate}</td>
		                </tr>
					</c:forEach>
		            </table>         
		            <a href="write"><input type="submit" value="글 작성" name="write"></a>
		        </fieldset>
	        </div>
	        <div id="unuser" data-tab-content>
		        <fieldset>
		            <legend>자주 하는 질문</legend>
				        <div id="FQboardList">
							<c:forEach var="post" items="${FQboardList}" varStatus="status">
								 <div class="FQ_title"><c:out value="${post.title}"/></div>
								 <div class="FQ_content"><c:out value="${post.content}"/></div>
							</c:forEach>
				  		</div>		
		       </fieldset>
	       </div>
	    </div>
    </div>
    
    <script>
		$('#userTab').click(function(){
			$('#user').show();
			$('#unuser').hide();
			})
		$('#unuserTab').click(function(){
			$('#user').hide();
			$('#unuser').show();
			})
    </script>
	
</body>
</html>