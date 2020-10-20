package sutdaGame.web.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sutdaGame.web.dao.LikeDAO;

@Service
public class LikeService {
	
	@Autowired
	LikeDAO likeDAO;
	
	public int selectCount(int boardNo){ return likeDAO.selectCount(boardNo); }
	public int playerCheck(HashMap<String, Integer> params){ return likeDAO.playerCheck(params); }
	public boolean insertLike(HashMap<String, Integer> params){ return likeDAO.insertLike(params); }
	public boolean deleteLike(HashMap<String, Integer> params){ return likeDAO.deleteLike(params); }

}