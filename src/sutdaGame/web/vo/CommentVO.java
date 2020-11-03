package sutdaGame.web.vo;

public class CommentVO {
	
	private Integer no;
	private Integer orderNo;
	private Integer boardNo;
	private PlayerVO player;
	private String content;
	private Integer regdate;
	private Integer replyCount;
	private Integer myComment;

	public CommentVO() { }
	
	public CommentVO(Integer boardNo, String content) {
		this.boardNo = boardNo;
		this.content = content;
	}

	public CommentVO(Integer boardNo, Integer no, Integer orderNo) {
		this.boardNo=boardNo;
		this.no = no;
		this.orderNo = orderNo;
	}
	
	public CommentVO(Integer no, Integer orderNo, String content) {
		this.no = no;
		this.orderNo = orderNo;
		this.content = content;
	} //Comment();
	
	public CommentVO(Integer no, Integer orderNo) {
		this.orderNo = orderNo;
		this.no = no;
	} //Comment();

	public Integer getNo() {
		return no;
	}

	public Integer getMyComment() {
		return myComment;
	}

	public void setMyComment(Integer myComment) {
		this.myComment = myComment;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(Integer boardNo) {
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


	public Integer getRegdate() {
		return regdate;
	}

	public void setRegdate(Integer regdate) {
		this.regdate = regdate;
	}

	public Integer getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(Integer replyCount) {
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "CommentVO [no=" + no + ", orderNo=" + orderNo + ", boardNo=" + boardNo + ", player=" + player
				+ ", content=" + content + ", regdate=" + regdate + ", replyCount=" + replyCount + ", myComment="
				+ myComment + "]";
	}
	

	
} //class Comment;
