<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>  
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>비밀번호 변경</title>
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
                <form action="/player/changePWAction" method="POST">
                <input type="hidden" name="csrf_token" value="${csrf_token}">
                <table>
               	 	<tr><td>비밀번호</td><td>
				        <input type="password" id="change_pw" name="password" required placeholder="비밀번호 입력(8~14자)" minlength="8" maxlength="14"><p id="pwMsg">　</p>
           	 		</td></tr>
                    <tr><td>비밀번호 확인</td><td>
                    	<input type="password" id="change_pwc"  required placeholder="비밀번호 확인"> <p id="pwcMsg">　</p>
                   	</td></tr>
                    <tr><td colspan="2">
                    	<span class="login-sub"><input type="submit" value="비밀번호 변경">
                    </span></td>
                </table>
                <input type="hidden" name="code" value="${code}">
                </form>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="/js/passwordCheck.js"></script>
<script>
$("form").submit(function(e){
    if(password && passwordc){
       return true;
    } else {
       e.preventDefault();
       alert("입력 값을 확인해 주세요");
       return false;
    }
 })
</script>
</html>
