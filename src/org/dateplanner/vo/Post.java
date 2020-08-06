package org.dateplanner.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.dateplanner.commons.Region;

public class Post {
	
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd kk:mm");
	
	private int no;
	private String title;
	private String content;
	private String image;
	private User user;
	private int regionNo;
	private Boolean packageable;
	private Timestamp regdate;
	private int like;
	private int comments;
	
	public Post() {}
	public Post(int no) { this.no = no; }
	public Post(String title) { this.title = title; }
	
	public int getNo() { return no; }
	public String getTitle() { return title; }
	public String getContent() { return content; }
	public String getImage() { return image; }
	public User getUser() { return user; }
	public int getRegionNo() { return regionNo; }
	public String getRegion() { return Region.LIST.get(regionNo); }
	public Boolean getPackageable() { return packageable; }
	public Timestamp getRegdate() { return regdate; }
	public String getFormattedRegdate() { return regdate == null ? null : DATE_FORMAT.format(regdate); }
	public String getFormattedRegdate(Timestamp regdate) { return regdate == null ? null : DATE_FORMAT.format(regdate); }
	public int getLike() { return like; }
	public int getComments() { return comments; }
	public void setNo(int no) { this.no = no; }
	public void setTitle(String title) { this.title = title; }
	public void setContent(String content) { this.content = content; }
	public void setImage(String image) { this.image = image; }
	public void setUser(User user) { this.user = user; }
	public void setRegionNo(int regionNo) { this.regionNo = regionNo; }
	public void setPackageable(Boolean packageable) { this.packageable = packageable; }
	public void setRegdate(Timestamp regdate) { this.regdate = regdate; }
	public void setLike(int like) { this.like = like; }
	public void setComments(int comments) { this.comments = comments; }
	
	@Override
	public String toString() {
		return "Post [no=" + no + ", title=" + title + ", content=" + content + ", image=" + image + ", user=" + user
				+ ", regionNo=" + regionNo + ", packageable=" + packageable + ", regdate=" + regdate + ","
						+ ", like=" + like + ", comments=" + comments + "]";
	}
	
} //class Post;


/*
	CREATE TABLE `board` (
	  `no` int(10) NOT NULL AUTO_INCREMENT,
	  `title` varchar(150) NOT NULL,
	  `content` text NOT NULL,
	  `image` char(37) NOT NULL,
	  `user_no` int(10) NOT NULL,
	  `region_no` int(2) NOT NULL,
	  `packageable` tinyint(1) DEFAULT NULL,
	  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  PRIMARY KEY (`no`),
	  KEY `user_no_idx` (`user_no`),
	  CONSTRAINT `user_no` FOREIGN KEY (`user_no`) 
	  REFERENCES `users` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
	)ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8
*/
