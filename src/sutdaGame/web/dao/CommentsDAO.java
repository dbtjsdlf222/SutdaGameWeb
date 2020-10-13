package sutdaGame.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sutdaGame.web.vo.CommentVO;
import sutdaGame.web.vo.Page;

public interface CommentsDAO {
	public boolean insertComment(CommentVO comment);
	public boolean insertReply(CommentVO reply);
	public List<CommentVO> selectByBoardNo(@Param(value = "boardNo")int no, @Param(value = "page") Page page);
	public List<CommentVO> selectReComment(@Param(value = "no")int no, @Param(value = "page")Page page);
	public int selectCommentCount(@Param(value = "boardNo")int boardNo);
	public int selectReCommentCount(@Param(value = "no")int no);
	public boolean update(CommentVO comment);
	public boolean commentDelete(CommentVO comment);
	public boolean reCommentDelete(CommentVO comment);
} //interface CommentsDAO;