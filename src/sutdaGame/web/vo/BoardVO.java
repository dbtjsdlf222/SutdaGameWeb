package sutdaGame.web.vo;

import java.sql.Timestamp;
import java.util.Date;

public class BoardVO {

	private Integer no;
	private String title;
	private String content;
	private Integer writerNo;
	private String writerName;
	private Timestamp writeDate;
	private Integer view;
	private Integer kindNo;
	private Integer like;
	private Integer commentCount;
	private String kindName;
	private String additionalInfo;

	public String getAdditionalInfo() {
		return additionalInfo;
	}

	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}
	
	public Integer getCommentCount() {
		return commentCount;
	}
	
	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}
	
	public Integer getLike() {
		return like;
	}

	public void setLike(Integer like) {
		this.like = like;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getKindName() {
		return kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(Integer writerNo) {
		this.writerNo = writerNo;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public Integer getView() {
		return view;
	}

	public void setView(Integer view) {
		this.view = view;
	}

	public Integer getKindNo() {
		return kindNo;
	}

	public void setKindNo(Integer kindNo) {
		this.kindNo = kindNo;
	}

}