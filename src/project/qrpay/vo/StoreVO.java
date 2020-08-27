package project.qrpay.vo;

public class StoreVO {
	//가게 table
		private int storeNo;			//업장 번호
		private String storeName;		//가게 이름
		private String type;			//가게 타입 ex)술집, 카페, 음식점
		private int licenseNumber;		//가게 사업자 번호
		private String address;			//가게 주소
		private int ownerNo;			//업주 정보 
		private int tableCount;		//테이블 개수
		
		//가게 getters
		public int getStoreNo() {return storeNo;}
		public String getStoreName() {return storeName;}
		public String getType() {return type;}
		public int getLicenseNumber() {return licenseNumber;}
		public String getAddress() {return address;}
		public int getOwnerNo() {return ownerNo;}
		public int getTableCount() {return tableCount;}
		
		//가게 setters
		public void setStoreNo(int storeNo) {this.storeNo = storeNo;}
		public void setStoreName(String storeName) {this.storeName = storeName;}
		public void setType(String type) {this.type = type;}
		public void setLicenseNumber(int licenseNumber) {this.licenseNumber = licenseNumber;}
		public void setAddress(String address) {this.address = address;}
		public void setOwnerNo(int ownerNo) {this.ownerNo = ownerNo;}
		public void setTableCount(int tableCount) {this.tableCount = tableCount;}
}
