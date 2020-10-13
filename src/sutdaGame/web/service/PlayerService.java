package sutdaGame.web.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sutdaGame.web.dao.PlayerDAO;
import sutdaGame.web.vo.PlayerVO;

@Service
public class PlayerService {

	@Autowired
	PlayerDAO playerDAO;
	
	public int deletePlayer(int no) { return playerDAO.deletePlayer(no); }
	public PlayerVO loginPlayer(String id, String pw) { return playerDAO.login(id, pw); }
	public int playerJoin(PlayerVO PlayerVO) { return playerDAO.join(PlayerVO); }
	public int updatePlayer(PlayerVO PlayerVO) { return playerDAO.updatePlayer(PlayerVO); }
	public int selectID(@Param("id") String id) { return playerDAO.selectID(id); }
	public PlayerVO selectPlayer(@Param("no") int no) { return playerDAO.selectPlayer(no); }
	public ArrayList<PlayerVO> rankByMoney() { return playerDAO.rankByMoney(); }
	public ArrayList<PlayerVO> rankByRounds() { return playerDAO.rankByRounds(); }
	public ArrayList<PlayerVO> rankByRate() { return playerDAO.rankByRate(); }
	
} //PlayerService();