package project.qrpay.vo;

import lombok.Data;

@Data
public class MenuVO {
	private String category;	//대분류
	private String menuName;	//메뉴 이름
	private String menuImg;		//메뉴 이미지
	private String menuEx;		//메뉴 설명
	private int menuPrice;		//메뉴 가격

}//main
