package sutdaGame.web.vo;

import java.util.Date;

public class BoardVO {

	private Integer no;
	private String title;
	private String content;
	private Integer writerNo;
	private Date writeDate;
	private Integer view;
	private Integer kindNo;
	private String kindName;

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
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

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
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