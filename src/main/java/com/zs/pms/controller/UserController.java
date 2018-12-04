package com.zs.pms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zs.pms.exception.BusinessException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.TUser;
import com.zs.pms.service.DepService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

/*
 * 用户控制器
 * */
@Controller
public class UserController {
	@Autowired
	UserService us;// 用户服务
	@Autowired
	DepService ds;// 部门服务

	// 二级url
	@RequestMapping("/user/list.do")
	public String list(QueryUser query, String page, ModelMap map) {
		if (page == null || "".equals(page)) {
			// 默认第一页
			page = "1";
		}
		// 带回分页数据
		map.addAttribute("LIST", us.queryByPage(query, Integer.parseInt(page)));
		// 带回总页数
		map.addAttribute("PAGECOUNT", us.queryByCount(query));
		// 会带当前页数
		map.addAttribute("PAGE", page);
		// 回带查询条件
		map.addAttribute("QUERY", query);
		// 返回list.jsp
		return "user/list";
	}

	@RequestMapping("/user/toadd.do")
	public String toadd(ModelMap map) {
		// 获得一级部门
		List<TDep> list1=ds.queryByPid(0);
		
		map.addAttribute("DLIST",list1 );
//		获得一级部门下的二级部门列表
		List<TDep>list2=ds.queryByPid(list1.get(0).getId());
		map.addAttribute("DLIST2", list2);
	
		return "user/add";

	}

	/**
	 * 以ajax方式响应 方法返回string 直接返回文本 方法返回对象 返回json格式 自动调用jsonArray
	 * 
	 * @param pid
	 * @return
	 */
	@RequestMapping("/user/getdep.do")
	@ResponseBody
	public List<TDep> geTDeps(int pid) {
		List<TDep> list = ds.queryByPid(pid);
		return list;

	}
@RequestMapping("/user/add.do")
	public String add(TUser user, ModelMap map, HttpSession session) {

		try {
			// 获得session中的用户信息
			TUser cuser = (TUser) session.getAttribute("CHKUSER");
			// 创建人
			user.setCreator(cuser.getId());
			// 可用
			user.setIsenabled(1);
			us.addUser(user);
			// 跳转到指定的url 不需要传参
			return "redirect:list.do";
		} catch (BusinessException e) {
			// TODO Auto-generated catch block
			map.addAttribute("MSG", e.getErrMsg());
			// 执行方法 ， 传参
			return this.toadd(map);
		}

	}
	/**
	 * 删除一条
	 * @param id
	 * @return
	 */
	@RequestMapping("/user/delete.do")
	public String delete(int id){
		try {
			us.deleteUser(id);
		} catch (BusinessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:list.do";
	}
	/**
	 * 删除多条
	 * @param ids
	 * @return
	 */
	@RequestMapping("/user/deletes.do")
	public String deletes(int[] ids){
		try {
			us.deleteById(ids);
		} catch (BusinessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return"redirect:list.do";
	}
	/**
	 * 修改
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("/user/get.do")
	public String get(int id,ModelMap map) {
		TUser user= us.queryById(id);
			map.addAttribute("USER", user);
		// 获得一级部门
		List<TDep> list1=ds.queryByPid(0);		
		map.addAttribute("DLIST",list1 );
//		获得一级部门下的二级部门列表
		List<TDep>list2=ds.queryByPid(user.getDept().getPid());
		map.addAttribute("DLIST2", list2);
	
		return "user/update";

	}
	@RequestMapping("/user/update.do")
	public String update(TUser user,HttpSession session,ModelMap map){
		TUser cuser = (TUser) session.getAttribute("CHKUSER");
		user.setUpdator(cuser.getId());
		try {
			us.updateUser(user);
			return "redirect:list.do";
		} catch (BusinessException e) {
			// TODO Auto-generated catch block
		map.addAttribute("MSG", e.getErrMsg());
		return get(user.getId(), map);
		}
		
	}
	

}
