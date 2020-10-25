package sutdaGame.web.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import sutdaGame.web.vo.PlayerVO;

public interface PlayerDAO {
	public int join(PlayerVO PlayerVO);			//회원가입
	public PlayerVO login(@Param("id") String id,@Param("password") String pw);
	public PlayerVO selectPlayer(@Param("no") int no);
	public int updatePlayer(PlayerVO PlayerVO);
	public int deletePlayer(@Param("no") int no);
	public int selectID(@Param("id") String id);
	public ArrayList<PlayerVO> rankByMoney();
	public ArrayList<PlayerVO> rankByRounds();
	public ArrayList<PlayerVO> rankByRate();
	public String findID(@Param("email") String email, @Param("name") String name);
	public Integer findPW(@Param("id") String id, @Param("email") String email);
	public void pwChange(@Param("password") String id, @Param("no") int no);
	public int selectEmail(@Param("email") String email);
	public int selectNickname(@Param("nickname") String nickname);
	
} //interface PDAO