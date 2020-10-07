package sutdaGame.web.dao;

import org.apache.ibatis.annotations.Param;

import sutdaGame.web.vo.OwnerVO;
import sutdaGame.web.vo.StoreVO;

public interface StoreDAO {
	public StoreVO selectStore(@Param("no") int no);
	public void insertStore(StoreVO vo);
	public void updateStore(StoreVO vo);
	public void deleteStore(@Param("no")int no);
	
//	public void selectTable(OwnerVO ownerVO);	//테이블 뷰
	
} //storeDAO interface;