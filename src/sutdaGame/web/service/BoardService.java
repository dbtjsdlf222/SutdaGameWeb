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
	
	public void insertBoard(BoardVO boardVO) 	{ boardDAO.insertBoard(boardVO); }
	public void updateBoard(BoardVO boardVO)	{ boardDAO.updateBoard(boardVO); }
	public ArrayList<BoardVO> selectBoardList(int kindNo) { return boardDAO.selectBoardList(kindNo); }
	public BoardVO selectOntBoard(int no) 	{ return boardDAO.selectOneBoard(no); }
	public void deleteBoard(int no) 	  	{ boardDAO.deleteBoard(no); }
	
} //class