<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>DatePlanner</title>
    <style>
        .container{ text-align: center; }
        input{ text-align: center; }
        input[type=file]{ display: inline-block; }
        #profile input{ display: inline-block; }
        h3{ color: red; }
    </style>
</head>
<body>
${loginFales}
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/main">DatePlanner</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span>
                회원가입</a></li>

            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
                로그인 <span class="glyphicon glyphicon-log-in"></span></a>

                <ul class="dropdown-menu">
                    <li><a
                            href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=tOzxSVFgBuq1ArjsmwsD&state=STATE_STRING&redirect_uri=http://localhost/main.jsp">
                        네이버 로그인</a></li>
                    <li><a href="#">페이스북 로그인</a></li>
                    <li><a href="#">구글 로그인</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<div class="container">

    <h1>새로운 계정을 만들어주세요</h1>
    <h3>입력창 앞에 별표가 붙은것은 꼭 입력해주세요</h3>
    <div class="signup">
		<form action="join" method="post">
		<input type="text" placeholder="id"  name="id"><br><br>
		<input type="text" placeholder="pw"  name="key"><br><br>
        <i class="fas fa-star"></i><input type="text" id="name" name="name" placeholder="이름" required />
        <input type="text" placeholder="닉네임"  name="nickname"><br><br>

        지역을 선택해주세요<br>
        <select name="regionNo">
            <option value="1">서울</option>
            <option value="2">부산</option>
            <option value="3">대구</option>
            <option value="4">인천</option>
            <option value="5">광주</option>
            <option value="6">대전</option>
            <option value="7">울산</option>
            <option value="8">경기</option>
            <option value="9">강원</option>
            <option value="10">충북</option>
            <option value="11">충남</option>
            <option value="12">전북</option>
            <option value="13">전남</option>
            <option value="14">경북</option>
            <option value="15">경남</option>
            <option value="16">제주</option>
        </select>
        <br><br>

        프로필 사진을 선택해주세요<br>
        <input type="file" id="profile"><br><br>

        성별을 선택해주세요<br>
        <input type="radio" name="sex" value="M" id="M"> <label for="M">남자</label>
        <input type="radio" name="sex" value="F" id="F"><label for="F">여자</label>
        <input type="radio" name="sex" value="O" id="O"> <label for="O">그 외</label>
        <br><br>
        <input type="text" placeholder="한줄소개를 입력해주세요" name="introduction"><br><br>
        <input type="submit" value="가입!">
        </form>

    </div>
</div>
<script>
	var file = document.querySelector('#profile');
	var result;
	
	// 정상 로드시 result에 인코딩 값을 저장하기
	var reader = new FileReader(file);
	reader.onload = function() {
	  result = reader.result;
	  console.log(result);
	}
	
	// 실패할 경우 에러 출력하기
	reader.onerror = function (error) {
	   console.log('Error');
	};
</script>
</body>
</html>