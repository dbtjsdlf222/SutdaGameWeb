package project.qrpay.dao;

import org.apache.ibatis.annotations.Param;

import project.qrpay.vo.MenuVO;
import project.qrpay.vo.OwnerVO;

public interface OwnerDAO {
	
	public void join(OwnerVO ownerVO);			//회원가입
	public OwnerVO login(OwnerVO ownerVO);		//로그인
	public void selectTable(OwnerVO ownerVO);	//테이블 뷰
	public MenuVO selectMenu(MenuVO menuVO); 	//메뉴 뷰
	public void insertMenu(MenuVO menuVO); 		//메뉴 등록
	public void updateMenu(MenuVO menuVO);		//메뉴 수정
	public void deleteMenu(MenuVO menuVO);		//메뉴 삭제
	public int selectID(@Param("id") String id);		//메뉴 삭제
	
} //interface OwnerDAO