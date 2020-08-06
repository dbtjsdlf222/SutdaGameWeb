package org.dateplanner.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.dateplanner.vo.Comment;
import org.dateplanner.vo.Page;

public interface CommentsDAO {
	public boolean insertComment(Comment comment);
	public boolean insertReply(Comment reply);
	public List<Comment> selectByBoardNo(@Param(value = "boardNo")int no, @Param(value = "page") Page page);
	public List<Comment> selectReComment(int no);
	public int selectCount(int boardNo);
	public boolean update(Comment comment);
	public boolean commentDelete(Comment comment);
	public boolean reCommentDelete(Comment comment);
} //interface CommentsDAO;