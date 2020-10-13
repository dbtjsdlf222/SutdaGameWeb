package sutdaGame.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sutdaGame.web.dao.CommentsDAO;
import sutdaGame.web.vo.CommentVO;
import sutdaGame.web.vo.Page;

@Service
public class CommentService {
	
	@Autowired
	CommentsDAO commentDAO;	
	
	public boolean insertComment(CommentVO comment){ return commentDAO.insertComment(comment); }
	public boolean insertReply(CommentVO reply){ return commentDAO.insertReply(reply); }
	public List<CommentVO> selectByBoardNo(int no, Page page){ return commentDAO.selectByBoardNo(no, page.initTotal(commentDAO.selectCommentCount(no))); }
	public List<CommentVO> selectReComment(int no,Page page){ return commentDAO.selectReComment(no,page.initTotal(commentDAO.selectReCommentCount(no))); }
	public boolean updateCommtent(CommentVO comment){ return commentDAO.update(comment); }
	public boolean deleteComment(CommentVO comment) {
		if(comment.getOrderNo() == 0) 
			 { return commentDAO.commentDelete(comment); } 
		else { return commentDAO.reCommentDelete(comment);}
		 
	}
	
} //class CommentService;