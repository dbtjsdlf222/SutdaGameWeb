package sutdaGame.web.dao;

import java.util.HashMap;

public interface LikeDAO {
	
	public int selectCount(int boardNo);
	public int playerCheck(HashMap<String, Integer> params);
	public boolean insertLike(HashMap<String, Integer> params);
	public boolean deleteLike(HashMap<String, Integer> params);
	
} //interface LikeDAO;
