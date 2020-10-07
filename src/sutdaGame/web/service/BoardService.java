package sutdaGame.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sutdaGame.web.dao.BoardDAO;
import sutdaGame.web.vo.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO boardDAO;
	
	//고객의 소리
	public void QAinsertBoard(BoardVO boardVO) 	{ boardDAO.QAinsertBoard(boardVO); }
	public void QAupdateBoard(BoardVO boardVO)	{ boardDAO.QAupdateBoard(boardVO); }
	public ArrayList<BoardVO> QAselectBoardList() { return boardDAO.QAselectBoardList(); }
	public BoardVO QAselectOntBoard(int no) { return boardDAO.QAselectOneBoard(no); }
	public void QAdeleteBoard(int no) 	  	{ boardDAO.QAdeleteBoard(no); }
	
	//자주하는 질문
	public void FQdeleteBoard(int no) 	 		{ boardDAO.FQdeleteBoard(no); }
	public void FQinsertBoard(BoardVO boardVO) 	{ boardDAO.FQinsertBoard(boardVO); }
	public void FQupdateBoard(BoardVO boardVO)	{ boardDAO.FQupdateBoard(boardVO); }
	public ArrayList<BoardVO> FQselectBoardList() { return boardDAO.FQselectBoardList(); }

} //class