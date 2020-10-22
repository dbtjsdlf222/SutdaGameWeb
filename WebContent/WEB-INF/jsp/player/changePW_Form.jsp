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
	<script>
	   // 비밀번호 정규식
	   var pwCheck = RegExp(/(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,20}).{8,20}$/); //숫자 + 특수문자 + 영어 정규식 (숫자,특수문자,영어를 1개이상 들어가고 8~20자 이하)
	   var $pw = $('#change_pw'); 
	   var $pwc = $('#change_pwc');
	   var $pw_error = $('#pwMsg');
	   var $pwc_error = $('#pwcMsg');
	   var password=false, passwordc=false;

	   $("form").submit(function(e){
	      if(password&&passwordc){
	         return true;
	      } else {
	         e.preventDefault();
	         alert("입력 값을 확인해 주세요");
	         return false;
	      }
	   })
	   
	   $pw.keyup(function() {
	      $pw_error.text("8~20자 영대 소문자 , 숫자, 특수문자를 포함해야 합니다.").css({"display":"block","color":"red"});
	      if (pwCheck.test($pw.val())){
	         $pw_error.text("사용 가능한 비밀번호 입니다.").css({"color":"green"});
	         password=true;
	      }
	      if($pw.val()==""){
	         $pw_error.text("필수 입력입니다.").css({"color":"red"});
	         password=false;
	      }
	   }); 

	   $pwc.keyup(function() {
	      $pwc_error.text("비밀번호가 일치하지 않습니다.");
	      if ($pw.val()==$pwc.val()){
	         $pwc_error.text("비밀번호가 일치합니다.").css({"color" : "green"});
	         passwordc=true;
	      } else {
	    	   $pwc_error.text("비밀번호가 일치 하지 않습니다.").css({"color" : "red"});
	    	   passwordc=false;
		  }
	      if($pw.val()=="") {
	         $pw_error.text("필수 입력입니다.");
	         passwordc=false;
	      }
	   });
   </script>
</html>
