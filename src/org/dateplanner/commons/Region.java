package org.dateplanner.commons;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.dateplanner.vo.User;

public class Region {
	
	public static final List<String> LIST = Arrays.asList("서울특별시", "부산광역시", "광주광역시", "대구광역시",
			"대전광역시", "인천광역시", "경기도", "울산광역시", "세종특별자치시", "제주특별자치도", "경상남도",
			"충청남도", "전라북도", "충청북도", "전라남도", "경상북도", "강원도");
	
	public static int getRegionNo(HttpSession session) {
		
		Integer regionNo;
		
		if((regionNo = (Integer)session.getAttribute("regionNo")) == null) {
			
			User loginInfo;
			if((loginInfo = (User)session.getAttribute("loginInfo")) == null || (regionNo = loginInfo.getRegionNo()) == null)
				regionNo = 0;
			
			session.setAttribute("regionNo", regionNo);
			
		}
		
		return regionNo;
		
	} //getRegionNo();
	
} //class Constants;
