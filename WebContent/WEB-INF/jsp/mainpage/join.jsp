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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
    
<style>
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
input[id="sample6_postcode"], input[id="sample6_extraAddress"]{
	width: 150px;
	height: 30px;
}
input[id="sample6_address"], input[id="sample6_detailAddress"]{
	width: 500px;
	height: 40px;
}
#commit{
	text-align: center;
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
                <input type="text" id="join_id" name="id" placeholder="아이디 입력(6~12자)" minlength="6" maxlength="12"><br><br>
            </li>
            <li>
                <label for="join_pw">비밀번호</label><br>
                <input type="password" id="join_pw" name="pw" placeholder="비밀번호 입력(8~14자)" minlength="8" maxlength="14"><br><br>
                <input type="password" id="join_pwc" name="pwc" placeholder="비밀번호 확인"><br><br>
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
            <li>
            	<label for="text">계좌번호</label><br>
            	<input type="text" id="account" name="account">
            </li>
        </ul>
        <ul id="store">
            <li>
   		    	<label for="store_info">가게 종류</label><br>
                <select id="store_type" name="storeType">
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
            	<br><label for="store_name">가게 주소</label><br>
                <input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br><br>
				<input type="text" id="sample6_address" placeholder="주소"><br><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소"><br><br>
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
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

</script>
</html>