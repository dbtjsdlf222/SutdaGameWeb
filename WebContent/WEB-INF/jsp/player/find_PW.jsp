<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>  
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>비밀번호 찾기</title>
   	<jsp:include page="../include/rel.jsp" flush="false" />
<style>
.tab{
    text-align: center;
    position:relative;
    top:150px;
}
input[type="text"]{
    width: 380px;
    height: 40px;
    padding-left: 10px;
}
input[type="email"]{
    width: 380px;
    height: 40px;
    padding-left: 10px;
}
input[type="submit"]{
    width: 380px;
    height: 40px;
    background-color: #DB3A00;
    color: white;
    cursor: pointer;
    font-weight: bold;
    font-size: 20px;
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
    <div class="tab">
        <div class="tab-content">
            <div id="user" data-tab-content class="active">
                <form action="/player/findPW" method="POST">
                <table>
               	 	<tr><td><span>아이디</span><span class="id"><input type="text" name="id" class="id_input" placeholder="아이디를 입력해 주세요." required="required"></span></td></tr>
                    <tr><td><span>이메일</span><span class="pw"><input type="email" name="mail" class="email_input" placeholder="이메일을 입력해 주세요" required="required"></span></td></tr>
                    <tr><td colspan="2"><span class="login-sub"><input type="submit" value="비밀번호 찾기"></span></td>
                </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
