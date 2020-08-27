package project.qrpay.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import project.qrpay.vo.MenuVO;

public interface MenuDAO {
	
	public ArrayList<MenuVO> selectAllMenu(@Param("storeNo") int storeNo); 	//메뉴 목록
	public MenuVO selectMenu(int menuNo); 	//메뉴 뷰
	public void addMenu(MenuVO menuVO); 	//메뉴 등록
	public void updateMenu(MenuVO menuVO);	//메뉴 수정
	public void deleteMenu(@Param("no") int no);			//메뉴 삭제
	
} //MenuDAO
