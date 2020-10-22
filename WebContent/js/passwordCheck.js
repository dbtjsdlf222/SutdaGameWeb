/**
 * SUN
 */
   // 비밀번호 정규식
   var pwCheck = RegExp(/(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,20}).{8,20}$/); //숫자 + 특수문자 + 영어 정규식 (숫자,특수문자,영어를 1개이상 들어가고 8~20자 이하)
   var $pw = $('#change_pw'); 
   var $pwc = $('#change_pwc');
   var $pw_error = $('#pwMsg');
   var $pwc_error = $('#pwcMsg');
   var password=false, passwordc=false;

   $pw.keyup(function() {
      $pw_error.text("8~20자 영대 소문자 , 숫자, 특수문자를 포함해야 합니다.").css({"display":"block","color":"red"});
      if (pwCheck.test($pw.val())){
         $pw_error.text("사용 가능한 비밀번호 입니다.").css({"color":"green"});
         password=true;
      }
      if($pw.val()==""){
         $pw_error.text("필수 입력입니다.").css({"color":"red"});
         password=false;
      }
   }); 

   $pwc.keyup(function() {
      $pwc_error.text("비밀번호가 일치하지 않습니다.");
      if ($pw.val()==$pwc.val()){
         $pwc_error.text("비밀번호가 일치합니다.").css({"color" : "green"});
         passwordc=true;
      } else {
    	   $pwc_error.text("비밀번호가 일치 하지 않습니다.").css({"color" : "red"});
    	   passwordc=false;
	  }
      if($pw.val()=="") {
         $pw_error.text("필수 입력입니다.");
         passwordc=false;
      }
   });