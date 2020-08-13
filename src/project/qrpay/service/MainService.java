package project.qrpay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.qrpay.dao.OwnerDAO;

@Service
public class MainService {
	
	@Autowired
	OwnerDAO mainDAO;
	
	
	
} //MainService class
