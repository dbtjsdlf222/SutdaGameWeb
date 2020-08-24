<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Page Title</title>
    <script src='js/jquery-3.5.1.min.js'></script>
    <script src='js/jquery-migrate-1.4.1.min.js'></script>
    <script src="js/jquery-ui.min.js"></script>
    <link href="join.css" rel="stylesheet" type="text/css">
</head>
<body>
    <header id="container">
        <h1><a href="main.html">QRPAY</a></h1>
        <nav>
            <ul>
                <li><a href="intro"><strong>소개</strong></a></li>
                <li><a href="notice"><strong>공지사항</strong></a></li>
                <li><a href="cs"><strong>고객센터</strong></a></li>
            </ul>
        </nav>
        <a href="login.html"><div class="login">로그인</div></a>
    </header>
    <hr color="midnightblue" size="3px"/>
    <br><br><h1>QRPAY</h1><br><br>
    <div>
        <form>
            <fieldset>
                <legend>회원가입</legend>
                <ul id="join_info">
                    <li>
                        <label for="join_id">아이디<span class="essential"></span></label><br>
                        <input type="text" id="join_id" name="join_id" placeholder="아이디 입력(6~12자)" minlength="6" maxlength="12">
                    </li>
                    <li>
                        <label for="join_pw">비밀번호</label><br>
                        <input type="password" id="join_pw" name="join_pw" placeholder="비밀번호 입력(8~14자)" minlength="8" maxlength="14"><br>
                        <input type="password" id="join_pwc" name="join_pwc" placeholder="비밀번호 확인">
                    </li>
                </ul>
                <ul id="privacy">
                    <li>
                        <label for="name">이름</label><br>
                        <input type="text" id="name" name="name">
                    </li>
                    <li>
                        <label for="license">사업자 등록번호</label><br>
                        <input type="text" id="license1" name="license1">&emsp;-&emsp;<input type="text" id="license2" name="license2">
                    </li>
                    <li>
                        <label for="email">이메일</label><br>
                        <input type="email1" id="email1" name="email1">&emsp;@&emsp;<input type="email2" id="email2" name="email2">
                        <select id="mail_server" name="mail_server">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                        </select>
                    </li>
                    <li>
                        <label for="phone">전화번호</label><br>
                        <select id="phone1" name="phone1">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                        </select>
                        <input type="text" id="phone2" name="phone2">
                    </li>
                </ul>
                <ul id="store">
                    <li>
                        <label for="store_info">가게 종류</label><br>
                        <select id="store_type" name="store_type">
                            <option value="food">음식점</option>
                            <option value="bar">술집</option>
                            <option value="junk">패스트푸드점</option>
                            <option value="cafe">카페</option>
                        </select>
                    </li>
                    <li>
                        <label for="store_name">상호 명</label><br>
                        <input type="text" id="store_name" name="store_name">
                    </li>
                    <li>
                        <label for="store_address">가게 주소</label><br>
                        <input type="text" id="store_address1" name="store_address1"><br>
                        <input type="text" id="store_address2" name="store_address2">
                    </li>
                </ul>
                <input type="submit" value="가입">&emsp;
                <input type="submit" value="취소"><br>
                <input type="checkbox" value="">개인정보 수집 및 이용
            </fieldset>
        </form>
    </div>
</body>
<script>

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
	
	//라이센스 정규식
	var licenseCheck = RegExp(/(\d{3}).(\d{2}).(\d{5}));		//숫자 정규식 (숫자3개+숫자2개+숫자5개 입력 가능)
	var license2Check = RegExp(/[~!@#$%^&*()_+|<>?:{}ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-zA-Z]/); //특수문자 + 한글 + 영어 정규식 
	$('#license1').keyup(function() {
		if (licenseCheck.test($('#license1').val()))
			$('#licensetag').text("확").css({"margin-right":"25px"});				
		});

	//이메일 정규식
	var 

	


</script>
</html>