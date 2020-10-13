package sutdaGame.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sutdaGame.web.dao.PlayerDAO;
import sutdaGame.web.vo.PlayerVO;

@Service
public class PlayerService {

	@Autowired
	PlayerDAO ownerDAO;
	
	public PlayerVO loginOwner(String id, String pw) { return ownerDAO.login(id, pw); }
	public int joinOwner(PlayerVO PlayerVO) { return ownerDAO.join(PlayerVO); }
	public PlayerVO selectOwner(int no) { return ownerDAO.selectOwner(no); }
	
} //OwnerService();