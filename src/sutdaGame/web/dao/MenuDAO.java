package sutdaGame.web.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import sutdaGame.web.vo.CategoryVO;
import sutdaGame.web.vo.MenuVO;

public interface MenuDAO {
	
	public ArrayList<MenuVO> selectAllMenu(@Param("storeNo") int storeNo); 	//메뉴 목록
	public MenuVO selectMenu(@Param("no") int menuNo); 	//메뉴 뷰
	public void addMenu(MenuVO menuVO); 				//메뉴 등록
	public void updateMenu(MenuVO menuVO);				//메뉴 수정
	public void deleteMenu(@Param("no") int no);		//메뉴 삭제

	public void addCategory(CategoryVO cateVO);			//카테고리 추가
	public void deleteCategory(@Param("no")int no);		//카테고리 삭제
	public void updateCategory(@Param("no")int no);		//카테고리 수정
	public ArrayList<CategoryVO> selectCategoryList (@Param("storeNo") int storeNo);
} //MenuDAO