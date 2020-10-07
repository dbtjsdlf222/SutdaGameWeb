package sutdaGame.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.vo.BoardVO;
import sutdaGame.web.vo.OwnerVO;

@Controller @RequestMapping("board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/")
	public String main() {
		return "redirect:boardList";
	}
	
	@RequestMapping("boardList")
	public ModelAndView boardList() {
		ModelAndView mav = new ModelAndView("board/boardList");
		mav.addObject("boardList", boardService.QAselectBoardList());
		mav.addObject("FQboardList", boardService.FQselectBoardList());
		return mav;
	}
	
	@RequestMapping("board")
	public ModelAndView board(int no) {
		ModelAndView mav = new ModelAndView("board/view");
		mav.addObject("post",boardService.QAselectOntBoard(no));
		return mav;
	}
	
	@RequestMapping("write")
	public String write() {		
		return "board/write";
	}
	
	@RequestMapping("QAinsertBoard")
	public String insertBoard(String title, String content, HttpSession session) {
		
		OwnerVO vo = (OwnerVO)session.getAttribute("loginInfo");
		
		BoardVO bvo = new BoardVO();
		bvo.setTitle(title);
		bvo.setContent(content);
		bvo.setWriterNo(vo.getNo());
		
		boardService.QAinsertBoard(bvo);
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping("QAupdateBoard")
	public String updateBoard(String title, String content, int no, HttpSession session) {
		
		OwnerVO vo = (OwnerVO)session.getAttribute("loginInfo");
		
		BoardVO bvo = new BoardVO();
		bvo.setTitle(title);
		bvo.setContent(content);
		bvo.setWriterNo(vo.getNo());
		bvo.setNo(no);
		
		boardService.QAupdateBoard(bvo);
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping("QAdeleteBoard")
	public String deleteBoard(int no) {
		boardService.QAdeleteBoard(no);
		return "redirect:/board/boardList";
	}
	
}