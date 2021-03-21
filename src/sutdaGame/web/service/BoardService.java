package sutdaGame.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sutdaGame.web.dao.BoardDAO;
import sutdaGame.web.vo.BoardVO;
import sutdaGame.web.vo.Page;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO boardDAO;
	
	public ArrayList<BoardVO> selectBoardList(int kindNo, Page page) {
		page.initTotal(boardDAO.boardCount(kindNo)); 
		return boardDAO.selectBoardList(kindNo,page); 
	}
	public void viewUP(int no) { boardDAO.viewUP(no); }
	public BoardVO selectOntBoard(int no) 	{
		
		BoardVO vo = boardDAO.selectOneBoard(no);
		
		vo.setContent(vo.getContent().replaceAll("&lt;", "<"));
		vo.setContent(vo.getContent().replaceAll("<script", "&lt;script"));
		vo.setContent(vo.getContent().replaceAll("&gt;", ">"));
		vo.setContent(vo.getContent().replaceAll("&quot;", "\""));
		
		return vo; 
	}
	public int boardCount(int kindNo) { return boardDAO.boardCount(kindNo); }
	public void insertBoard(BoardVO boardVO) 	{
		boardDAO.insertBoard(boardVO); 
	}
	public void updateBoard(BoardVO boardVO)	{ boardDAO.updateBoard(boardVO); }
	public void deleteBoard(int no) 	  	{ boardDAO.deleteBoard(no); }
	
} //class