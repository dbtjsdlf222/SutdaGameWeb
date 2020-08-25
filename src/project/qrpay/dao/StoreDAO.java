package project.qrpay.dao;

import project.qrpay.vo.MenuVO;
import project.qrpay.vo.OwnerVO;

public interface StoreDAO {
	public void seleteSotre(int no);
	public void insertSotre(StoreVO vo);
	public void updateSotre(StoreVO vo);
	public void deleteSotrenfo(int no);
	
	public void selectTable(OwnerVO ownerVO);	//테이블 뷰
	public MenuVO selectMenu(MenuVO menuVO); 	//메뉴 뷰
	public void insertMenu(MenuVO menuVO); 		//메뉴 등록
	public void updateMenu(MenuVO menuVO);		//메뉴 수정
	public void deleteMenu(int no);				//메뉴 삭제
	
} //storeDAO interface;