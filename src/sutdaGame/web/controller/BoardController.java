package sutdaGame.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;

import sutdaGame.web.service.BoardService;
import sutdaGame.web.service.LikeService;
import sutdaGame.web.util.JsonUtil;
import sutdaGame.web.vo.BoardVO;
import sutdaGame.web.vo.PlayerVO;

@Controller @RequestMapping("board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	LikeService likeService;
	
	@RequestMapping("/")
	public String main() {
		return "redirect:boardList";
	}
	
	@RequestMapping("boardList")
	public ModelAndView boardList(@RequestParam int kind) {
		ModelAndView mav = new ModelAndView("board/boardList");
		mav.addObject("boardList", boardService.selectBoardList(kind));
		return mav;
	}
	
	@RequestMapping("boardListAJax")
	public String boardListAJax(@RequestParam int kind) throws JsonProcessingException {
		return JsonUtil.convertToJsonString(mav.addObject("boardList", boardService.selectBoardList(kind)));
	}
	
	@RequestMapping("board")
	public ModelAndView board(int no) {
		ModelAndView mav = new ModelAndView("board/view");
		mav.addObject("post",boardService.selectOntBoard(no));
		return mav;
	}
	
	@RequestMapping("write")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping("writeAction")
	public void writeAction(String title, String content) {
		System.out.println(title);
		System.out.println(content);
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
	
	@RequestMapping("updateBoard")
	public String updateBoard(String title, String content, int no, HttpSession session) {
		
		PlayerVO vo = (PlayerVO)session.getAttribute("loginInfo");
		
		BoardVO bvo = new BoardVO();
		bvo.setTitle(title);
		bvo.setContent(content);
		bvo.setWriterNo(vo.getNo());
		bvo.setNo(no);
		
		boardService.updateBoard(bvo);
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping("deleteBoard")
	public String deleteBoard(int no) {
		boardService.deleteBoard(no);
		return "redirect:/board/boardList";
	}
	
//	/*aAjax*/
//	@RequestMapping("like")
//	public ResponseEntity<String> likeInsert(@RequestParam int no, HttpSession session) throws IOException {
//		
//		PlayerVO vo = new PlayerVO();
//		vo = (PlayerVO)session.getAttribute("loginInfo");
//		HashMap<String, Integer> params = new HashMap<String, Integer>();
//		
//		params.put("boardNo", no);
//		params.put("playerNo", vo.getNo());
//		
//		if(likeService.userCheck(params) == 0)
//		     { likeService.insertLike(params); }
//		else { likeService.deleteLike(params); }
//		
//		return JsonUtil.convertToResponseEntity(likeService.selectCount(boardNo));
//		
//	} //like()
}