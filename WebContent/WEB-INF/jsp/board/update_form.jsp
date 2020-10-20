<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
	<title>게시글 수정</title>
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

        ul{
            list-style: none;
        }
	</style>
</head>
<body>
<jsp:include page="../mainpage/header.jsp" flush="false" />
	<div class="container">
		<form action="/board/update" method="POST">
			<table style="width: 100%; border-collapse: collapse">
				<tr><td colspan="3"><input name="title" size="20" placeholder="제목" value="${post.title}"></td></tr>
				<tr>
					<td colspan="3"><textarea id="summernote" name="content" required>${post.content}</textarea></td>
				</tr>
			</table>
				<input type="submit" class="button" value="글쓰기" />
				<input type="hidden" name="kindNo" value="${kind}" />
		</form>
	</div>
	 <jsp:include page="../include/rel.jsp" flush="false" />
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/js/summernote/summernote-lite.min.js"></script>
	<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
	
</body>
	<!-- codemirror-->
	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>
	
	<script>
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: 800,             // 최소 높이
			  maxHeight: 600,             // 최대 높이
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '2글자 이상 작성해주세요.',	//placeholder 설정
			  codemirror: { // code 수정 용이
				    theme: 'monokai'
			  }
		});
	
		var $inputTitle = $("input[name='title']"),
			$inputContent = $("textarea[name='content']");
		
		$('form').submit(function(e){
			if($inputTitle.val().length < 5 || $inputTitle.val().length > 50){ alert("제목은 5자에서 50자여야 합니다."); return false; }
			if($inputContent.val().length < 2){ alert("내용은 2글자 이상이여야 합니다."); return false; }
			if(byteCheck($inputContent.val().length) > 16777200){ alert("내용이 최대 용량을 초과 했습니다."); return false; }
			$(this).submit(function(e){e.preventDefault()})
		})
		
		var $image = $('#image'),
			$summernote = $('#summernote');
		
		$('#imageInput').change(function() { fileUpload('img/upload', this.files, function(json) { $image.val(json.result) }) });
		
		function byteCheck(el){
		    var codeByte = 0;
		    for (var idx = 0; idx < el.val().length; idx++) {
		        var oneChar = escape(el.val().charAt(idx));
		        if ( oneChar.length == 1 ) {
		            codeByte ++;
		        } else if (oneChar.indexOf("%u") != -1) {
		            codeByte += 2;
		        } else if (oneChar.indexOf("%") != -1) {
		            codeByte ++;
		        }
		    }
		    return codeByte;
		}

	</script>
</html>