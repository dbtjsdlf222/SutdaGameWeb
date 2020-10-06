package project.qrpay.dao;

import org.apache.ibatis.annotations.Param;

import project.qrpay.vo.OwnerVO;

public interface OwnerDAO {
	public int join(OwnerVO ownerVO);			//회원가입
	public OwnerVO selectOwner(@Param("no") int no);
	public void updateOwner(OwnerVO ownerVO);
	public void deleteOwner(@Param("no") int no);
	public int selectID(@Param("id") String id);
	public OwnerVO login(@Param("id")String id, @Param("pw")String pw);		//로그인

} //interface OwnerDAO