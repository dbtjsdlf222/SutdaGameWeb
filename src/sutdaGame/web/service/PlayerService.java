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
	
	public PlayerVO loginPlayer(String id) { return playerDAO.login(id); }
	public PlayerVO selectPlayer(@Param("no") int no) { return playerDAO.selectPlayer(no); }
	public int selectNickname(@Param("nickname") String nickname) { return playerDAO.selectNickname(nickname); }
	public int selectEmail(@Param("email") String email) { return playerDAO.selectEmail(email); }
	
	public ArrayList<PlayerVO> rankByMoney() { return playerDAO.rankByMoney();  }
	public ArrayList<PlayerVO> rankByRounds(){ return playerDAO.rankByRounds(); }
	public ArrayList<PlayerVO> rankByRate()  { return playerDAO.rankByRate();   }
	 
	public int playerJoin  (PlayerVO PlayerVO) { return playerDAO.join(PlayerVO);         }
	public int updatePlayer(PlayerVO PlayerVO) { return playerDAO.updatePlayer(PlayerVO); }
	public int deletePlayer(int no) 		   { return playerDAO.deletePlayer(no);       }

	public int 	   selectID(@Param("id") String id)    { return playerDAO.selectID(id);        }
	public void    pwChange(String pw, int no) 		   { playerDAO.pwChange(pw, no);  		   }
	public String  findID  (String email, String name) { return playerDAO.findID(email, name); }
	public Integer findPW  (String id, String email)   { return playerDAO.findPW(id, email);   }
} //PlayerService();