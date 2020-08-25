<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>회원가입 페이지</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.x-git.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    
<style>
.home{
    margin-left: 30px;
    font-size: 50px;
    color: midnightblue;
    font-weight: bold;
    font-family: stencil;
}
.home a{
    text-decoration: none;
}
.nav{
    display: flex;
    border-bottom: 2px solid midnightblue;
    height: 100px;
    align-items: center;
}
.nav-right-items{
    display: flex;
    margin-left: auto;
    margin-right: 50px;
    text-align: center;
}
.nav-item{
    margin-left: 30px;
    font-size: 30px;
    font-weight: bold;
    color: midnightblue;
    margin-right: 100px;
    display: block;
}
.login{
    width: 100px;
    height: 40px;
    padding-top: 10px;
    border-radius: 10%;
    background-color: midnightblue;
    margin-right: 50px;
    text-align: center;
}
header{
    margin-bottom: 100px;
}
.login a{
    text-decoration: none;
    color: white;
    font-size: 20px;
    font-weight: bold;
}
.information{
	border: 1px solid midnightblue;
	width: 800px;
	height: auto;
	padding-top: 50px;
	padding-bottom: 50px;
	margin: auto;
	color: midnightblue;
}
legend{
	text-align: center;
	font-size: 30px;
	color: midnightblue;
}
.information ul{
	list-style-type: none;
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
input[id="license1"],input[id="license2"],input[id="license3"]{
	width: 180px;
	text-align: center;
}
input[id="email1"],input[id="email2"]{
	width: 200px;
	height: 40px;
	padding-left: 10px;
}
select{
	width: 150px;
	height: 45px;
}
input[type="submit"]{
	width: 200px;
	height: 40px;
	background-color: midnightblue;
	color: white;
	font-weight: bold;
	font-size: 20px;
	cursor: pointer;
}
#commit{
	text-align: center;
}
 </style>
</head>
<body>
    <header>
    <div class="nav">
        <div class="home"><a href="main">QRPAY</a></div>
        <div class="nav-right-items">
            <div class="nav-item">소개</div>
            <div class="nav-item">공지사항</div>
            <div class="nav-item">고객센터</div>
        </div>
        <div class="login"><a href="login">로그인</a></div>
        <!-- <img src="/image/user.png"> -->
    </div>
    </header>
    
    <fieldset class="information">
    <legend>회원가입</legend>
    	<form action="joinAction" method="post">
        <ul id="join_info">
            <li>
                <label for="join_id">아이디<span class="essential"></span></label><br>
                <input type="text" id="join_id" name="join_id" placeholder="아이디 입력(6~12자)" minlength="6" maxlength="12"><br><br>
            </li>
            <li>
                <label for="join_pw">비밀번호</label><br>
                <input type="password" id="join_pw" name="join_pw" placeholder="비밀번호 입력(8~14자)" minlength="8" maxlength="14"><br><br>
                <input type="password" id="join_pwc" name="join_pwc" placeholder="비밀번호 확인"><br><br>
            </li>
        </ul>
        <ul id="privacy">
			<li>
                <label for="name">이름</label><br>
                <input type="text" id="name" name="name"><br><br>
            </li>
            <li>
                <label for="license">사업자 등록번호</label><br>
                <input type="text" id="license1" name="license1">&emsp;<b>-</b>&emsp;<input type="text" id="license2" name="license2">&emsp;<b>-</b>&emsp;<input type="text" id="license3" name="license3"><br><br>
            </li>
            <li>
                <label for="email">이메일</label><br>
                <input type="text" id="email1" name="email1">&emsp;<b>@</b>&emsp;<input type="text" id="email2" name="email2">&emsp;
                <select id="mail_server" name="email2">
                	<option value="직접 입력">직접 입력</option>
                    <option value="naver.com">naver.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="daum.net">daum.net</option>
                </select>
            </li>
            <li>
                <br><label for="phone">전화번호</label><br>
                <select id="phone1" name="phone1">
                	<option value="010">010</option>
                    <option value="011">011</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                </select>
                <input type="text" id="phone2" name="phone2"><br><br>
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
                <br><label for="store_name">상호 명</label><br>
                <input type="text" id="store_name" name="store_name"><br><br>
            </li>
            <li>
                <label for="store_address">가게 주소</label><br>
                <input type="text" id="store_address1" name="store_address1"><br><br>
                <input type="text" id="store_address2" name="store_address2" placeholder="상세 주소">
            </li>
        </ul>
        <div id="commit">
        	<input type="checkbox" value="">개인정보 수집 및 이용 <a href="#">[이용 약관]</a><br><br>
        	<input type="submit" value="가입">&emsp;
        	<input type="submit" value="취소">
        </div>
        </form>
	</fieldset>
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