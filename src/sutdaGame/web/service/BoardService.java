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
	
	public void insertBoard(BoardVO boardVO) 	{ boardDAO.QAinsertBoard(boardVO); }
	public void updateBoard(BoardVO boardVO)	{ boardDAO.QAupdateBoard(boardVO); }
	public ArrayList<BoardVO> selectBoardList(int kind) { return boardDAO.QAselectBoardList(); }
	public BoardVO selectOntBoard(int no) { return boardDAO.QAselectOneBoard(no); }
	public void deleteBoard(int no) 	  	{ boardDAO.QAdeleteBoard(no); }
	
} //class