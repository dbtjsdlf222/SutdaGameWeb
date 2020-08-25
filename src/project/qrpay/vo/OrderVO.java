package project.qrpay.vo;

import java.sql.Date;

public class OrderVO {
	private int order_no;			//주문 번호
	private int count;				//개수
	private int order_table_no;		//테이블 번호
	private Date order_time;			//주문 시간
	private Date delete;			//주문 취소 시간		null이 아닐 경우 취소
	
	//OrderVO getters
	public int getOrder_no() {return order_no;}
	public int getCount() {return count;}
	public int getOrder_table_no() {return order_table_no;}
	public Date getOrder_time() {return order_time;}
	public Date getDelete() {return delete;}
	
	//OrderVO setters
	public void setOrder_no(int order_no) {this.order_no = order_no;}
	public void setCount(int count) {this.count = count;}
	public void setOrder_table_no(int order_table_no) {this.order_table_no = order_table_no;}
	public void setOrder_time(Date order_time) {this.order_time = order_time;}
	public void setDelete(Date delete) {this.delete = delete;}
	
}
