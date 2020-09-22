package project.qrpay.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

public class MenuVO {
//	private int no;					//번호
	private String name;			//이름
	private String engName;		//영어 이름
	private String price;			//가격
	private String description;		//메뉴 설명
//	private String img;				//이미지
//	private boolean soldOut;		//소진 여부
//	private int storeNo;			//업장 번호
	
	//MenuVO getters
//	public int getNo() {return no;}
	public String getName() {return name;}
	public String getEngName() {return engName;}
	public String getPrice() {return price;}
	public String getDescription() {return description;}
//	public String getImg() {return img;}
//	public boolean isSoldOut() {return soldOut;}
//	public int getstoreNo() {return storeNo;}
	
	//MenuVO setters
//	public void setNo(int no) {this.no = no;}
//	public void setNo(String no) {this.no = Integer.parseInt(no);}
	public void setName(String name) {this.name = name;}
	public void setEngName(String engName) {this.engName = engName;}
	public void setPrice(String price) {this.price = price;}
	public void setDescription(String description) {this.description = description;}
//	public void setImg(String img) {this.img = img;}
//	public void setImg(MultipartFile img) {}
//	public void setSoldOut(boolean soldOut) {this.soldOut = soldOut;}
//	public void setStoreNo(int storeNo) {this.storeNo = storeNo;}
//	public void setStoreNo(String storeNo) {this.storeNo = Integer.parseInt(storeNo);}
	@Override
	public String toString() {
		return "MenuVO [name=" + name + ", engName=" + engName + ", price=" + price + ", description=" + description
				+ "]";
	}
	
} //main
