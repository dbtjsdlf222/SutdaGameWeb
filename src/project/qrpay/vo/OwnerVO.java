package project.qrpay.vo;

public class OwnerVO {
   //사장님 table
   private int no;             //가입번호
   private String name;         //이름
   private int phone;            //연락처
   private String id;            //아이디
   private String pw;            //비밀번호
   private String email;         //이메일
   private int membership_date;   //가입일
   
   //가게 table
   private int store_no;         //업장 번호
   private String store_name;      //가게 이름
   private String type;         //가게 타입 ex)술집, 카페, 음식점
   private int license_number;      //가게 사업자 번호
   private String address;         //가게 주소
   private int owner_no;         //업주 정보 
   private int table_count;      //테이블 개수
   
   
   //사장님 getters
   public int getNo() {return no;}
   public String getName() {return name;}
   public int getPhone() {return phone;}
   public String getId() {return id;}
   public String getPw() {return pw;}
   public String getEmail() {return email;}
   public int getMembership_date() {return membership_date;}
   
   //사장님 setters
   public void setNo(int no) {this.no = no;}
   public void setName(String name) {this.name = name;}
   public void setPhone(int phone) {this.phone = phone;}
   public void setId(String id) {this.id = id;}
   public void setPw(String pw) {this.pw = pw;}
   public void setEmail(String email) {this.email = email;}
   public void setMembership_date(int membership_date) {this.membership_date = membership_date;}
   
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

   
   
   
   
   
   
}//main