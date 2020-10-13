<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>로그인</title>
   	<jsp:include page="../include/rel.jsp" flush="false" />
<style>
.tab{
    text-align: center;
    color: #0A4600;
    margin-top: 100px;
}
input[type="text"]{
    width: 380px;
    height: 40px;
    padding-left: 10px;
}
input[type="password"]{
    width: 380px;
    height: 40px;
    padding-left: 10px;
}
input[type="submit"]{
    width: 380px;
    height: 40px;
    background-color: #0A4600;
    color: white;
    font-weight: bold;
    font-size: 20px;
    cursor: pointer;
}
form{
    position: relative;
}
.tab ul{
    list-style-type: none;
}
.login-option a{
    text-decoration: none;
    color: #0A4600;
}
.login-option{
	margin-top: 20px;
    padding: 0px;
    position: static;
}
.id-search{
	margin-right: 100px;
}
.pw-search{
	margin-left: 100px;
}
</style>

</head>
<body>
<jsp:include page="header.jsp" flush="false" />
    <div class="tab">
        <div class="tab-content">
            <div id="user" data-tab-content class="active">
                <form action="/player/loginAction" method="post">
                    <span class="id"><input type="text" name="id" class="user_id" placeholder="아이디를 입력하세요."></span><br><br>
                    <span class="pw"><input type="password" name="password" class="user_pw" placeholder="비밀번호를 입력하세요."></span><br><br>
                    <span class="login-sub"><input type="submit" value="로그인"></span>
                </form>

                <ul class="login-option">
                    <span class="id-search"><a href="#">아이디 찾기</a></span>
                    <span class="pw-search"><a href="#">비밀번호 찾기</a></span>
                </ul>
            </div>
        </div>
    </div>
    <script>
	    <c:set var="msg" value="${msg}"/>
	            <c:if test="${msg != null}">
	              	alert('아이디나 비밀번호가 일치하지 않습니다.');
	            </c:if>
    </script>
</body>
</html>