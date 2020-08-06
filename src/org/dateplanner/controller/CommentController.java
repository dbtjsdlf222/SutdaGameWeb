package org.dateplanner.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.dateplanner.service.CommentService;
import org.dateplanner.util.JsonUtil;
import org.dateplanner.vo.Comment;
import org.dateplanner.vo.Page;
import org.dateplanner.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller @RequestMapping(path = { "post", "package" })
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping("commentSelect")
	public ResponseEntity<String> commentSelect(int boardNo, Integer p, HttpSession session) throws IOException {
		return JsonUtil.convertToResponseEntity(commentService.selectByBoardNo(boardNo ,new Page(5, 5, p)));
	}
	
	@RequestMapping("reCommentSelect")
	public ResponseEntity<String> reCommentSelect(int no, HttpSession session) throws IOException {
		return JsonUtil.convertToResponseEntity(commentService.selectReComment(no));
	}
	
	@RequestMapping("commentInsert")
	public ResponseEntity<String> commentInsert(int boardNo, String content, HttpSession session) 
			throws IOException {
		User user = (User)session.getAttribute("loginInfo");
		return JsonUtil.convertToResponseEntity(
				commentService.insertComment(new Comment(boardNo, content, user.getNo())));
	}
	
	@RequestMapping("reCommentInsert")
	public ResponseEntity<String> reCommentInsert(@ModelAttribute Comment comment, HttpSession session) 
			throws IOException {
		User user = (User)session.getAttribute("loginInfo");
		comment.setUser(user);
		return JsonUtil.convertToResponseEntity(commentService.insertReply(comment));
	}
	
	@RequestMapping("commentDelete")
	public ResponseEntity<String> commentDelete(int no, Integer orderNo) 
			throws IOException {
		return JsonUtil.convertToResponseEntity(commentService.deleteComment(new Comment(no, orderNo)));
	}
	
	@RequestMapping("commentUpdate")
	public ResponseEntity<String> commentUpdate(int orderNo, int no, String content) throws IOException{	
		return JsonUtil.convertToResponseEntity(commentService.deleteComment(new Comment(no, orderNo, content)));
	}
	
} //class CommentController;
