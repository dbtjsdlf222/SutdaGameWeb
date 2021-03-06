package sutdaGame.web.vo;

import sutdaGame.web.util.MoneyFormat;

public class PlayerVO {
	private Integer no;
	private String id;
	private String password;
	private String nickname;
	private Long money;			//숫자로 출력
	private String strMoney;	//억만조경으로 출력
	private Integer win;
	private Integer lose;
	private Integer character;
	private String email;
	private String name;
	private boolean admin = false;
	private String rank;

	
	public String getStrMoney() {
		return strMoney;
	}

	public void setStrMoney(String strMoney) {
		this.strMoney = strMoney;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}
	
	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Long getMoney() {
		return money;
	}

	public void setMoney(Long money) {
		setStrMoney(MoneyFormat.format(money));
		this.money = money;
	}

	public Integer getWin() {
		return win;
	}

	public void setWin(Integer win) {
		this.win = win;
	}

	public Integer getLose() {
		return lose;
	}

	public void setLose(Integer lose) {
		this.lose = lose;
	}

	public Integer getCharacter() {
		return character;
	}

	public void setCharacter(Integer character) {
		this.character = character;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "PlayerVO [no=" + no + ", id=" + id + ", password=" + password + ", nickname=" + nickname + ", money="
				+ money + ", strMoney=" + strMoney + ", win=" + win + ", lose=" + lose + ", character=" + character
				+ ", email=" + email + ", name=" + name + ", admin=" + admin + ", rank=" + rank + "]";
	}

}