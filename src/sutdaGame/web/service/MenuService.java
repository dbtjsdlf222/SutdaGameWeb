package sutdaGame.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sutdaGame.web.dao.MenuDAO;
import sutdaGame.web.vo.CategoryVO;
import sutdaGame.web.vo.MenuVO;

@Service
public class MenuService {
	
	@Autowired MenuDAO menuDAO;
	
	public ArrayList<MenuVO> selectAllMenu(int storeNo){ return menuDAO.selectAllMenu(storeNo); }
	public MenuVO selectMenu(int menuNo)  { return menuDAO.selectMenu(menuNo); }
	public void addMenu(MenuVO menuVO) { menuDAO.addMenu(menuVO); }
	public void updateMenu(MenuVO menuVO) { menuDAO.updateMenu(menuVO);	}
	public void deleteMenu(int no) { menuDAO.deleteMenu(no); }
	public ArrayList<CategoryVO> selectCategoryList(int storeNo){
		return menuDAO.selectCategoryList(storeNo);
	}
	
} //MenuService();
