package project.qrpay.vo;

import java.sql.Date;

public class OrderVO {
	private int orderNo;			//주문 번호
	private int count;				//개수
	private int orderTableNo;		//테이블 번호
	private Date orderTime;			//주문 시간
	private Date delete;			//주문 취소 시간		null이 아닐 경우 취소
	
	//OrderVO getters
	public int getOrderNo() {return orderNo;}
	public int getCount() {return count;}
	public int getOrderTableNo() {return orderTableNo;}
	public Date getOrderTime() {return orderTime;}
	public Date getDelete() {return delete;}
	
	//OrderVO setters
	public void setOrderNo(int orderNo) {this.orderNo = orderNo;}
	public void setCount(int count) {this.count = count;}
	public void setOrderTableNo(int orderTableNo) {this.orderTableNo = orderTableNo;}
	public void setOrderTime(Date orderTime) {this.orderTime = orderTime;}
	public void setDelete(Date delete) {this.delete = delete;}
	
}
