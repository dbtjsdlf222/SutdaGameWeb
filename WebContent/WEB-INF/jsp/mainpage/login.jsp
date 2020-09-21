<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>로그인 페이지</title>
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.x-git.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script>
	    const tabs = document.querySelectorAll('[data-tab-target]')
	    const tabContents = document.querySelectorAll('[data-tab-content]')
	    tabs.forEach(tab => {
	        tab.addEventListener('click', () => {
	            const target = document.querySelector(tab.dataset.tabTarget)
	            tabContents.forEach(tabContent => {
	                tabContent.classList.remove('active')
	            })
	            tabs.forEach(tab => {
	                tab.classList.remove('active')
	            })
	            tab.classList.add('active')
	            target.classList.add('active')
	        })
	    })

	    <c:set var="msg" value="${msg}"/>
	            <c:if test="${msg != null}">
	              	alert('아이디나 비밀번호가 일치하지 않습니다.');
	            </c:if>
    </script>
<style>
.tab{
    text-align: center;
    color: midnightblue;
    margin-top: 100px;
}
input[type="text"]{
    width: 380px;
    height: 40px;
    padding-left: 10px;
}
input[type="password"]{
    width: 380px;
    height: 40px;
    padding-left: 10px;
}
input[type="submit"]{
    width: 400px;
    height: 40px;
    background-color: midnightblue;
    color: white;
    font-weight: bold;
    font-size: 20px;
    cursor: pointer;
}
form{
    position: relative;
}
.tab ul{
    list-style-type: none;
}
.login-option a{
    text-decoration: none;
    color: midnightblue;
}
.login-option{
    padding: 0px;
}
textarea{
    width: 600px;
    height: 300px;
    padding: 20px;
    line-height: 2em;
    border-radius: 5%;
}
[data-tab-content]{
    display: none;
}
.active[data-tab-content]{
    display: block;
}
.tab.active{
    color: midnightblue;
    font-weight: bold;
}
.tabs{
    cursor: pointer;
    justify-content: space-around;
    padding: 0px;
}
</style>

</head>
<body>
<jsp:include page="header.jsp" flush="false" />
    <div class="tab">
        <ul class="tabs">
            <span data-tab-target="#user" class="active-tab">회원 로그인</span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <span data-tab-target="#unuser" class="tab">비회원 로그인</span>
        </ul>
        <div class="tab-content">
            <div id="user" data-tab-content class="active">
                <form action="owner/loginAction" method="post">
                    <span class="id"><input type="text" name="id" class="user_id" placeholder="아이디를 입력하세요."></span><br><br>
                    <span class="pw"><input type="password" name="pw" class="user_pw" placeholder="비밀번호를 입력하세요."></span><br><br>
                    <span class="login-sub"><input type="submit" value="로그인"></span>
                </form>

                <ul class="login-option">
                	<li>
                    <span class="join"><a href="join">회원가입</a></span>&emsp;&emsp;&emsp;
                    <span class="id-search"><a href="#">아이디 찾기</a></span>&emsp;&emsp;&emsp;
                    <span class="pw-search"><a href="#">비밀번호 찾기</a></span>
                    </li>
                </ul>
            </div>
            <div id="unuser" data-tab-content>
                <form>
                    <textarea>
1. 비회원 로그인 시 홈페이지의 서비스 이용에 제한이 있습니다.
2. 서비스에 가입되어 있는 소상공인 분들은 회원로그인을 이용해 주시기 바랍니다.
3. Q&A게시판 이용 시 임시 비밀번호를 통해 이용해 주시기 바랍니다.
4. 비회원 로그인 후 작성하는 글들은 모두 공개설정 됩니다.
5. =====================================================================
6. =====================================================================
7. =====================================================================
8. =====================================================================
9. =====================================================================
10. ====================================================================
11. ====================================================================
12. ====================================================================
                    </textarea><br>
                    <label class="checkbox"><input type="checkbox" id="agree"><b>비회원 체크리스트에 동의합니다.</b></label><br>
                    <span class="login-sub"><input type="submit" value="로그인"></span>
                </form>
            </div>
        </div>
    </div>
    
</body>
</html>