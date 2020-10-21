package sutdaGame.web.controller;

import java.util.HashMap;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.CommentService;
import sutdaGame.web.service.LikeService;
import sutdaGame.web.util.RedirectWithAlert;
import sutdaGame.web.vo.BoardVO;
import sutdaGame.web.vo.Page;
import sutdaGame.web.vo.PlayerVO;

@Controller @RequestMapping("board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	LikeService likeService;
	@Autowired
	CommentService commentService;
	
	@RequestMapping("/")
	public String main() {
		return "redirect:../main";
	}
	
	@RequestMapping("view/{no}")
	public ModelAndView view(HttpSession session, @PathVariable int no, @RequestParam(defaultValue = "1") int p) {
		TreeSet<Integer> map = (TreeSet<Integer>)session.getAttribute("view");
		
		if(map==null){
			map = new TreeSet<Integer>();
			map.add(no);
			session.setAttribute("view", map);
			boardService.viewUP(no);
		} else if(!map.contains(no)) {
			boardService.viewUP(no);
			map.add(no);
			session.setAttribute("view", map);
		}
		Page page = new Page(10, 5, 1); //result 개수, 페이징 블록 수, 페이지 넘버
		
		ModelAndView mav = new ModelAndView("board/view");
		HashMap<String, Integer> params = new HashMap<String, Integer>();
		
		if(null==boardService.selectOntBoard(no)) {
			return new RedirectWithAlert("알림","없거나 삭제된 게시글 입니다.","/board/boardList");
		}
		PlayerVO player = (PlayerVO)session.getAttribute("loginInfo");
		params.put("boardNo",no);
		if(player!=null) {
			params.put("playerNo",player.getNo());
			mav.addObject("likeCheck", likeService.playerCheck(params));
		}
		
		mav.addObject("post"   , boardService.selectOntBoard(no));
		mav.addObject("comment", commentService.selectByBoardNo(no, page));	
		mav.addObject("page"   , page);
		mav.addObject("like"   , likeService.selectCount(no));
		mav.addObject("loginInfo", player);
		
		return mav;
	}

	@RequestMapping("update_form")
	public String updateForm(@RequestParam int no, Model model, HttpSession session) {
		model.addAttribute("post", boardService.selectOntBoard(no));
		return "board/update_form";
	}
	
	@RequestMapping("boardList")
	public ModelAndView boardList(@RequestParam int kind, @RequestParam(defaultValue = "1") int p) {
		String jsp = null;
		ModelAndView mav = new ModelAndView();
		switch(kind) {
			case 1: jsp = "board/notice"; break;
			case 2: jsp = "board/patch";  break;
			case 3: jsp = "board/event";  break;
			case 4: jsp = "board/download";  break;
			case 5: jsp = "board/guide";  break;
			case 6: jsp = "board/free";   break;
			case 7: jsp = "board/rank"; break;
			case 8: jsp = "board/QA";	  break;
			case 9: jsp = "board/FQ";	  break;
		}
		mav.setViewName(jsp);
		Page page = new Page(10,5,p);
		mav.addObject("boardList", boardService.selectBoardList(kind, page));
		mav.addObject("kind", kind);
		mav.addObject("page", page);
		return mav;
	}
	
	@RequestMapping("write")
	public String write(Model model,@RequestParam int kind) {
		model.addAttribute("kind", kind);
		return "board/write";
	}
	
	@RequestMapping(path="writeAction",params= {"title","content","kindNo"})
	public String writeAction(BoardVO boardVO, HttpSession session) {
		boardVO.setWriterNo(((PlayerVO)session.getAttribute("loginInfo")).getNo());
		boardService.insertBoard(boardVO);
		return "redirect:/board/boardList?kind="+boardVO.getKindNo();
	}
	
	@RequestMapping(path="update",params = {"title","content","no"},method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("post") BoardVO bvo, HttpSession session) {
		PlayerVO vo = (PlayerVO)session.getAttribute("loginInfo");
		if(boardService.selectOntBoard(bvo.getNo()).getWriterNo()!=vo.getNo()) {
			return new RedirectWithAlert("알림","잘못된 요청입니다.","/main");
		}
		boardService.updateBoard(bvo);
		return new ModelAndView("redirect:/board/boardList");
	}
	
	@RequestMapping("delete")
	public String deleteBoard(int no) {
		boardService.deleteBoard(no);
		return "redirect:/board/boardList";
	}
}