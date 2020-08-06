<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.dateplanner.commons.Region"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css">
	<link rel="stylesheet" href="/css/postUpdateWrite.css">
	<title>글쓰기 - DatePlanner</title>
</head>
<body>

<jsp:include page="../include/nav.jsp" flush="false"/>
	<div class="container">
		<form action="doWrite" method="POST">
			<table border="1" style="width: 100%; border-collapse: collapse">
				<tr><td>제목</td><td colspan="3"><input name="title" size="50" placeholder="제목"></td></tr>
				<tr>
					<td>내용</td>
					<td colspan="3"><textarea id="summernote" name="content" required></textarea></td>
				</tr>
				<tr>
					<td>게시글 배경사진</td>
					<td colspan="3"><input id="imageInput" type="file"> <input id="image" type="hidden" name="image" readonly /></td>
				</tr>
				<tr>
					<td>해당 지역</td>
					<td>
						<select name="regionNo">
							<c:forEach var="region" items="${Region.LIST}" varStatus="status">
								<option value="${status.index}"<c:if test="${status.index eq regionNo}"> selected</c:if>>${region}</option>
							</c:forEach>
						</select>
					</td>
					<td>패키지 가능 여부</td><td><input type="checkbox" name="packageable"></td>
				</tr>
			</table>
				<input type="submit" class="button" value="글쓰기" />
		</form>
	</div>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.min.js"></script>
	<script src="../js/FileUpload.js"></script>
	<script>
		var $inputTitle = $("input[name='title']"),
			$inputContent = $("textarea[name='content']");
		
		$('form').submit(function(e){
			if($inputTitle.val().length < 5 || $inputTitle.val().length > 50){ alert("제목은 5자에서 50자여야 합니다."); return false; }
			if($inputContent.val().length < 10 || $inputContent.val().length > 2000){ alert("내용은 10자에서 2000자 사이여야 합니다."); return false; }
			$(this).submit(function(e){e.preventDefault()})}
		})
		
		var $image = $('#image'),
			$summernote = $('#summernote');
		
		$('#imageInput').change(function() { fileUpload('img/upload', this.files, function(json) { $image.val(json.result) }) });
		$('#summernote').summernote({
			height: 400,
			callbacks: {
				onImageUpload: function(files) {
					fileUpload('img/upload/list', files, function(json) {
						$.each(json, function() { $summernote.summernote('editor.insertImage', '/post/img/'+this) })
					})
				}
			}
		})
	</script>
</body>
</html>