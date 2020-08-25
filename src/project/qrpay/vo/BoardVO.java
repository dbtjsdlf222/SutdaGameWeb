package project.qrpay.vo;

import java.sql.Date;

import lombok.Data;

public class BoardVO {
   private int no;
   private String title;
   private String content;
   private int writer_no;
   private Date writeDate;

   public BoardVO() { } 
   
   public BoardVO(String title, String content) {
      this.title = title;
      this.content = content;
   }
   
   public BoardVO(String title, String content, int writerNo) {
      this.title = title;
      this.content = content;
      this.writer_no = writerNo;
   }

   public BoardVO(int no, String title, String content) {
      this.no = no;
      this.title = title;
      this.content = content;
   }
   
   	//BoardVO getters
	public int getNo() {return no;}
	public String getTitle() {return title;}
	public String getContent() {return content;}
	public int getWriter() {return writer_no;}
	public Date getWriteDate() {return writeDate;}
	
	//BoardVO setters
	public void setNo(int no) {this.no = no;}
	public void setTitle(String title) {this.title = title;}
	public void setContent(String content) {this.content = content;}
	public void setWriter(int writerNo) {this.writer_no = writerNo;}
	public void setWriteDate(Date writeDate) {this.writeDate = writeDate;}

}//main

//CREATE TABLE QA_board
//(
//    `no`          INT              NOT NULL    AUTO_INCREMENT COMMENT '번호', 
//    `title`       VARCHAR(64)      NOT NULL    COMMENT '제목', 
//    `content`     VARCHAR(1024)    NOT NULL    COMMENT '내용', 
//    `writer_no`   INT              NOT NULL    COMMENT '작성자 번호', 
//    `write_date`  TIMESTAMP        NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '작성일', 
//    `secret`      TINYINT          NOT NULL    DEFAULT 0 COMMENT '비밀글 여부', 
//    PRIMARY KEY (no)
//);