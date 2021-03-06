package sutdaGame.web.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import sutdaGame.web.vo.BoardVO;
import sutdaGame.web.vo.Page;

public interface BoardDAO {
	
	public void insertBoard(BoardVO boardVO);
	public void updateBoard(BoardVO boardVO);
	public void viewUP(@Param("no") int no);
	public ArrayList<BoardVO> selectBoardList(@Param("kindNo")int kindNo,@Param("page") Page page);
	public BoardVO selectOneBoard(@Param("no") int no);
	public int boardCount(@Param("kindNo") int kindNo);
	public void deleteBoard(@Param("no") int no);
	
} //BoardDAO interface