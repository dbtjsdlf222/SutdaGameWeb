<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>회원가입</title>
    <jsp:include page="../include/rel.jsp" flush="false" />

<style>
    .information{
        border: 1px solid #0A4600;
        width: 800px;
        height: auto;
        padding-top: 50px;
        padding-bottom: 50px;
        margin: auto;
        margin-top: 100px;
        color: #0A4600;
    }
    legend{
        text-align: center;
        font-size: 30px;
        color: #0A4600;
    }
    .information ul{
        list-style-type: none;
    }
    input[type="text"]{
        width: 300px;
        height: 40px;
        padding-left: 10px;
    }
    input[type="button"]{
        width: 100px;
        height: 30px;
        background-color: #0A4600;
        border-radius: 5%;
        color: white;
    }
    input[type="password"]{
        width: 300px;
        height: 40px;
        padding-left: 10px;
    }
    input[type="submit"], input[type="reset"]{
        width: 200px;
        height: 40px;
        background-color: #0A4600;
        color: white;
        font-weight: bold;
        font-size: 20px;
        cursor: pointer;
    }
    #commit{
        text-align: center;
    }
    #useTerms{
    	display: none;
    }
    #useTerms ul{
    	margin: auto;
    	margin-top: 5px;
    	margin-bottom: 5px;
    	width: 500px;
    	border: 1px solid #0A4600;
    }
 </style>

</head>
<body>
<jsp:include page="header.jsp" flush="false"/>
    <fieldset class="information">
    <legend>회원가입</legend>
    	<form action="joinAction" method="post">
        <ul id="join_info">
            <li>
                <label for="join_id">아이디<span class="essential"></span></label><br>
                <input type="text" id="join_id" name="id" placeholder="아이디 입력(6~12자)" minlength="6" maxlength="12" required><br><br>
            </li>
            <li>
                <label for="join_pw">비밀번호</label><br>
                <input type="password" id="join_pw" name="pw" required placeholder="비밀번호 입력(8~14자)" minlength="8" maxlength="14"><br><br>
                <input type="password" id="join_pwc" name="pwc"  required placeholder="비밀번호 확인"><br><br>
            </li>
        </ul>
        <ul id="privacy">
			<li>
                <label for="name">이름</label><br>
                <input type="text" id="name" name="name" required><br><br>
            </li>
            <li>
                <label for="email">이메일</label><br>
                <input type="text" id="email" class="email" required>
            </li>
        </ul><br><br/>
        <div id="commit">
        	<input name="commit" type="checkbox" required>개인정보 수집 및 이용
        	<div id="terms">이용 약관&emsp;<a href="#" id="detail">[자세히 보기]</a></div>
        		<span id="useTerms">
        			<ul>
        				<li>회원가입내의 내용은 정보이용 목적으로 수집합니다.</li>
        				<li>휴면계정으로 전환 시 삭제합니다.</li>
        				<li>개인정보 유효기간은 1년으로 설정합니다.</li>
        			</ul>
        		</span>
        	<input type="submit" value="가입">&emsp;
        	<input type="reset" value="취소">
        </div>
        </form>
	</fieldset>
</body>

<script>
	$('#detail').click(function(){
		$('#useTerms').toggle();
		})
	
	$("form").submit(function() {
		alert("Qweqwe");
		var result='';

		if($("#join_pw").val()!=("#join_pwc").val()) {
			alert("비밀번호를 확인해주세요");
			return false;
		}
	
		var arr = [ 'email' ];
		for(var i=0; i < 3; i++) {

	        result='';
	        
			$('.'+arr[i]).map(function() {
				result +=$(this).val();
			});

			$('input[name='+arr[i]+']').val(result);
		}
	});

	// 아이디 정규식
	var idCheck = RegExp(/^[A-Za-z0-9_]{5,12}$/);						//영어 + 숫자 정규식 (5~12자 입력 가능)
	var id2Check = RegExp(/[~!@#$%^&*()_+|<>?:{}ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);		//특수문자 + 한글 정규식 (아이디에 특수문자와 한글을 거르기 위함)
	$('#user_id').keyup(function() {
		$('#idtag').text("");
		if (id2Check.test($('#user_id').val())) 
			$('#idtag').text("특수문자와 한글은 사용불가합니다.").css({"font-size":"13px","margin-right":"0"});
		else if (idCheck.test($('#user_id').val()))
			$('#idtag').text("사용가능한 아이디입니다.").css({"margin-right":"30px"});
		}); // #user_id

	// 비밀번호 정규식
	var pwCheck = RegExp(/(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,20}).{8,20}$/); //숫자 + 특수문자 + 영어 정규식 (숫자,특수문자,영어를 1개이상 들어가고 8~20자 이하)
	var pw2Check = RegExp()
	$('#user_pw').keyup(function() {
		$('#pwtag').text("");
		if (pwCheck.test($('#user_pw').val()))
			$('#pwtag').text("사용가능한 비밀번호입니다.").css({"margin-right":"25px"});
		}); // #user_pw

</script>
</html>