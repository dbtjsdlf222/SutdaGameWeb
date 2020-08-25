package project.qrpay.vo;

public class OrderMenu {
	private int no;				//번호
	private int menu_no;		//메뉴 번호
	private int count;			//주문 개수
	private int order_no;		//주문 번호
	
	//OrderMenu getters
	public int getNo() {return no;}
	public int getMenu_no() {return menu_no;}
	public int getCount() {return count;}
	public int getOrder_no() {return order_no;}
	
	//OrderMenu setters
	public void setNo(int no) {this.no = no;}
	public void setMenu_no(int menu_no) {this.menu_no = menu_no;}
	public void setCount(int count) {this.count = count;}
	public void setOrder_no(int order_no) {this.order_no = order_no;}
	
}
