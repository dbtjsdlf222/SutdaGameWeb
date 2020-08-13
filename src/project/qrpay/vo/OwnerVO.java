package project.qrpay.vo;

import lombok.Data;

@Data
public class OwnerVO {
	private int no; 				//회원관리 번호
	private int phoneNum;			//연락 가능한 핸드폰 번호
	private String id;				//로그인 아이디
	private String pw;				//로그인 비밀번호
	private String email;			//이메일
	private String storeName;		//가게 이름
	private String storeType;		//가게 타입 ex)술집, 카페, 음식점
	private int storeLicense;		//가게 사업자 번호
	private String storeAddress;	//가게 주소

}//main
