package project.qrpay.dao;

import org.apache.ibatis.annotations.Param;

import project.qrpay.vo.OwnerVO;
import project.qrpay.vo.StoreVO;

public interface StoreDAO {
	public StoreVO selectStore(@Param("no") int no);
	public void insertStore(StoreVO vo);
	public void updateStore(StoreVO vo);
	public void deleteStore(@Param("no")int no);
	
//	public void selectTable(OwnerVO ownerVO);	//테이블 뷰
	
} //storeDAO interface;