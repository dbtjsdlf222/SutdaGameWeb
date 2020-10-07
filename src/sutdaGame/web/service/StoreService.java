package sutdaGame.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sutdaGame.web.dao.StoreDAO;
import sutdaGame.web.vo.StoreVO;

@Service
public class StoreService {
	
	@Autowired
	StoreDAO storeDAO;
	
	public StoreVO selectStore(int no) {
		return storeDAO.selectStore(no);
	}
	public void insertStore(StoreVO vo) {
		storeDAO.insertStore(vo);
	}
	public void updateStore(StoreVO vo) {
		storeDAO.updateStore(vo);
	}
	public void deleteStore(int no) {
		storeDAO.deleteStore(no);
	}

}
