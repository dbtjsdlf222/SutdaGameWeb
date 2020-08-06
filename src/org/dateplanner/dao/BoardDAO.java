package org.dateplanner.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.dateplanner.vo.Package;
import org.dateplanner.vo.Page;
import org.dateplanner.vo.Post;

public interface BoardDAO {
	
	public boolean insertPost(Post post);
	public void delete(@Param(value="boardNo")int boardNo);
	public boolean insertPackage(Post post);
	public boolean update(Post post);
	public int checkPackageable(Package pack);
	public int selectTotalByUserNo(int userNo);
	public int selectTotalByRegion(int regionNo);
	public int selectTotalByTitle(String title);
	public Post selectByNo(int no);
	public List<Post> selectPackageable(int userNo);
	
	public List<Post> selectByUserNoWithPage(@Param(value = "userNo") int userNo, @Param(value = "page") Page page);
	public List<Post> selectByTitleAndRegionWithPage(@Param(value = "page") Page page, @Param(value = "title") String title);
	public List<Post> selectByRegionWithPage(@Param(value = "regionNo") int regionNo, @Param(value = "page") Page page);
	public List<Post> selectPackageWithRegion(@Param(value = "regionNo") int regionNo, @Param(value = "page") Page page);
	public List<Post> selectPackageWithRegionAndTitle(@Param(value = "title") String title, @Param(value = "regionNo") int regionNo, @Param(value = "page") Page page);
	
} //interface BoardDAO;
