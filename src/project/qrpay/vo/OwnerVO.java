package project.qrpay.vo;

import java.util.Date;

public class OwnerVO {
	
//owner DB
   private int no;             	//가입번호
   private String name;         //이름
   private String phone;           //연락처
   private String id;           //아이디
   private String pw;           //비밀번호
   private String email;      	//이메일
   private Date membershipDate;   //가입일
   private int bankAccount;   //은행 계좌
   private String bankName;   //은행 계좌

   private StoreVO storeVO = new StoreVO();
   
   public OwnerVO() {}
   
//   public OwnerVO(Map<String,String> map) {
//	   	this.name = map.get("name");
//		this.phone = map.get("phone");
//		this.id = map.get("id");
//		this.pw = map.get("pw");
//		this.email = map.get("email");
//
//		this.membershipDate = new Date();
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		try { this.membershipDate = transFormat.parse(map.get("membershipDate")); } 
//		catch (ParseException e) { e.printStackTrace(); }
//		
//		this.bankAccount = Integer.parseInt(map.get("bankAccount"));
//		this.bankName = map.get("bankName");
//		this.storeVO.storeName = map.get("storeName");
//		this.storeVO.type = map.get("type");
//		this.storeVO.licenseNumber = Integer.parseInt(map.get("licenseNumber"));
//		this.storeVO.address = map.get("address");
//	}
//   
//사장님 getters
   public int getNo() {return no;}
   public String getName() {return name;}
   public String getPhone() { return phone; }
   public String getId() {return id;}
   public String getPw() {return pw;}
   public String getEmail() {return email;}
   public Date getMembershipDate() {return membershipDate;}
   public int getBankAccount() { return bankAccount; }
   public String getBankName() { return bankName; }
   public StoreVO getStoreVO() { return storeVO; }
   
//사장님 setters
   public void setNo(int no) {this.no = no;}
   public void setName(String name) {this.name = name;}
   public void setPhone(String phone) {this.phone = phone;}
   public void setId(String id) {this.id = id;}
   public void setPw(String pw) {this.pw = pw;}
   public void setEmail(String email) {this.email = email;}
   public void setMembershipDate(Date membershipDate) {this.membershipDate = membershipDate;}
   public void setBankAccount(int bankAccount) { this.bankAccount = bankAccount; }
   public void setBankName(String bankName) { this.bankName = bankName; }
   public void setStoreVO(StoreVO storeVO) { this.storeVO = storeVO; }
   
   
   
////가게 getters
//   public int getStoreNo() {return storeNo;}
//   public String getStoreName() {return storeName;}
//   public String getType() {return type;}
//   public int getLicenseNumber() {return licenseNumber;}
//   public String getAddress() {return address;}
//   public int getOwnerNo() {return ownerNo;}
//   public int getTableCount() {return tableCount;}
//   
////가게 setters
//   public void setStoreNo(int storeNo) {this.storeNo = storeNo;}
//   public void setStoreName(String storeName) {this.storeName = storeName;}
//   public void setType(String type) {this.type = type;}
//   public void setLicenseNumber(int licenseNumber) {this.licenseNumber = licenseNumber;}
//   public void setAddress(String address) {this.address = address;}
//   public void setOwnerNo(int ownerNo) {this.ownerNo = ownerNo;}
//   public void setTableCount(int tableCount) {this.tableCount = tableCount;}
//   
}