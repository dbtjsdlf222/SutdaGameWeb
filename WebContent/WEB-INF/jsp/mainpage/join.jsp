<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>회원가입</title>
    <jsp:include page="../include/rel.jsp" flush="false" />

<style>
    .information{
        border: 1px solid #0A4600;
        width: 800px;
        height: auto;
        padding-top: 50px;
        padding-bottom: 50px;
        margin: auto;
        margin-top: 100px;
        color: #DB3600;
    }
    legend{
        text-align: center;
    }
    .information ul{
        list-style-type: none;
    }
    input[type="text"]{
        width: 300px;
        height: 40px;
        padding-left: 10px;
    }
    input[type="button"]{
        width: 100px;
        height: 30px;
        background-color: #363636;
        border-radius: 5%;
        color: white;
    }
    input[type="password"],input[type="email"]{
        width: 300px;
        height: 40px;
        padding-left: 10px;
    }
    input[type="submit"], input[type="reset"]{
        width: 200px;
        height: 40px;
        background-color: #363636;
        color: white;
        font-weight: bold;
        font-size: 20px;
        cursor: pointer;
    }
    #commit{
        text-align: center;
        margin-bottom: 100px;
    }
    #useTerms{
    	display: none;
    	border: 1px solid #DB3600;
    }
    #useTerms{
    	margin: auto;
    	margin-top: 5px;
    	margin-bottom: 5px;
    	width: 500px;
  
    }
    input[type=radio]{
    	margin-left:40%;
    }
    #detail{
    	cursor:pointer;
    }
    #detail:hover{
    	text-decoration: underline;
    }
    #dtl{
    	cursor:pointer;
    }
    input{
    	outline:none;
    }
    input[type="text"],input[type="password"],input[type="email"]{
    	transition: .3s;
    	outline:none;
    	border-radius:100px
    }
     input[type="text"]:focus,input[type="password"]:focus,input[type="email"]:focus{
    	border-radius:0px
    }
    #inb{
   	    left: 305px;
	    position: relative;
	    top: -63px;
	    height: 40px;
    }
    #inb>button{
    	widht:100px;
   	 	height:42px;
    }
 </style>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="false"/>
   	<form action="/joinAction" method="post" autocomplete="off" >
    <fieldset class="information">
    <legend style="color: #DB3600; font-size: 30px;">회원가입</legend>
    	<ul>
    		<li>성함</li>
        	<li><input type="text" name="name" placeholder="성함" maxlength="15" minlength="3" required/></li>	
        </ul>
        <br/>
        <ul id="join_info">
            <li>
                <label for="join_id">아이디<span class="essential"></span></label><br>
                <input type="text" id="join_id" name="id" placeholder="아이디 입력(6~12자)" minlength="6" maxlength="12" required><br><br>
                <p style="color:red" id="id_error">　</p>
            </li>
            <li>
                <label for="change_pw">비밀번호</label><br>
                <input type="password" id="change_pw" name="password" required placeholder="비밀번호 입력(8~14자)" minlength="8" maxlength="14"><p id="pwMsg">　</p><br>
                <label for="change_pw">비밀번호 확인</label><br>
                <input type="password" id="change_pwc"  required placeholder="비밀번호 확인"> <p id="pwcMsg">　</p><br/>
            </li>
        </ul>
        
        <ul id="privacy">
            <li>
                <label for="email">이메일</label><br>
                <input type="email" id="email" name="email" class="email" placeholder="이메일" required>
                <button type="button" onclick="email_(this)" id="inb">이메일 인증하기</button>
                <p id='success'></p>
            </li>
            <li>
                <label for="nickname">닉네임</label><br>
                <input type="text" id="nickname" name="nickname" class="nickname" placeholder="닉네임" minlength="2" maxlength="6" required>
                <p id="nickMsg">　</p>
            </li>
            <li style="margin-top:43px;">
            	<h3>캐릭터 선택</h3>
            	<table>
            	<tr>
	            	<% for(int i=0; i<=6;i++){ %>
	            	<td>
	                	<label for="cha<%=i%>"><img src="/img/character/cha<%=i%>.png" /></label>
	                </td>
		        	<%} %>
		        </tr>
		        <tr>
		        <% for(int i=0; i<=6;i++){ %>
		                <td>
		                	<input type="radio" id="cha<%=i%>" name="character" value="<%=i%>" class="character" required style="margin-left:40%" <%if(i==0){ %> checked <%} %>>
		                </td>
                <%} %>
                </tr>
                </table>
            </li>
        </ul><br><br/>
        <div id="commit">
        	<input name="commit" type="checkbox" required id="lid"/> <label for=lid id="dtl">개인정보 수집 및 이용</label>
        	<div id="terms">이용 약관&emsp;<span id="detail">[자세히 보기]</span></div>
       			<ul id="useTerms">
       				<li>회원가입내의 내용은 정보이용 목적으로 수집합니다.</li>
       				<li>휴면계정으로 전환 시 삭제합니다.</li>
       				<li>개인정보 유효기간은 1년으로 설정합니다.</li>
       			</ul>
        	<input type="submit" value="가입">&emsp;
        	<input type="reset" value="취소">
        </div>
	</fieldset>
        </form>
<jsp:include page="../include/footer.jsp" flush="false" />

</body>
<script type="text/javascript" src="/js/passwordCheck.js"></script>
<script>	
	var email=false, name=false, password=false, passwordc=false,id_check=false,nickname_check=false,email_not_using=false;

	// 이메일 정규식
	var eMailCheck =  RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);

	var $nick_msg = $("#nickMsg");
	var $nickname = $("#nickname");
	var nick_test = RegExp(/^[a-zA-Z0-9가-힣]*$/);
	
	$nickname.keyup(function () {
		if (nick_test.test($nickname.val())) {
			if ($nickname.val()=="") {
				$nick_msg.text("닉네임을 입력해주세요.").css({"color":"red"});
			} else if (2 > $nickname.val().length || $nickname.val().lengt > 6) {
				$nick_msg.text("2 ~ 6자리 미만만 가능합니다.").css({"color":"red"});
			} else {
				selectNick();
			}
		} else {
			$nick_msg.text("사용 불가능합니다.").css({"color":"red"});
		}
	})
	
	function selectNick(){
		$.ajax({
            url: "/ajax/selectNickname",
            data: { nickname: $nickname.val() },
            type: "POST",
            dataType: "json" ,
            success:function(data) {
               if(data=="0"){
                  $nick_msg.text("사용 가능 닉네임 입니다").css({"color":"green"});
                  nickname_check=true;
               } else {
                  $nick_msg.text("이미 사용중인 닉네임 입니다").css({"color":"red"});
                  nickname_check=false;
              }
            },
             error : function(xhr, status, error) {
                alert('오류가 발생하였습니다.');
             }
        }) //ajax
    }

	var $email = $("#email");
	 
	$email.keyup(function() {
		if(eMailCheck.test($email.val())) {
			
			$.ajax({
			    url: "/ajax/selectEmail",
			    data: { email: $email.val() },
			    type: "POST",
			    dataType: "json" ,
			    success:function(data) {
				    if(data=="0") {
				    	$('#success').text('사용 가능한 이메일 입니다').css({"color":"green"});
				    	email=true;
				    	email_not_using=true;
				    } else {
					    $("#success").text("이미 사용중인 이메일 입니다").css({"color":"red"});
					}
			    },
	           error : function(xhr, status, error) {
	               emil=false;
	        	   alert('오류가 발생하였습니다.');
	           }
			}) //ajax
		} else {
			$("#success").text("이메일 형식을 확인해 주세요").css({"color":"red"});
			email=false;
		}
	});
	
	function email_(e) {
		if(eMailCheck.test($("#email").val())&&email_not_using) {
			alert("메일로 코드를 보내 드렸습니다.");
			$(e).attr('disabled','true');
			$('#email').attr('readonly',true);
		} else {
			email = false;
			alert("입력하신 메일을 확인해주세요");
			return false;
		}
		$.ajax({
		    url: "/ajax/email_code", 
		    data: { email: $("#email").val() }, 
		    type: "POST",                       
		    dataType: "json" ,                  
		    success:function(args) {
			    $('#email').after('<br/>');
		    	$(e).append(" <br/><input id='email_code' maxlength='7' type='text' placeholder='인증 코드를 입력해주세요'/>  <button onclick='email_check()' type='button'>입력 완료</button>")
			},
           error : function(xhr, status, error) {
        	   alert('오류가 발생하였습니다.');
           }
		}) //ajax
	}

	function email_check() {
		$.ajax({
		    url: "/ajax/email_code_check", 			
		    data: { code: $('#email_code').val() }, 
		    type: "POST",                             
		    dataType: "json" ,                        
		    success:function(args) {
			    if(args=="") {
			    	$('#email_code').attr('readonly', true);
			    	$('#success').text('이메일 인증에 성공하였습니다.').css("color","green");
			    	$('#inb').remove();
			    	email=true;
			    } else {
					alert(args);
					email=false;
				}
		    },
           error : function(xhr, status, error) {
               emil=false;
        	   alert('오류가 발생하였습니다.');
           }
		}) //ajax
	}
	
	   $("form").submit(function(e){
	      if(email&&name&&password&&passwordc&&id_check&&nickname_check){
	         return true;
	      } else {
	         e.preventDefault();
	         alert("입력값을 확인해주세요");
	         return false;
	      }
	   })

		$('#detail').click(function(){
		   $('#useTerms').toggle();
		})
	   
	   // 아이디 정규식
	   var idCheck = RegExp(/^[A-Za-z0-9_]{5,12}$/);                  //영어 + 숫자 정규식 (5~12자 입력 가능)
	   var id2Check = RegExp(/[~!@#$%^&*()_+|<>?:{}ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);      //특수문자 + 한글 정규식 (아이디에 특수문자와 한글을 거르기 위함)
	   var $id = $('#join_id');
	   var $id_error = $('#id_error');

	   $id.keyup(function() {
	      if (id2Check.test($id.val())){
	         $id_error.text("특수문자와 한글은 사용불가합니다.").css({"color":"red"});
	         id_check=false;
	      } else if($id.val().length < 6 || $id.val().length > 20) {
	         $id_error.text("6에서 20자 사이로 입력해주세요").css({"color":"red"});
	         id_check=false;
	      } else {
	         $.ajax({
	             url: "/ajax/ID_check", 
	             data: { id: $id.val() },
	             type: "POST",           
	             dataType: "json" ,      
	             success:function(args){
	                if(args==0){
	                   $id_error.text("사용 가능 아아디 입니다").css({"color":"green"});
	                   id_check=true;
	                } else {
	                   $id_error.text("이미 사용중인 아아디 입니다").css({"color":"red"});
	                   id_check=false;
	               }
	             },
	              error : function(xhr, status, error) {
	                 alert('오류가 발생하였습니다.');
	              }
	         }) //ajax
	       } //if~else
	   })

</script>
</html>