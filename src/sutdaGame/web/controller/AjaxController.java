package sutdaGame.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.CommentService;
import sutdaGame.web.service.PlayerService;
import sutdaGame.web.util.JsonUtil;
import sutdaGame.web.vo.CommentVO;
import sutdaGame.web.vo.Page;
import sutdaGame.web.vo.PlayerVO;

@Controller @RequestMapping("/ajax")
public class AjaxController {
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	PlayerService playerService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping(path="ID_check",method = RequestMethod.POST)
	public ResponseEntity<String> idCheck(HttpSession session,@RequestParam String id) throws JsonProcessingException {
		try {
			System.out.println(id);
			return JsonUtil.convertToResponseEntity(playerService.selectID(id));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.convertToResponseEntity(false);
	} //
	
	@RequestMapping(path="selectRecomment",method = RequestMethod.POST, params= {"no","p"})
	public ResponseEntity<String> selectRecoment(HttpSession session,int no,int p) throws JsonProcessingException {
		try {
			return JsonUtil.convertToResponseEntity(commentService.selectReComment(no, new Page(10,5,p)));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.convertToResponseEntity(false);
	} //
	@RequestMapping(path="selectComment",method = RequestMethod.POST)
	public ResponseEntity<String> selectComent(HttpSession session,@RequestParam int no,@RequestParam(defaultValue = "1") int p) throws JsonProcessingException {
		try {
			return JsonUtil.convertToResponseEntity(commentService.selectByBoardNo(no, new Page(10,5,p)));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.convertToResponseEntity(false);
	} //
	
	@RequestMapping(path="commentReInsert",method = RequestMethod.POST,params = {"no","content"})
	public ResponseEntity<String> commentReInsert(HttpSession session,CommentVO comment) throws JsonProcessingException {
		try {
			PlayerVO pvo = (PlayerVO)session.getAttribute("loginInfo");
			comment.setPlayer(pvo);
			return JsonUtil.convertToResponseEntity(commentService.insertReply(comment));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.convertToResponseEntity(false);
	} //
	
	@RequestMapping(path="commentInsert",method = RequestMethod.POST,params = {"boardNo","content"})
	public ResponseEntity<String> commentInsert(HttpSession session, CommentVO cvo) throws JsonProcessingException {
		try {
			PlayerVO pvo = (PlayerVO)session.getAttribute("loginInfo");
			cvo.setPlayer(pvo);
			return JsonUtil.convertToResponseEntity(commentService.insertComment(cvo));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.convertToResponseEntity(false);
	} //
		
		
		
} //MainController class 
