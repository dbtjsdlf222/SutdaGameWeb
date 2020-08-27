package project.qrpay.vo;

public class OrderMenu {
	private int no;				//번호
	private int menuNo;		//메뉴 번호
	private int count;			//주문 개수
	private int orderNo;		//주문 번호
	
	//OrderMenu getters
	public int getNo() {return no;}
	public int getMenuNo() {return menuNo;}
	public int getCount() {return count;}
	public int getOrderNo() {return orderNo;}
	
	//OrderMenu setters
	public void setNo(int no) {this.no = no;}
	public void setMenuNo(int menuNo) {this.menuNo = menuNo;}
	public void setCount(int count) {this.count = count;}
	public void setOrderNo(int orderNo) {this.orderNo = orderNo;}
	
}
