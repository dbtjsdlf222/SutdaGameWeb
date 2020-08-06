package org.dateplanner.vo;

import java.util.List;

public class Package {
	
	private Post post;
	private List<Post> placeList;
	private int like;
	
	public Post getPost() { return post; }
	public List<Post> getPlaceList() { return placeList; }
	public int getLike() { return like; }
	public void setPost(Post post) { this.post = post; }
	public void setPlaceList(List<Post> placeList) { this.placeList = placeList; }
	public void setLike(int like) { this.like = like; }
	
	@Override
	public String toString() { return "Package [post=" + post + ", placeList=" + placeList + "]"; }
	
} //class Package;

/*
 CREATE TABLE `package` (
 
		  `no` int(10) NOT NULL,
		  `place_no` int(10) NOT NULL,
		  `order` int(10) NOT NULL
		) ENGINE=InnoDB DEFAULT CHARSET=utf8
*/