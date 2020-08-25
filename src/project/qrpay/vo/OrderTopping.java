package project.qrpay.vo;

public class OrderTopping {
	private int order_no;				//주문 번호
	private String topping_name;		//토핑 이름
	private int count;					//토핑 개수
	private int order_menu_no;			//어떤 주문의 토핑인지
	private int topping_no;				//무슨 토핑 인지
	
	//OrderTopping getters
	public int getOrder_no() {return order_no;}
	public String getTopping_name() {return topping_name;}
	public int getCount() {return count;}
	public int getOrder_menu_no() {return order_menu_no;}
	public int getTopping_no() {return topping_no;}
	
	//OrderTopping setters
	public void setOrder_no(int order_no) {this.order_no = order_no;}
	public void setTopping_name(String topping_name) {this.topping_name = topping_name;}
	public void setCount(int count) {this.count = count;}
	public void setOrder_menu_no(int order_menu_no) {this.order_menu_no = order_menu_no;}
	public void setTopping_no(int topping_no) {this.topping_no = topping_no;}
	
}
