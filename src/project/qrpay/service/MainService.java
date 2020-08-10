package project.qrpay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.qrpay.dao.MainDAO;

@Service
public class MainService {
	
	@Autowired
	MainDAO mainDAO;
	
	
	
} //MainService class
