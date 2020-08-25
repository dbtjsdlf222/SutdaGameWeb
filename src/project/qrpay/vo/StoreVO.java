package project.qrpay.vo;

public class StoreVO {
	//가게 table
		private int store_no;			//업장 번호
		private String store_name;		//가게 이름
		private String type;			//가게 타입 ex)술집, 카페, 음식점
		private int license_number;		//가게 사업자 번호
		private String address;			//가게 주소
		private int owner_no;			//업주 정보 
		private int table_count;		//테이블 개수
		
		//가게 getters
		public int getStore_no() {return store_no;}
		public String getStore_name() {return store_name;}
		public String getType() {return type;}
		public int getLicense_number() {return license_number;}
		public String getAddress() {return address;}
		public int getOwner_no() {return owner_no;}
		public int getTable_count() {return table_count;}
		
		//가게 setters
		public void setStore_no(int store_no) {this.store_no = store_no;}
		public void setStore_name(String store_name) {this.store_name = store_name;}
		public void setType(String type) {this.type = type;}
		public void setLicense_number(int license_number) {this.license_number = license_number;}
		public void setAddress(String address) {this.address = address;}
		public void setOwner_no(int owner_no) {this.owner_no = owner_no;}
		public void setTable_count(int table_count) {this.table_count = table_count;}
}
