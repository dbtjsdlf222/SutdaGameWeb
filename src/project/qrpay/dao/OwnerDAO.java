package project.qrpay.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import project.qrpay.vo.OwnerVO;

public interface OwnerDAO {
	
	public OwnerVO login(@Param("id")String id, @Param("pw")String pw);		//로그인
	public void join(Map map);			//회원가입
	
} //interface OwnerDAO