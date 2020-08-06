package org.dateplanner.service;

import java.util.List;

import org.dateplanner.dao.CommentsDAO;
import org.dateplanner.vo.Comment;
import org.dateplanner.vo.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	
	@Autowired
	CommentsDAO commentDAO;
	
	public boolean insertComment(Comment comment){ return commentDAO.insertComment(comment); }
	public boolean insertReply(Comment reply){ return commentDAO.insertReply(reply); }
	public List<Comment> selectByBoardNo(int no, Page page){ return commentDAO.selectByBoardNo(no, page.initTotal(commentDAO.selectCount(no))); }
	public List<Comment> selectReComment(int no){ return commentDAO.selectReComment(no); }
	public boolean updateCommtent(Comment comment){ return commentDAO.update(comment); }
	public boolean deleteComment(Comment comment) {
		if(comment.getOrderNo() == 0) 
			 { return commentDAO.commentDelete(comment); } 
		else { return commentDAO.reCommentDelete(comment);}
		 
	}
	
} //class CommentService;