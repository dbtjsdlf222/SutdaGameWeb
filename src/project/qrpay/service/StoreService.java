package project.qrpay.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.qrpay.dao.StoreDAO;
import project.qrpay.vo.StoreVO;

@Service
public class StoreService {
	
	@Autowired
	StoreDAO storeDAO;
	
	public StoreVO selectStore(int no) {
		return storeDAO.selectStore(no);
	}
	public void insertStore(Map<String, String> map) {
		storeDAO.insertStore(map);
	}
	public void updateStore(StoreVO vo) {
		storeDAO.updateStore(vo);
	}
	public void deleteStore(int no) {
		storeDAO.deleteStore(no);
	}

}
