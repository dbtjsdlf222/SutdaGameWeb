package project.qrpay.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.qrpay.dao.BoardDAO;
import project.qrpay.vo.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO boardDAO;
	
	public void insertBoard(BoardVO boardVO) 	{ boardDAO.insertBoard(boardVO); }
	public void updateBoard(BoardVO boardVO)	{ boardDAO.updateBoard(boardVO); }
	public ArrayList<BoardVO> selectBoardList() { return boardDAO.selectBoardList(); }
	public BoardVO selectOntBoard(int no) { return boardDAO.selectOneBoard(no); }
	public void deleteBoard(int no) 	  { boardDAO.deleteBoard(no); }

} //class

