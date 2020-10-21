package sutdaGame.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.CommentService;
import sutdaGame.web.service.LikeService;
import sutdaGame.web.vo.BoardVO;
import sutdaGame.web.vo.PlayerVO;

@Controller @RequestMapping("comment")
public class CommentController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	LikeService likeService;
	@Autowired
	CommentService commnetService;
	@RequestMapping(path="insert",params = {"title","content"})
	public String insertBoard(String title, String content, HttpSession session) {
		
		PlayerVO vo = (PlayerVO)session.getAttribute("loginInfo");
		
		BoardVO bvo = new BoardVO();
		bvo.setTitle(title);
		bvo.setContent(content);
		bvo.setWriterNo(vo.getNo());
		
		boardService.insertBoard(bvo);
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(path="update",params = {"title","content","no"},method = RequestMethod.POST)
	public String updateBoard(@ModelAttribute("post") BoardVO bvo, HttpSession session) {
		PlayerVO vo = (PlayerVO)session.getAttribute("loginInfo");
		bvo.setWriterNo(vo.getNo());
		boardService.updateBoard(bvo);
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping("delete")
	public String deleteBoard(int no) {
		boardService.deleteBoard(no);
		return "redirect:/board/boardList";
	}
	
}