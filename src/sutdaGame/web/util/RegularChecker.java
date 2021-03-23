package sutdaGame.web.util;

import java.util.regex.Pattern;

import org.springframework.security.crypto.bcrypt.BCrypt;

import sutdaGame.web.service.PlayerService;
import sutdaGame.web.vo.PlayerVO;

public class RegularChecker {
	
	PlayerService playerService;
	
	public String join(PlayerVO vo, String passwordc, PlayerService playerService) {
		this.playerService = playerService;
		if (!id(vo.getId())) {
			return "아이디";
		} else if (!name(vo.getName())) {
			return "이름";
		} else if (!pw(vo.getPassword(), passwordc)) {
			return "비밀번호";
		} else if (!email(vo.getEmail())) {
			return "이메일";
		} else if (!nickname(vo.getNickname())) {
			return "닉네임";
		} else if (!character(vo.getCharacter())) {
			return "캐릭터";
		} else {
			return "";
		}
	}

	private boolean name(String name) {
		if (Pattern.matches("^[가-힣]{2,4}|[a-zA-Z]{2,10}\\s[a-zA-Z]{2,10}$", name)) {
			return true;
		} else {
			return false;
		}
	}

	private boolean id(String id) {
		try {
			if (Pattern.matches("[~!@#$%^&*()_+|<>?:{}ㄱ-ㅎ|ㅏ-ㅣ|가-힣]", id)) {
				return false;
			} else if (id.length() < 6 || id.length() > 20) {
				return false;
			} else if (playerService.selectID(id) != 0) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private boolean pw(String pw, String pwc) {
		try {
			if (!Pattern.matches("(?=.*\\d{1,20})(?=.*[~`!@#$%\\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,20}).{8,20}$", pwc)) {
				return false;
			} else if (pw == "" || pw == null || pwc==""|| pwc == null) {
				return false;
			} else if (!BCrypt.checkpw(pwc, pw)) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private boolean email(String email) {
		try {
			if (!Pattern.matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$",email)) {
				return false;
			} else if (email.equals("") || email == null) {
				return false;
			} else if (playerService.selectEmail(email) != 0) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private boolean nickname(String nickname) {

		try {
			if (!Pattern.matches("^[a-zA-Z0-9가-힣]*$", nickname)) {
				return false;
			} else if (nickname.isEmpty() || nickname.equals("")) {
				return false;
			} else if (2 > nickname.length() || nickname.length() > 6) {
				return false;
			} else if (playerService.selectNickname(nickname) != 0) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	} // nickname();

	private boolean character(Integer character) {
		try {
			if (character == 0 || character == null) {
				return false;
			} else if (0 >= character || character > 6) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
