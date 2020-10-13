package sutdaGame.web.vo;

import java.sql.Timestamp;

public class CommentVO {
	
	private int no;
	private Integer orderNo;
	private int boardNo;
	private PlayerVO player;
	private String content;
	private Timestamp regdate;
	private int replyCount;

	public CommentVO() { }
	
	public CommentVO(int boardNo, String content) {
		this.boardNo = boardNo;
		this.content = content;
	}

	public CommentVO(int boardNo, int no, int orderNo) {
		this.boardNo=boardNo;
		this.no = no;
		this.orderNo = orderNo;
	}
	
	public CommentVO(int no, Integer orderNo, String content) {
		this.no = no;
		this.orderNo = orderNo;
		this.content = content;
	} //Comment();
	
	public CommentVO(int no, Integer orderNo) {
		this.orderNo = orderNo;
		this.no = no;
	} //Comment();

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public PlayerVO getPlayer() {
		return player;
	}

	public void setPlayer(PlayerVO player) {
		this.player = player;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
} //class Comment;