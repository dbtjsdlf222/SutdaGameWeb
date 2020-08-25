package project.qrpay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.qrpay.dao.OwnerDAO;
import project.qrpay.vo.OwnerVO;

@Service
public class MainService {
	
	@Autowired
	OwnerDAO ownerDAO;
	
	public OwnerVO loginOwner(OwnerVO ownerVO) { return ownerDAO.login(ownerVO);}
	
	
	
} //MainService class
