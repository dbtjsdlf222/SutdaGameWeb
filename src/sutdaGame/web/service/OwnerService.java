package sutdaGame.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sutdaGame.web.dao.OwnerDAO;
import sutdaGame.web.vo.OwnerVO;

@Service
public class OwnerService {

	@Autowired
	OwnerDAO ownerDAO;
	
	public OwnerVO loginOwner(String id, String pw) { return ownerDAO.login(id, pw); }
	public int joinOwner(OwnerVO ownerVO) { return ownerDAO.join(ownerVO); }
	public OwnerVO selectOwner(int no) { return ownerDAO.selectOwner(no); }
	
} //OwnerService();