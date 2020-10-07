<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
	<title>글쓰기 - DatePlanner</title>
	<style>
	@CHARSET "UTF-8";
			input[name="packageable"] {
			width:15px;
			height:15px;
		}
		input[name="title"] {
			height : 45px;
			line-height: 45px;
			text-indent :10px;
			font-size:30px;
		}
		input[name="title"]:FOCUS { outline-style: none; }
		table tr>td:NTH-CHILD(1) {
			min-width: 100px;
			padding: 20px;
			text-align: center;
			font-size:20px;
			font-weight: 800;
			background-color: #999;
		}
		.button:HOVER {
			background-color: #000;
			color: #fff;
		}
		.button {
			transition: .4s ease;
			float:right;
		    width: 200px;
		    height: 50px;
		    font-size: 23px;
		    font-weight: 600;
		    background: center;
		    border: 3px solid gray;
		}
        input{
            width: 100%;
        }

        .jumbotron table{
            font-size: 18px;
        }

        table tr td{
            padding: 10px;
        }

        ul{
            list-style: none;
        }
	</style>
</head>
<body>
<jsp:include page="../mainpage/header.jsp" flush="false" />
	<div class="container">
		<form action="doWrite" method="POST">
			<table border="1" style="width: 100%; border-collapse: collapse">
				<tr><td>제목</td><td colspan="3"><input name="title" size="20" placeholder="제목"></td></tr>
				<tr>
					<td>내용</td>
					<td colspan="3"><textarea id="summernote" name="content" required></textarea></td>
				</tr>
				<tr>
					<td>게시글 배경사진</td>
					<td colspan="3"><input id="imageInput" type="file"> <input id="image" type="hidden" name="image" readonly /></td>
				</tr>
			</table>
				<input type="submit" class="button" value="글쓰기" />
		</form>
	</div>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/js/summernote/summernote-lite.min.js"></script>
	<script src="/js/FileUpload.js"></script>
	<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
	<script>

	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: 800,             // 최소 높이
		  maxHeight: 600,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	});
	

		var $inputTitle = $("input[name='title']"),
			$inputContent = $("textarea[name='content']");
		
		$('form').submit(function(e){
			if($inputTitle.val().length < 5 || $inputTitle.val().length > 50){ alert("제목은 5자에서 50자여야 합니다."); return false; }
			if($inputContent.val().length < 10 || $inputContent.val().length > 2000){ alert("내용은 10자에서 2000자 사이여야 합니다."); return false; }
			$(this).submit(function(e){e.preventDefault()})
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