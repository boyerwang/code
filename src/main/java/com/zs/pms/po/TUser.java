package com.zs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
/**
 * 用户表
 * @author Administrator
 *
 */
import java.util.Date;
import java.util.List;

import com.zs.pms.utils.DateUtil;

public class TUser implements Serializable {

	public int getUpdator() {
		return updator;
	}

	public void setUpdator(int updator) {
		this.updator = updator;
	}

	public int getCreator() {
		return creator;
	}

	public void setCreator(int creator) {
		this.creator = creator;
	}

	/**
	 * 网络唯一标识
	 */
	private static final long serialVersionUID = 6940772427894641987L;

	private int id;
	private String username;
	private String password;
	private String sex;
	private Date birthday;
	private String email;
	// dept, 关联对象一对一
	private TDep dept;
	private String realname;
	private int creator;
	private Date creatime;
	private int updator;
	private Date updatime;
	private String pic;
	private int isenabled;
	private List<TPermission> permissions;
	private String isenabledTxt;
	private String birthdayTxt;
	
	

	public String getBirthdayTxt() {
		return DateUtil.getStrDate(birthday);
	}

	public void setBirthdayTxt(String birthdayTxt) {
		this.birthdayTxt = birthdayTxt;
	}

	public String getIsenabledTxt() {
		if (isenabled==1) {
			return "可用";
		} else {
			return "不可用";
		}
	
	}

	public void setIsenabledTxt(String isenabledTxt) {
		this.isenabledTxt = isenabledTxt;
	}

	public List<TPermission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<TPermission> permissions) {
		this.permissions = permissions;
	}

	// 菜单由Permission整理
	private List<TPermission> menu = new ArrayList<TPermission>();

	// 整理菜单
	public List<TPermission> getMenu() {
		// 清空
		menu.clear();
		for (TPermission per1 : permissions) {
			// 一级菜单
			if (per1.getPid() == 0) {
				// 清空1111
				per1.getChildren().clear();
				// 装载一级菜单下的二级菜单
				for (TPermission per2 : permissions) {
					// 一级菜单的id等于二级菜单的pid11
					if (per1.getId() == per2.getPid()) {
						per1.getChildren().add(per2);
					}
				}
				// 装在好的一级菜单放入菜单中
				menu.add(per1);
			}
		}

		return menu;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public TDep getDept() {
		return dept;
	}

	public void setDept(TDep dept) {
		this.dept = dept;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}



	public Date getCreatime() {
		return creatime;
	}

	public void setCreatime(Date creatime) {
		this.creatime = creatime;
	}



	public Date getUpdatime() {
		return updatime;
	}

	public void setUpdatime(Date updatime) {
		this.updatime = updatime;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public int getIsenabled() {
		return isenabled;
	}

	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}

}
