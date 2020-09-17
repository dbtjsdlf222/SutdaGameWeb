<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>고객센터 페이지</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.x-git.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.stripe{
	text-align: center;
	border: 1px solid #dddddd;
}
th{
	background-color: #eeeeee;
	text-align: center;
}
textarea{
	width: 800px;
	height: 500px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>
	<div class="container">
		<div class="row">
		<form method="post" action="mainpage/sc/writeAction">
			<table class="stripe">
				<thead>
					<tr>
						<th colspan="2">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="board_title" maxlength="30"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="내용을 입력하세요" name="board_content" maxlength="4096"></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="write_btn" value="글 작성">
		</form>
		</div>
	</div>
</body>
</html>