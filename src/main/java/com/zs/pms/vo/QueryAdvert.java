package com.zs.pms.vo;

import java.util.Date;

import com.zs.pms.utils.QueryPage;

public class QueryAdvert extends QueryPage {
	private String title;
	private String content;
	private Date crtime;
	private String cman;
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
