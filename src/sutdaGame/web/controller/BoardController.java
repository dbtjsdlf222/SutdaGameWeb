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
import sutdaGame.web.service.PlayerService;
import sutdaGame.web.util.LimitTimer;
import sutdaGame.web.util.RedirectWithAlert;
import sutdaGame.web.vo.BoardVO;
import sutdaGame.web.vo.Page;
import sutdaGame.web.vo.PlayerVO;

@Controller @RequestMapping("board")
public class BoardController {
	
	@Autowired BoardService boardService;
	@Autowired LikeService likeService;
	@Autowired CommentService commentService;
	@Autowired PlayerService playerService;
	
	@RequestMapping("/")
	public String main() {
		return "redirect:../main";
	}
	
	@RequestMapping("view/{no}")
	public ModelAndView view(HttpSession session, @PathVariable int no, @RequestParam(defaultValue = "1") int p) {
		TreeSet<Integer> map = (TreeSet<Integer>)session.getAttribute("view");
		
		if(map==null) {
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
		int myComment = 0;
	      PlayerVO vo = null;
	         if((vo=(PlayerVO)session.getAttribute("loginInfo")) != null) {
	            myComment = vo.getNo();
	         }
		mav.addObject("post"   , boardService.selectOntBoard(no));
		mav.addObject("comment", commentService.selectByBoardNo(no, page, myComment));
		mav.addObject("page"   , page);
		mav.addObject("like"   , likeService.selectCount(no));
		mav.addObject("loginInfo", player);
		
		if(session.getAttribute("loginInfo") == null) {
			mav.addObject("admin", false);	
		} else {
			mav.addObject("admin", ((PlayerVO)session.getAttribute("loginInfo")).isAdmin());
		}
		return mav;
	}

	@RequestMapping("update_form")
	public String updateForm(@RequestParam int no, Model model, HttpSession session) {
		PlayerVO pvo = (PlayerVO)session.getAttribute("loginInfo");
		BoardVO  bvo = boardService.selectOntBoard(no);
		if(bvo.getWriterNo().equals(pvo.getNo())) {
			model.addAttribute("post", boardService.selectOntBoard(no));
			return "board/update_form";
		} else {
			return "error/500";
		}
		
	}
	
	@RequestMapping("boardList")
	public ModelAndView boardList(@RequestParam int kind, @RequestParam(defaultValue = "1") int p, HttpSession session) {
		String jsp = null;
		ModelAndView mav = new ModelAndView();
		Page page = new Page(7,5,p);
		switch(kind) {
			case 1: jsp = "board/notice"; break;
			case 7: jsp = "redirect:board/rank"; break;
			case 10: jsp = "board/youtube";	page = new Page(9,5,p);  break;
			default: jsp = "board/notice";
		}
		mav.setViewName(jsp);
		
		mav.addObject("boardList",boardService.selectBoardList(kind, page) );
		mav.addObject("kind", kind);
		mav.addObject("page", page);
		if(session.getAttribute("loginInfo") == null) {
			mav.addObject("admin", "false");
		} else {
			mav.addObject("admin", ((PlayerVO)session.getAttribute("loginInfo")).isAdmin());
		}
		return mav;
	}
	
	@RequestMapping("rank")
	public String rank(Model model,@RequestParam(defaultValue = "1") int kind) {
		if(kind==1) { model.addAttribute("ranks", playerService.rankByRate());  } else 
		if(kind==2) { model.addAttribute("ranks", playerService.rankByMoney()); } else
				    { model.addAttribute("ranks", playerService.rankByRounds());}
		return "board/rank";
	}
	
	@RequestMapping("write")
	public String write(Model model,HttpSession session,@RequestParam int kind) {
		model.addAttribute("kind", kind);
		
		return "board/write";
	}
	
	@RequestMapping(path="writeAction",params= {"title","content","kindNo","csrf_token"})
	public String writeAction(BoardVO boardVO, HttpSession session, Model model)  {
		PlayerVO pvo = (PlayerVO)session.getAttribute("loginInfo");
		if(boardVO.getKindNo()==10) { //유튜브 게시판
			if(!pvo.isAdmin()) {
				return "redirect:error/500";
			}
			boardVO.getContent().replaceAll("https://www.youtube.com/watch?v= |http://www.youtube.com/watch?v=|https://youtu.be/", "");
		}
		boardVO.setWriterNo(pvo.getNo());
		
		if((LimitTimer.boardList.get(pvo.getNo())) == null) {
			LimitTimer.boardList.put(pvo.getNo(), 0);
			boardService.insertBoard(boardVO);
		} else {
			LimitTimer.boardList.put(pvo.getNo(), 0);
			model.addAttribute("message", "요청이 너무 많습니다. 잠시 후 시도해 주세요");
			model.addAttribute("redirect", "/board/boardlist");
			return "util/redirectWithAlert";
		}
		
		return "redirect:/board/boardList?kind="+boardVO.getKindNo();
	}
	
	@RequestMapping(path="update",params = {"title","content","no","csrf_token"},method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("post") BoardVO bvo, HttpSession session) {
		
		PlayerVO vo = (PlayerVO)session.getAttribute("loginInfo");
		
		if(boardService.selectOntBoard(bvo.getNo()).getWriterNo()==vo.getNo()||((PlayerVO)session.getAttribute("loginInfo")).isAdmin()) {
			boardService.updateBoard(bvo);
			return new ModelAndView("redirect:/board/view/"+bvo.getNo());
		} else {
			return new RedirectWithAlert("알림","잘못된 요청입니다.","/main");
		}
	}
	
	@RequestMapping("delete")
	public String deleteBoard(@RequestParam int no,@RequestParam(defaultValue = "1")int kind,Model model,HttpSession session) {
		boardService.deleteBoard(no);
		return "redirect:/board/boardList?kind="+kind;
	}
}