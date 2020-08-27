package project.qrpay.vo;

public class OrderTopping {
	private int orderNo;				//주문 번호
	private String toppingName;		//토핑 이름
	private int count;					//토핑 개수
	private int orderMenuNo;			//어떤 주문의 토핑인지
	private int toppingNo;				//무슨 토핑 인지
	
	//OrderTopping getters
	public int getOrderNo() {return orderNo;}
	public String getToppingName() {return toppingName;}
	public int getCount() {return count;}
	public int getOrderMenuNo() {return orderMenuNo;}
	public int getToppingNo() {return toppingNo;}
	
	//OrderTopping setters
	public void setOrderNo(int orderNo) {this.orderNo = orderNo;}
	public void setToppingName(String toppingName) {this.toppingName = toppingName;}
	public void setCount(int count) {this.count = count;}
	public void setOrderMenuNo(int orderMenuNo) {this.orderMenuNo = orderMenuNo;}
	public void setToppingNo(int toppingNo) {this.toppingNo = toppingNo;}
	
}
