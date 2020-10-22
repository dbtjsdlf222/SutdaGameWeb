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
        color: #0A4600;
    }
    legend{
        text-align: center;
        font-size: 30px;
        color: #0A4600;
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
        background-color: #0A4600;
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
        background-color: #0A4600;
        color: white;
        font-weight: bold;
        font-size: 20px;
        cursor: pointer;
    }
    #commit{
        text-align: center;
    }
    #useTerms{
    	display: none;
    	border: 1px solid #0A4600;
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
    	margin-top:10px;
    	height:40px;
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
    <legend>회원가입</legend>
    	<ul>
    		<li>이름</li>
        	<li><input type="text" placeholder="이름" maxlength="15" minlength="3" required/></li>	
        </ul>
        <ul id="join_info">
            <li>
                <label for="join_id">아이디<span class="essential"></span></label><br>
                <input type="text" id="join_id" name="id" placeholder="아이디 입력(6~12자)" minlength="6" maxlength="12" required><br><br>
                <p style="color:red" id="id_error">　</p>
            </li>
            <li>
                <label for="join_pw">비밀번호</label><br>
                <input type="password" id="join_pw" name="password" required placeholder="비밀번호 입력(8~14자)" minlength="8" maxlength="14"><p id="pwMsg">　</p><br>
                <input type="password" id="join_pwc"  required placeholder="비밀번호 확인"> <p id="pwcMsg">　</p><br/>
            </li>
        </ul>
        
        <ul id="privacy">
            <li>
                <label for="email">이메일</label><br>
                <input type="email" id="email" name="email" class="email" placeholder="이메일" required>
                <button type="button" onclick="email_(this)" id="inb">이메일 인증하기</button>
                <p id='success'></p>
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
		                	<input type="radio" id="cha<%=i%>" name="character" class="character" required style="margin-left:40%">
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
<script>	
	var email=false, name=false, password=false, passwordc=false;

	// 이메일 정규식
	var eMailCheck =  RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
	var email_btn = true;
	
	function email_(e) {
		if(eMailCheck.test($("#email").val())) {
			alert("메일로 코드를 보내 드렸습니다.");
			$(e).attr('disabled','true');
			$('#email').attr('readonly',true);
		} else {
			email = false;
			alert("메일을 형식을 확인해주세요");
			return false;
		}
		email_btn = false;
		$.ajax({
		    url: "/ajax/email_code", // 클라이언트가 요청을 보낼 서버의 URL 주소
		    data: { email: $("#email").val() },                // HTTP 요청과 함께 서버로 보낼 데이터
		    type: "POST",                             // HTTP 요청 방식(GET, POST)
		    dataType: "json" ,                        // 서버에서 보내줄 데이터의 타입
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
		    url: "/ajax/email_code_check", 				// 클라이언트가 요청을 보낼 서버의 URL 주소
		    data: { code: $('#email_code').val() }, 	// HTTP 요청과 함께 서버로 보낼 데이터
		    type: "POST",                             	// HTTP 요청 방식(GET, POST)
		    dataType: "json" ,                        	// 서버에서 보내줄 데이터의 타입
		    success:function(args) {
			    if(args==""){
		    	$('#email_code').attr('readonly', true);
		    	$('#success').text('이메일 인증에 성공하였습니다.').css("color","green");
		    	$('#inb').remove();
		    	email=true;
			    }else{
					alert(args);
				}
		    },
           error : function(xhr, status, error) {
        	   alert('오류가 발생하였습니다.');   
           }
		}) //ajax
	}
	
	var ok=false;
	   $("form").submit(function(e){
	      if(ok){
	         return true;
	      } else {
	         e.preventDefault();
	         return false;
	      }
	   })

		$('#detail').click(function(){
		   $('#useTerms').toggle();
		})
	   
	   $("form").submit(function() {
	      var result='';

	      if($("#join_pw").val()!=("#join_pwc").val()) {
	         alert("비밀번호를 확인해주세요");
	         return false;
	      }
	   
	      var arr = [ 'email' ];
	      for(var i=0; i < 3; i++) {

	           result='';
	           
	         $('.'+arr[i]).map(function() {
	            result +=$(this).val();
	         });

	         $('input[name='+arr[i]+']').val(result);
	      }
	   });

	   // 아이디 정규식
	   var idCheck = RegExp(/^[A-Za-z0-9_]{5,12}$/);                  //영어 + 숫자 정규식 (5~12자 입력 가능)
	   var id2Check = RegExp(/[~!@#$%^&*()_+|<>?:{}ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);      //특수문자 + 한글 정규식 (아이디에 특수문자와 한글을 거르기 위함)
	   var $id = $('#join_id');
	   var $id_error = $('#id_error');

	   $id.keyup(function() {
	      
	      if (id2Check.test($id.val())){
	         $id_error.text("특수문자와 한글은 사용불가합니다.").css({"color":"red"});
	         ok=false;
	      } else if($id.val().length < 6 || $id.val().length > 20) {
	         $id_error.text("6에서 20자 사이로 입력해주세요").css({"color":"red"});
	         ok=false;
	      } else {
	         $.ajax({
	             url: "/ajax/ID_check", // 클라이언트가 요청을 보낼 서버의 URL 주소
	             data: { id: $id.val() },                // HTTP 요청과 함께 서버로 보낼 데이터
	             type: "POST",                             // HTTP 요청 방식(GET, POST)
	             dataType: "json" ,                        // 서버에서 보내줄 데이터의 타입
	             success:function(args){
	                if(args==0){
	                   $id_error.text("사용 가능 아아디 입니다").css({"color":"green"});
	                   ok=true;
	                } else {
	                   $id_error.text("사용중인 아아디 입니다").css({"color":"red"});
	                   ok=false;
	               }
	             },
	              error : function(xhr, status, error) {
	                 alert('오류가 발생하였습니다.');
	              }
	         }) //ajax
	       } //if~else
	   })

	   // 비밀번호 정규식
	   var pwCheck = RegExp(/(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,20}).{8,20}$/); //숫자 + 특수문자 + 영어 정규식 (숫자,특수문자,영어를 1개이상 들어가고 8~20자 이하)
	   var $pw = $('#join_pw'); 
	   var $pwc = $('#join_pwc');
	   var $pw_error = $('#pwMsg');
	   var $pwc_error = $('#pwcMsg');
	   var email=false, name=false, password=false, passwordc=false;
	   
	   $pw.keyup(function() {
	      $pw_error.text("8~20자 영대 소문자 , 숫자, 특수문자를 포함해야 합니다.").css({"display":"block","color":"red"});
	      if (pwCheck.test($pw.val())){
	         $pw_error.text("사용 가능한 비밀번호 입니다.").css({"color":"green"});
	      }
	      if($pw.val()==""){
	         $pw_error.text("필수 입력입니다.").css({"color":"red"});
	      }
	   }); 

	   $pwc.keyup(function() {
	      $pwc_error.text("비밀번호가 일치하지 않습니다.");
	      if ($pw.val()==$pwc.val()){
	         $pwc_error.text("비밀번호가 일치합니다.").css({"color" : "green"});
	      } else {
	    	   $pwc_error.text("비밀번호가 일치 하지 않습니다.").css({"color" : "red"});
		  }
	      if($pw.val()=="") {
	         $pw_error.text("필수 입력입니다.");
	      }
	   });
	      
</script>
</html>