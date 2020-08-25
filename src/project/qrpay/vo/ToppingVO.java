package project.qrpay.vo;

public class ToppingVO {
	private int no;				//토핑 번호
	private int menu_no;		//메뉴 번호
	private String name;		//토핑 명
	private String price;		//토핑 가격
	private int max_count;		//주문한도 개수		0일 경우 다중 불가
	private int request_no;		//선택 필수 여부		//null이면 필수 아님
	
	//ToppingVO getters
	public int getNo() {return no;}
	public int getMenu_no() {return menu_no;}
	public String getName() {return name;}
	public String getPrice() {return price;}
	public int getMax_count() {return max_count;}
	public int getRequest_no() {return request_no;}
	
	//ToppingVO setters
	public void setNo(int no) {this.no = no;}
	public void setMenu_no(int menu_no) {this.menu_no = menu_no;}
	public void setName(String name) {this.name = name;}
	public void setPrice(String price) {this.price = price;}
	public void setMax_count(int max_count) {this.max_count = max_count;}
	public void setRequest_no(int request_no) {this.request_no = request_no;}
	
	
	
	
	
	
}
