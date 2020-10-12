package sutdaGame.web.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import sutdaGame.web.vo.BoardVO;

public interface BoardDAO {
	
	public void insertBoard(BoardVO boardVO);
	public void updateBoard(BoardVO boardVO);
	public ArrayList<BoardVO> selectBoardList(@Param("kindNo")int kindNo);
	public BoardVO selectOneBoard(@Param("no") int no);
	public void deleteBoard(@Param("no") int no);
	
} //BoardDAO interface