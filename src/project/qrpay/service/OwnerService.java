package project.qrpay.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.qrpay.dao.OwnerDAO;
import project.qrpay.vo.OwnerVO;

@Service
public class OwnerService {

	@Autowired
	OwnerDAO ownerDAO;
	
	public OwnerVO loginOwner(String id, String pw) { return ownerDAO.login(id, pw); }
	public void joinOwner(Map<String,String> map) { ownerDAO.join(map); }
	
} //OwnerService();
