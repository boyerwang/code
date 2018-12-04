package com.zs.pms.vo;

import java.util.Date;

import com.zs.pms.utils.QueryPage;

public class QueryUser extends QueryPage {
	private String username;
	private String password;
	private int isenabled;
  private String realname;
  private String code;

	public String getCode() {
	return code;
}

public void setCode(String code) {
	this.code = code;
}

	public String getRealname() {
	return realname;
}

public void setRealname(String realname) {
	this.realname = realname;
}

	public int getIsenabled() {
		return isenabled;
	}

	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
