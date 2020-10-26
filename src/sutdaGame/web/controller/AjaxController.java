package sutdaGame.web.controller;

import java.io.IOException;
import java.security.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.CommentService;
import sutdaGame.web.service.LikeService;
import sutdaGame.web.service.PlayerService;
import sutdaGame.web.util.JsonUtil;
import sutdaGame.web.vo.CommentVO;
import sutdaGame.web.vo.Page;
import sutdaGame.web.vo.PlayerVO;

/**
 * @author SUN
 * 
 */
@Controller @RequestMapping("/ajax")
public class AjaxController {
	
	@Autowired JavaMailSender mailSender;
	@Autowired PlayerService playerService;
	@Autowired BoardService boardService;
	@Autowired CommentService commentService;
	@Autowired LikeService likeService;
	
	/*------ 게시판 Start------*/
	@RequestMapping(path="likeBoard",method = RequestMethod.POST)
	public ResponseEntity<String> likeBoard(@RequestParam int no, HttpSession session) throws IOException {
		
		PlayerVO vo = new PlayerVO();
		vo = (PlayerVO)session.getAttribute("loginInfo");
		HashMap<String, Integer> params = new HashMap<String, Integer>();
		params.put("boardNo", no);
		params.put("playerNo", vo.getNo());
		
		if(likeService.playerCheck(params) == 0)
		     { likeService.insertLike(params); }
		else { likeService.deleteLike(params); }
		
		return JsonUtil.convertToResponseEntity(likeService.selectCount(no));
	} //likeInsert()
	
	@RequestMapping(path="selectReComment",method = RequestMethod.POST, params= {"no","p"})
	public ResponseEntity<String> selectReComent(HttpSession session,int no,int p) throws JsonProcessingException {
		try {
			return JsonUtil.convertToResponseEntity(commentService.selectReComment(no, new Page(10,5,p)));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.convertToResponseEntity(false);
	}
	
	@RequestMapping(path="selectComment",method = RequestMethod.POST)
	public ResponseEntity<String> selectComent(HttpServletResponse res,HttpSession session,@RequestParam int no,@RequestParam(defaultValue = "1") int p) throws JsonProcessingException {
		try {
			return JsonUtil.convertToResponseEntity(commentService.selectByBoardNo(no, new Page(10,5,p)));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.responseStatusBadRequest(res ,"error");
	}
	
	@RequestMapping(path="selectEmail",method = RequestMethod.POST)
	public ResponseEntity<String> selectEmailt(HttpServletResponse res,HttpSession session,@RequestParam String email) throws JsonProcessingException {
		return JsonUtil.convertToResponseEntity(playerService.selectEmail(email));
	}
	
	@RequestMapping(path="selectNickname",method = RequestMethod.POST)
	public ResponseEntity<String> selectNickname(HttpServletResponse res,HttpSession session,@RequestParam String nickname) throws JsonProcessingException {
		return JsonUtil.convertToResponseEntity(playerService.selectNickname(nickname));
	}
	
	@RequestMapping(path="commentReInsert",method = RequestMethod.POST,params = {"no","content"})
	public ResponseEntity<String> commentReInsert(HttpServletResponse res,HttpSession session,CommentVO comment) throws JsonProcessingException {
		try {
			PlayerVO pvo = (PlayerVO)session.getAttribute("loginInfo");
			comment.setPlayer(pvo);
			return JsonUtil.convertToResponseEntity(commentService.insertReply(comment));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.responseStatusBadRequest(res,"error");
	}
	
	@RequestMapping(path="commentInsert",method = RequestMethod.POST, params = {"boardNo","content"})
	public ResponseEntity<String> commentInsert(HttpServletResponse res, HttpSession session, CommentVO cvo) throws JsonProcessingException {
		try {
			PlayerVO pvo = (PlayerVO)session.getAttribute("loginInfo");
			cvo.setPlayer(pvo);
			return JsonUtil.convertToResponseEntity(commentService.insertComment(cvo));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.responseStatusBadRequest(res,"로그인 해주세요");
	}
	
	@RequestMapping(path="commentDelete",method = RequestMethod.POST,params = {"no","orderNo"})
	public ResponseEntity<String> commentSelect(HttpServletResponse res,HttpSession session, CommentVO vo) throws JsonProcessingException {
		try {
			if(commentService.selectOneComment(vo.getNo()).getPlayer().getNo() == ((PlayerVO)session.getAttribute("loginInfo")).getNo()) {
				
			}
		} catch (NullPointerException e) {
			return JsonUtil.responseStatusBadRequest(res,"삭제된 댓글입니다.");
		}
			commentService.deleteComment(vo);
			
		return JsonUtil.convertToResponseEntity("");
	} //
	
	@RequestMapping(path="commentUpdate",method = RequestMethod.POST,params = {"no","orderNo","content"})
	public ResponseEntity<String> commentUpdate(HttpSession session, CommentVO cvo) throws JsonProcessingException {
		try {
			PlayerVO pvo = (PlayerVO)session.getAttribute("loginInfo");
			cvo.setPlayer(pvo);
			return JsonUtil.convertToResponseEntity(commentService.insertComment(cvo));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.convertToResponseEntity(false);
	}
	
	/**
	 * @author SUN 
	 * @param session
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(path="logout",method = RequestMethod.POST)
	public ResponseEntity<String> logout(HttpSession session) throws JsonProcessingException {
		session.removeAttribute("loginInfo");
		return JsonUtil.convertToResponseEntity("");
	}

	/**
	 * @author SUN
	 * @param session
	 * @param id
	 * @return 
	 * @throws JsonProcessingException
	 */
	/*-------회원가입-------*/
	@RequestMapping(path="ID_check",method = RequestMethod.POST)
	public ResponseEntity<String> idCheck(HttpSession session,@RequestParam String id) throws JsonProcessingException {
		try {
			return JsonUtil.convertToResponseEntity(playerService.selectID(id));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.convertToResponseEntity("");
	}
	
	/**
	 * 이메일 코드
	 * @author 이현호
	 * @author SUN
	 * @param session
	 * @param email
	 * @return ""
	 * @throws JsonProcessingException
	 */
	@RequestMapping(path="email_code",method = RequestMethod.POST)
	public ResponseEntity<String> commentUpdate(HttpSession session, String email) throws JsonProcessingException {
		//메일보내기
		Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
		StringBuffer sb = new StringBuffer();

		sb.append("<h1>섯다 가입인증 메일입니다.</h1>");
		sb.append("<hr>");
		sb.append("<h3>환영합니다.</h3>");
		sb.append("<h4>가입 인증 번호는 [<h1>"+ dice + "</h1>] 입니다.</h3>");
		sb.append("<hr>");
		String subject = "섯다 가입 인증 메일입니다.";
	    session.setAttribute("code", dice+"");
	    
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
	    
		return JsonUtil.convertToResponseEntity("");
	}
	
	/**
	 * 이메일 인증 코드 비교
	 * @author SUN
	 * @param res
	 * @param session
	 * @param code	사용자 입력코드
	 * @return ""
	 * @throws JsonProcessingException
	 */
	@RequestMapping(path="email_code_check",method = RequestMethod.POST)
	public ResponseEntity<String> emailCodeCheck(HttpServletResponse res,HttpSession session, String code) throws JsonProcessingException {
		try {
			String codeSession = (String)session.getAttribute("code");
			if(code.equals(codeSession)) {
				session.removeAttribute("code");
				return JsonUtil.convertToResponseEntity("");
			}
				
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.convertToResponseEntity("이메일 코드를 확인해주세요");
	}
		
} //MainController class 
