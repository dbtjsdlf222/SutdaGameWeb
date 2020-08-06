package org.dateplanner.dao;

import org.dateplanner.vo.User;

public interface UsersDAO {
	
	public boolean insert(User user);
	public boolean selectIdExist(String id);
	public User selectByNo(int no);
	public User selectById(String id);
	public void update(User user);
	public void delete(int no);

} //interface UsersDAO;
