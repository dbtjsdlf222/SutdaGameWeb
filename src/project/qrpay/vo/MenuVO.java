package project.qrpay.vo;

import lombok.Data;

@Data
public class MenuVO {
	private int no;					//번호
	private String name;			//이름
	private String eng_name;		//영어 이름
	private String price;			//가격
	private String description;		//메뉴 설명
	private String img;				//이미지
	private boolean sold_out;		//소진 여부
	private int store_no;			//업장 번호
	
	//MenuVO getters
	public int getNo() {return no;}
	public String getName() {return name;}
	public String getEng_name() {return eng_name;}
	public String getPrice() {return price;}
	public String getDescription() {return description;}
	public String getImg() {return img;}
	public boolean isSold_out() {return sold_out;}
	public int getStore_no() {return store_no;}
	
	//MenuVO setters
	public void setNo(int no) {this.no = no;}
	public void setName(String name) {this.name = name;}
	public void setEng_name(String eng_name) {this.eng_name = eng_name;}
	public void setPrice(String price) {this.price = price;}
	public void setDescription(String description) {this.description = description;}
	public void setImg(String img) {this.img = img;}
	public void setSold_out(boolean sold_out) {this.sold_out = sold_out;}
	public void setStore_no(int store_no) {this.store_no = store_no;}
	
}//main
