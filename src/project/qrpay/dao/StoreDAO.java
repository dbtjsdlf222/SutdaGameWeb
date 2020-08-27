package project.qrpay.dao;

import project.qrpay.vo.OwnerVO;
import project.qrpay.vo.StoreVO;

public interface StoreDAO {
	public void seleteStore(int no);
	public void insertStore(StoreVO vo);
	public void updateStore(StoreVO vo);
	public void deleteStore(int no);
	
	public void selectTable(OwnerVO ownerVO);	//테이블 뷰
	
} //storeDAO interface;