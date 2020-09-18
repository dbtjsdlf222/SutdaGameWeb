package project.qrpay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.qrpay.service.BoardService;

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
		mav.addObject("boardList", boardService.selectBoardList());
		return mav;
	}
	
	@RequestMapping("board")
	public ModelAndView board(int no) {
		ModelAndView mav = new ModelAndView("board/view");
		mav.addObject("post",boardService.selectOntBoard(no));
		return mav;
	}
	
}