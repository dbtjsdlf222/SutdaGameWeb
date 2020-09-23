package project.qrpay.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import project.qrpay.vo.BoardVO;

public interface BoardDAO {
	
	//고객의 소리
	public void QAinsertBoard(BoardVO boardVO);
	public void QAupdateBoard(BoardVO boardVO);
	public ArrayList<BoardVO> QAselectBoardList();
	public BoardVO QAselectOneBoard(@Param("no") int no);
	public void QAdeleteBoard(@Param("no") int no);
	
	//자주하는 질문
	public ArrayList<BoardVO> FQselectBoardList();
	public void FQinsertBoard(BoardVO boardVO);
	public void FQupdateBoard(BoardVO boardVO);
	public void FQdeleteBoard(@Param("no") int no);
	
} //BoardDAO interface