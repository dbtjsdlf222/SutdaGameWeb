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
	<script src="http://code.jquery.com/jquery-1.7.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function execDaumPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullAddr;
                
                document.getElementById('detailAddress').focus();
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',0
            height : '100%'
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호 서비스가 들어갈 element의 width
        var height = 460; //우편번호 서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
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
	margin-top: 100px;
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
input[type="button"]{
	width: 100px;
	height: 30px;
	background-color: midnightblue;
	border-radius: 5%;
	color: white;
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
                <input type="text" id="license1" name="license1" maxlength="3">&emsp;<b>-</b>&emsp;<input type="text" id="license2" name="license2" maxlength="2">&emsp;<b>-</b>&emsp;<input type="text" id="license3" name="license3" maxlength="5"><br><br>
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
                <input type="text" id="phone2" name="phone2" maxlength="8"><br><br>
            </li>
            <li>
            	<label for="text">계좌번호</label><br>
            	<input type="text" id="account" name="account" placeholder="'-'없이 입력하세요">
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
            	<br><label for="store_address">가게 주소</label><br>
                <input type="text" id="postCode" name="postCode" placeholder="우편번호">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br><br>
				<input type="text" id="roadAddress" name="roadAddress" placeholder="주소"><br><br>
				<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"><br><br>
            </li>
        </ul>
        <div id="commit">
        	<input type="checkbox" value="">개인정보 수집 및 이용 <a href="#">[이용 약관]</a><br><br>
        	<input type="submit" value="가입">&emsp;
        	<input type="reset" value="취소">
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
	$('#license1').keyup(function() {
		if (licenseCheck.test($('#license1').val()))
			$('#licensetag').text("확").css({"margin-right":"25px"});				
		});
	$('#license2').keyup(function() {
		if (licenseCheck.test($('#license1').val()))
			$('#licensetag').text("확").css({"margin-right":"25px"});				
		});
	$('#license3').keyup(function() {
		if (licenseCheck.test($('#license1').val()))
			$('#licensetag').text("확").css({"margin-right":"25px"});				
		});
</script>
</html>