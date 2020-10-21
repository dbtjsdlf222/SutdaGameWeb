package sutdaGame.web.util;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class SendMail {
	@Autowired JavaMailSender mailSender;
	
	public void mailSender(String email,String subject,StringBuffer sb) {
	    try {
		    String setfrom = "sutdaonline@gmail.com";
	    	MimeMessage message = mailSender.createMimeMessage(); //에러 발생
	        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom(setfrom); 							// 보내는사람 생략하면 정상작동을 안함
	        messageHelper.setTo(email);								// 받는사람 이메일
	        messageHelper.setSubject(subject); 	// 메일제목은 생략이 가능하다
	        messageHelper.setText(sb.toString(),true); 					// 메일 내용
	        mailSender.send(message);
	        
		 } catch (Exception e) {
		    e.printStackTrace();
		 }
	}
}
