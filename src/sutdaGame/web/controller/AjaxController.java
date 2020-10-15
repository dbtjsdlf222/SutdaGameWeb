package sutdaGame.web.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.CommentService;
import sutdaGame.web.service.LikeService;
import sutdaGame.web.service.PlayerService;
import sutdaGame.web.util.JsonUtil;
import sutdaGame.web.vo.CommentVO;
import sutdaGame.web.vo.Page;
import sutdaGame.web.vo.PlayerVO;

@Controller @RequestMapping("/ajax")
public class AjaxController {
	
	@Autowired JavaMailSender mailSender;
	@Autowired PlayerService playerService;
	@Autowired BoardService boardService;
	@Autowired CommentService commentService;
	@Autowired LikeService likeService;
	
	@RequestMapping(path="likeBoard",method = RequestMethod.POST)
	public ResponseEntity<String> likeBoard(@RequestParam int no, HttpSession session) throws IOException {
		
		PlayerVO vo = new PlayerVO();
		vo = (PlayerVO)session.getAttribute("loginInfo");
		HashMap<String, Integer> params = new HashMap<String, Integer>();
		System.out.println(vo.getNo());
		params.put("boardNo", no);
		params.put("playerNo", vo.getNo());
		
		if(likeService.playerCheck(params) == 0)
		     { likeService.insertLike(params); }
		else { likeService.deleteLike(params); }
		
		return JsonUtil.convertToResponseEntity(likeService.selectCount(no));
		
	} //likeInsert()
	
	@RequestMapping(path="ID_check",method = RequestMethod.POST)
	public ResponseEntity<String> idCheck(HttpSession session,@RequestParam String id) throws JsonProcessingException {
		try {
			return JsonUtil.convertToResponseEntity(playerService.selectID(id));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.convertToResponseEntity(false);
	}
	
	@RequestMapping(path="selectRecomment",method = RequestMethod.POST, params= {"no","p"})
	public ResponseEntity<String> selectRecoment(HttpSession session,int no,int p) throws JsonProcessingException {
		try {
			return JsonUtil.convertToResponseEntity(commentService.selectReComment(no, new Page(10,5,p)));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.convertToResponseEntity(false);
	}
	
	@RequestMapping(path="selectComment",method = RequestMethod.POST)
	public ResponseEntity<String> selectComent(HttpSession session,@RequestParam int no,@RequestParam(defaultValue = "1") int p) throws JsonProcessingException {
		try {
			return JsonUtil.convertToResponseEntity(commentService.selectByBoardNo(no, new Page(10,5,p)));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.responseStatusBadRequest("error");
	}
	
	@RequestMapping(path="commentReInsert",method = RequestMethod.POST,params = {"no","content"})
	public ResponseEntity<String> commentReInsert(HttpSession session,CommentVO comment) throws JsonProcessingException {
		try {
			PlayerVO pvo = (PlayerVO)session.getAttribute("loginInfo");
			comment.setPlayer(pvo);
			return JsonUtil.convertToResponseEntity(commentService.insertReply(comment));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return JsonUtil.responseStatusBadRequest("error");
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
		return JsonUtil.responseStatusBadRequest("로그인 해주세요");
	}
		
	@RequestMapping(path="commentDelete",method = RequestMethod.POST,params = {"no","orderNo"})
	public ResponseEntity<String> commentSelect(HttpSession session, CommentVO vo) throws JsonProcessingException {
		try {
			if(commentService.selectOneComment(vo.getNo()).getPlayer().getNo() == ((PlayerVO)session.getAttribute("loginInfo")).getNo()) {
				
			}
		} catch (NullPointerException e) {
			return JsonUtil.responseStatusBadRequest("삭제된 댓글입니다.");
		}
			commentService.deleteComment(vo);
			PlayerVO pvo = (PlayerVO)session.getAttribute("loginInfo");
			
		return JsonUtil.convertToResponseEntity(false);
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
		
} //MainController class 
