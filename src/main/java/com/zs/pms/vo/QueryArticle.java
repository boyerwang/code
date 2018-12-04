package com.zs.pms.vo;

import java.util.Date;

import com.zs.pms.utils.QueryPage;

public class QueryArticle extends QueryPage{
	private String title;
//	private String content; 
//	private String author;
//	private Date crtime;
//	
	private int isremod;
//	private int ishot;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
//	public String getContent() {
//		return content;
//	}
//	public void setContent(String content) {
//		this.content = content;
//	}
//	public String getAuthor() {
//		return author;
//	}
//	public void setAuthor(String author) {
//		this.author = author;
//	}
//	public Date getCrtime() {
//		return crtime;
//	}
//	public void setCrtime(Date crtime) {
//		this.crtime = crtime;
//	}
	public int getIsremod() {
		return isremod;
	}
	public void setIsremod(int isremod) {
		this.isremod = isremod;
	}
//	public int getIshot() {
//		return ishot;
//	}
//	public void setIshot(int ishot) {
//		this.ishot = ishot;
//	}
//	


}
