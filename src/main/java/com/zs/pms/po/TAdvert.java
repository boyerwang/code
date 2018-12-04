package com.zs.pms.po;

import java.util.Date;

public class TAdvert {
	private int id; 
	private String title;
	private String content;
	private Date crtime;
	private String cman;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public Date getCrtime() {
		return crtime;
	}
	public void setCrtime(Date crtime) {
		this.crtime = crtime;
	}
	public String getCman() {
		return cman;
	}
	public void setCman(String cman) {
		this.cman = cman;
	}
	
}
