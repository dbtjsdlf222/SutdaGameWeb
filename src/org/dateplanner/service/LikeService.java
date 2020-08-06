package org.dateplanner.service;

import java.util.HashMap;

import org.dateplanner.dao.LikeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {
	
	@Autowired
	LikeDAO likeDAO;
	
	public int selectCount(int boardNo){ return likeDAO.selectCount(boardNo); }
	public int userCheck(HashMap<String, Integer> params){ return likeDAO.userCheck(params); }
	public boolean insertLike(HashMap<String, Integer> params){ return likeDAO.insertLike(params); }
	public boolean deleteLike(HashMap<String, Integer> params){ return likeDAO.deleteLike(params); }

}
