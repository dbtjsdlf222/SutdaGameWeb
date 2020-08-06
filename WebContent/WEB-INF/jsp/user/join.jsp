<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		table  { width: 100%; }
		input  { width: 100%; }
		select { text-align: left; float: left; }
		#jumbotron_wrap { padding-top: 10%  }
		input["name='name'"]{ background:red; }
	</style>
</head>
<body>
<jsp:include page="../include/nav.jsp" />
	<div class="container">
		<div id="jumbotron_wrap">
			<div class="jumbotron">
				<h1>DatePlanner</h1>
				<h3>회원가입</h3>
				<form id="joinForm" action="doJoin" method="POST"
					enctype="multipart/form-data">
					<table class="table table-condensed">
						<tbody>
							<tr>
								<td>아이디 :</td>
								<td><input name="id" placeholder="8자 이상 20자 이하" required></td>
							</tr>
							<tr>
								<td>비밀번호 :</td>
								<td><input id="password" name="password" type="password" 
									required placeholder="비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."></td>
							</tr>
							<tr>
								<td>이름 :</td>
								<td><input name="name" placeholder="2자 이상 20자 이하" required></td>
							</tr>
							<tr>
								<td>닉네임 :</td>
								<td><input name="nickname" placeholder="2자 이상 10자 이하" required></td>
							</tr>
							<tr>
								<td>지역</td>
								<td><select name="regionNo">
										<c:forEach var="region" items="${Region.LIST}"
											varStatus="status">
											<option value="${status.index}"
												<c:if test="${status.index eq regionNo}"> selected</c:if>>${region}</option>
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
								<td><input name="introduction" placeholder="200자 이하"></td>
							</tr>
							<tr>
								<td colspan="2"><button id="submit" class="btn btn-info">회원가입</button></td>
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
		
		 // 비밀번호 패턴 체크 (8자 이상, 문자, 숫자 포함여부 체크)
		function checkPasswordPattern(str) {
			var pattern1 = /[0-9]/; // 숫자
			var pattern2 = /[a-zA-Z]/; // 문자 
			if (!pattern1.test(str) || !pattern2.test(str) || str.length < 8) {
				alert("비밀번호는 8자리 이상 문자, 숫자로 구성하여야 합니다.");
				return false;
			} 
			else { return true; }
		}
		
		$('#joinForm').submit(function(e){
			if($inputId.val().length < 8 || $inputId.val().length > 20){ alert("아이디는 8자리에서 20자리 이하여야 합니다"); return false; }
			if($inputName.val().length < 2 || $inputName.val().length > 8){ alert("이름은 2자리에서 8자리 이하여야 합니다"); return false; }
			if($inputNickname.val().length < 2 || $inputNickname.val().length > 10){ alert("닉네임은 2자리에서 10자리 이하여야 합니다"); return false; }
			if($inputIntroduction.val().length > 200){  alert("한줄소개는 200자리 이하여야 합니다"); return false; }
		})
		 
		$("#submit").click(function (){ return checkPasswordPattern($password.val()); })
		$profileInput.change(function (){
			fileUpload('img/upload', $profileInput[0].files, function(json) { $profile.val(json.result) })
		});

		$profileInput.change(function() {
			fileUpload('img/upload', $profileInput[0].files, function(json) {
				$profile.val(json.result)
			})
		});
		$('#joinForm').submit(function(e) { $password.val(sha512($password.val())) });
	</script>
</body>
</html>