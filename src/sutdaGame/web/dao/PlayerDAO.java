package sutdaGame.web.dao;

import org.apache.ibatis.annotations.Param;

import sutdaGame.web.vo.PlayerVO;

public interface PlayerDAO {
	public int join(PlayerVO PlayerVO);			//회원가입
	public PlayerVO selectOwner(@Param("no") int no);
	public void updateOwner(PlayerVO PlayerVO);
	public void deleteOwner(@Param("no") int no);
	public int selectID(@Param("id") String id);
	public PlayerVO login(@Param("id")String id, @Param("pw")String pw);		//로그인

} //interface OwnerDAO