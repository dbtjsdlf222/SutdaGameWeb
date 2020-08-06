package org.dateplanner.service;

import java.util.List;

import org.dateplanner.dao.BoardDAO;
import org.dateplanner.dao.UsersDAO;
import org.dateplanner.vo.Page;
import org.dateplanner.vo.Post;
import org.dateplanner.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
	private UsersDAO usersDAO;
	
	@Autowired
	private BoardDAO boardDAO;
	
	
	public void delete(int no) { usersDAO.delete(no); }
	public void update(User user) { usersDAO.update(user); }
	
	public boolean join(User user) { return usersDAO.insert(user); }
	public boolean idExist(String id) { return usersDAO.selectIdExist(id); }
	public User selectUser(int no) { return usersDAO.selectByNo(no); }
	
	public List<Post> selectUsersPost(int userNo, Page page) {
		
		return boardDAO.selectByUserNoWithPage(userNo, page.initTotal(boardDAO.selectTotalByUserNo(userNo)));
		
	} //selectUsersPost();
	
	public User login(String id, String password) {
		
		User result = null;
		
		User user = usersDAO.selectById(id);
		if(user != null && user.getKey().equals(password))
			result = user;
		
		return result;
		
	} //login();
	
} //class UsersService;
