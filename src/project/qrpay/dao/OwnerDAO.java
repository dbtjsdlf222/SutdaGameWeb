package project.qrpay.dao;

import org.apache.ibatis.annotations.Param;

import project.qrpay.vo.MenuVO;
import project.qrpay.vo.OwnerVO;

public interface OwnerDAO {
	public void join(OwnerVO ownerVO);			//회원가입
	public OwnerVO login(@Param("id")String id, @Param("pw")String pw);		//로그인
	
} //interface OwnerDAO