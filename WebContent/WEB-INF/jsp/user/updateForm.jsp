<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.dateplanner.commons.Region"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
		.container { text-align: center; }
		table  { width: 100%; font-size: larger; }
		input  { width: 100%; }
		select { text-align: left; float: left; }	
		#jumbotron_wrap { padding-top: 10%; }
	</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="../">DatePlanner</a>
			</div>
			<c:choose>
				<c:when test="${empty loginInfo}">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="../user/join"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
						<li><a href="../user/login"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="user/mypage"><span
								class="glyphicon glyphicon-user"></span><strong>${loginInfo.nickname}</strong>로
								로그인중</a></li>
						<li><a href="user/logout">로그아웃</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	<div class="container">
		<div id="jumbotron_wrap">
			<div class="jumbotron">
				<h1>DatePlanner</h1>
				<h3>회원정보 수정하기</h3>
				<form id="joinForm" action="update" method="POST" enctype="multipart/form-data">
					<table class="table table-condensed">
						<tbody>
							<tr>
								<td>아이디 :</td>
								<td><input name="id" value="${user.id}" required readonly></td>
							</tr>
							<tr>
								<td>비밀번호 :</td>
								<td><input id="password" name="key" type="password"
									required placeholder="비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."></td>
							</tr>
							<tr>
								<td>이름 :</td>
								<td><input name="name" value="${user.name}" required
									readonly></td>
							</tr>
							<tr>
								<td>닉네임 :</td>
								<td><input name="nickname" value="${user.nickname}"
									required readonly></td>
							</tr>
							<tr>
								<td>지역</td>
								<td><select name="regionNo">
										<c:forEach var="region" items="${Region.LIST}" varStatus="status">
											<option value="${status.index}"
												<c:if test="${status.index eq regionNo}">id="selected"</c:if>>${region}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>프로필 :</td>
								<td><input id="profileInput" type="file"></td>
							</tr>
							<tr class="hidden">
								<td>파일 주소 :</td>
								<td colspan="2"><input id="profile" name="profile" readonly></td>
							</tr>
							<tr>
								<td>한줄소개 :</td>
								<td><input name="introduction" value="${user.introduction}"></td>
							</tr>
							<tr>
								<td colspan="2"><button id="submit" class="btn btn-info">수정하기</button></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="../js/FileUpload.js"></script>
	<script src="../js/sha512.js"></script>
	<script>
		var $password = $('#password'), $profileInput = $('#profileInput')
		$profile = $('#profile'), submittable = false;

		var $intputId = $('input[name="id"]'),
		$password = $('#password'),
		$inputName = $('input[name="name"]'),
		$inputNickname = $('input[name="nickname"]'),
		$inputIntroduction = $('input[name="introduction"]');

		$('#joinForm').submit(function(e){
			if($inputId.val().length < 8 || $inputId.val().length > 20){ alert("아이디는 8자리에서 20자리 이하여야 합니다"); return false; }
			if($inputName.val().length < 2 || $inputName.val().length > 8){ alert("이름은 2자리에서 8자리 이하여야 합니다"); return false; }
			if($inputNickname.val().length < 2 || $inputNickname.val().length > 10){ alert("닉네임은 2자리에서 10자리 이하여야 합니다"); return false; }
			if($inputIntroduction.val().length > 200){  alert("한줄소개는 200자리 이하여야 합니다"); return false; }
		})
		 

		
	 // 비밀번호 패턴 체크 (8자 이상, 문자, 숫자, 특수문자 포함여부 체크)
		function checkPasswordPattern(str) {
			var pattern1 = /[0-9]/; // 숫자 
			var pattern2 = /[a-zA-Z]/; // 문자 
			var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자 
			if (!pattern1.test(str) || !pattern2.test(str)
					|| !pattern3.test(str) || str.length < 8) {
				alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
				return false;
			} else {
				return true;
			}
		}
		$("#submit").click(function (){ return checkPasswordPattern($password.val()); })
		$profileInput.change(function (){
			fileUpload('img/upload', $profileInput[0].files, function(json) { $profile.val(json.result) })
		});
		
		$('#joinForm').submit(function(e){
			$password.val(sha512($password.val()))
		});
	</script>
</body>
</html>