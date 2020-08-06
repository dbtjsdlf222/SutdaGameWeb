<%@page import="org.dateplanner.commons.Region"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        h1{ text-align: center; }
        table{ width: 100%; text-align: center; }
        input{ width: 100%; }
        .jumbotron table{ font-size: 18px; }
        table tr td{ padding: 10px; }
        ul{ list-style: none; }
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
                    <li><a href="../user/login">
                    <span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
                </ul>
            </c:when>
            <c:otherwise>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="user/mypage"><span
                            class="glyphicon glyphicon-user"></span><strong>${loginInfo.nickname}</strong>로
                        로그인중</a></li>
                    <li><a href="../../user/logout">로그아웃</a></li>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<div class="container">
    <div id="jumbotron_wrap" style="padding-top: 10%">
        <div class="jumbotron">
            <h1>패키지 만들기</h1>
            <form id="createForm" action="doCreate">
                <table>
                    <tbody class="table table-condensed">
                    <tr><td>제목: </td><td><input name="title" required></td></tr>
                    <tr><td>내용: </td><td><input name="content" required></td></tr>
                    <tr class="hidden"><td>파일 주소: </td><td><input id="image" name="image" readonly></td></tr>
                    <tr class="hidden"><td>글 목록: </td><td><input id="placeList" name="placeList" readonly></td></tr>
                    <tr><td>사진: </td><td><input id="imageInput" type="file"></td></tr>
                    <tr><td>선택됨</td><td>글목록</td></tr>
                    <tr> 
                        <td>
                            <ol id="selectedBox">
                            </ol>
                        </td>
                        <td>
                            <ul id="placeBox">
                                <c:forEach var="place" items="${placeList}">
                                    <li data-no="${place.no}">${place.title}</li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>지역: </td>
                        <td>
                            <select name="regionNo">
                                <c:forEach var="region" items="${Region.LIST}" varStatus="status">
                                    <option value="${status.index}"<c:if test="${status.index eq regionNo}"> selected</c:if>>${region}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right">
                            <a href="../">메인 페이지로</a>
                            <button>패키지 작성</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="../js/FileUpload.js"></script>
    <script>
        var $select = [$('#selectedBox'), $('#placeBox')],
            $image = $('#image'),
            $placeList = $('#placeList'),
            $createForm = $('#createForm'),
            $inputTitle = $('input[name="title"]'),
            $inputContent = $('input[name="content"]');
            
        
        $('#imageInput').change(function() { fileUpload('img/upload', this.files, function(json) { $image.val(json.result) }) });
        
        $.each($select, function(i, v) {
        		v.on('click', 'li', function() { $(this).appendTo($select[1-i]) })
        });
        
        $('#createForm').submit(function(e) {
        	if($inputTitle.val().length < 5 || $inputTitle.val().length > 50) { alert('제목은 5자 ~ 50자 범위여야 합니다'); return false; }
        	if($inputContent.val().length < 10 || $inputContent.val().length > 100) { alert('내용은 10자에서 100자 범위여야 합니다'); return false; }
        	if($("#selectedBox li").length > 10 || $("#selectedBox li").length > 2) { alert("패키지는 10개를 초과 할 수 없습니다."); return false; }
        	
            var arr = []; $.each($select[0].find('li'), function() { arr.push(this.dataset.no) });
            $placeList.val(arr.join(','))
        })
    </script>
</body>
</html>