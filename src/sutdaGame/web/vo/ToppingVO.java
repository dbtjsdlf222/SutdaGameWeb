package sutdaGame.web.vo;

public class ToppingVO {
	private int no;				//토핑 번호
	private int menuNo;		//메뉴 번호
	private String name;		//토핑 명
	private String price;		//토핑 가격
	private int maxCount;		//주문한도 개수		0일 경우 다중 불가
	private int requestNo;		//선택 필수 여부		//null이면 필수 아님
	
	//ToppingVO getters
	public int getNo() {return no;}
	public int getMenuNo() {return menuNo;}
	public String getName() {return name;}
	public String getPrice() {return price;}
	public int getMaxCount() {return maxCount;}
	public int getRequestNo() {return requestNo;}
	
	//ToppingVO setters
	public void setNo(int no) {this.no = no;}
	public void setMenuNo(int menuNo) {this.menuNo = menuNo;}
	public void setName(String name) {this.name = name;}
	public void setPrice(String price) {this.price = price;}
	public void setMaxCount(int maxCount) {this.maxCount = maxCount;}
	public void setRequestNo(int requestNo) {this.requestNo = requestNo;}
	
	
	
	
	
	
}
