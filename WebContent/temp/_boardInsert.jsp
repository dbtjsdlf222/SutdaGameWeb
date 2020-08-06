<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 작성</title>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <script>
	    $(document).ready(function() {
	        $('#summernote').summernote({
	            height: 300,
	            width:1000,
	            minHeight: 150,
	            maxHeight: 600,
	            focus: false
	        });
	    });
    </script>
	<style>
	     #title {
            margin:20px 0;
            height:50px;
            font-size:25px;
            outline: none;
            text-indent:20px;
        }
        #title:focus { border: 2px solid gray; }
    </style>
</head>
<body>
    <form action="" method="post">
        <input id="title" size="72" placeholder="제목"/>
        <textarea name="content" id="summernote"></textarea>
    </form>
</body>
</html>