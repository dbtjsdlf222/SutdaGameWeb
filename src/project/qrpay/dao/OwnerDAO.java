package project.qrpay.dao;

import org.apache.ibatis.annotations.Param;

import project.qrpay.vo.MenuVO;
import project.qrpay.vo.OwnerVO;
import project.qrpay.vo.StoreVO;

public interface OwnerDAO {
	public void join(OwnerVO ownerVO);			//회원가입
	public void seleteOwner(int no);
	public void updateOwner(OwnerVO ownerVO);
	public void deleteOwner(int no);
	public int selectID(@Param("id") String id);
	public OwnerVO login(@Param("id")String id, @Param("pw")String pw);		//로그인

} //interface OwnerDAO