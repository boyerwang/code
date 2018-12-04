package com.zs.pms.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.pms.exception.BusinessException;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.utils.DateUtil;
import com.zs.pms.vo.QueryUser;

@Controller
public class ChkController {
	@Autowired
	UserService us;

	@RequestMapping("/tologin.do")
	public String tologin() {
		return "login";
	}

	@RequestMapping("/login.do")
	public String input(QueryUser query, ModelMap map,  HttpSession session) {
		// 获取图片中的验证码
		String ocode = (String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		// 验证码不同
		if (!query.getCode().equals(ocode)) {
			map.addAttribute("msg", "验证码输入有误，请重新输入");
			return "login";
		}
		// 验证码相同
		TUser user;
		try {
			user = us.chkLogin(query);
			session.setAttribute("CHKUSER", user);
			// 获得当前日期
			session.setAttribute("TODAY", DateUtil.getStrDate(new Date()));
			return "main";
		} catch (BusinessException e) {
			// TODO Auto-generated catch block
			// 将数据带回页面
			map.addAttribute("msg", e.getErrMsg());
			// 回到登录页面
			return "login";

		} catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
			return "error";
		}

	}

	@RequestMapping("/totop.do")
	// 去页面顶端
	public String totop() {
		return "top";
	}

	// 去页面左
	@RequestMapping("/toleft.do")
	public String toleft() {
		return "left";
	}

	// 去页面右
	@RequestMapping("/toright.do")
	public String toright() {
		return "right";
	}
}
