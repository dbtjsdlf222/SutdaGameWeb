package sutdaGame.web.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.CommentService;
import sutdaGame.web.service.LikeService;
import sutdaGame.web.util.JsonUtil;
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
	CommentService commnetService;
	
	@RequestMapping("/")
	public String main() {
		return "redirect:../main";
	}
	
	@RequestMapping("view/{no}")
	public ModelAndView view(HttpSession session, @PathVariable int no, @RequestParam(defaultValue = "1") int p) {
		
		Page page = new Page(10, 5, 1); //result 개수, 페이징 블록 수, 페이지 넘버
		
		ModelAndView mav = new ModelAndView("board/view");
		HashMap<String, Integer> params = new HashMap<String, Integer>();
		
		if(null==boardService.selectOntBoard(no)) {
			return new RedirectWithAlert("알림","없거나 삭제된 게시글 입니다.","/board/boardList");
		}
		
		PlayerVO player = (PlayerVO)session.getAttribute("loginInfo");
		if(player!=null) {
			params.put("playerNo",player.getNo());
		}
		
		System.out.println(commnetService.selectByBoardNo(no, page));
		
		mav.addObject("post"   , boardService.selectOntBoard(no));
		mav.addObject("comment", commnetService.selectByBoardNo(no, page));
		mav.addObject("page"   , page);
		mav.addObject("like"   , likeService.selectCount(no));
		mav.addObject("likeCheck", likeService.playerCheck(params));
		
		return mav;
	}
	
	
	@RequestMapping("boardList")
	public ModelAndView boardList(@RequestParam int kind, @RequestParam(defaultValue = "1") int p) {
		String jsp = null;
		ModelAndView mav = new ModelAndView();
		switch(kind) {
			case 1: 
				jsp = "board/notice";
			break;
			case 2: 
				jsp = "board/patch";
			break;
			case 3: 
				jsp = "board/event";
			break;
			case 4: 
				jsp = "board/guide";
			break;
			case 5: 
				jsp = "board/free";
			break;
			case 6: 
				jsp = "board/screen";
			break;
			case 7: 
				jsp = "board/QA";
			break;
			case 8: 
				jsp = "board/FQ";
			break;
		}
		mav.setViewName(jsp);
		mav.addObject("boardList", boardService.selectBoardList(kind, new Page(5,5,p)));
		System.out.println(boardService.selectBoardList(kind, new Page(5,5,p)));
		return mav;
	}
	
	/*AJax*/
	@RequestMapping("boardListAJax")
	public String boardListAJax(@RequestParam int kindNo,@RequestParam(defaultValue = "1") int p) throws JsonProcessingException {
		return JsonUtil.convertToJsonString(boardService.selectBoardList(kindNo,new Page(5,5,p)));
	}
	
	@RequestMapping("write")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping(path="writeAction",params= {"title","content","kindNo"})
	public void writeAction(BoardVO boardVO, HttpSession session) {
		boardVO.setWriterNo(((PlayerVO)session.getAttribute("loginInfo")).getNo());
		boardService.insertBoard(boardVO);
	}
	
	@RequestMapping(path="insertBoard",params = {"title","content"})
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
	
	/*aAjax*/
	@RequestMapping("like")
	public ResponseEntity<String> likeInsert(@RequestParam int no, HttpSession session) throws IOException {
		
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
}