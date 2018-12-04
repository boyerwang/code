package com.zs.pms.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class UploadController {
	/**
	 * 普通文件上传
	 * 
	 * @param file
	 *            新文件名
	 * @param req
	 *            上传的文件 与input的name相同
	 * @return
	 */
	@RequestMapping("/upload/common.do")
	@ResponseBody
	public String uploadFile(MultipartFile file, HttpServletRequest req) {
		// 获得upload文件夹的物理路径
		String path = req.getRealPath("/upload");
		// 创建文件夹名 目标文件
		/**
		 * 利用uuid算法 随机生成32位码 uuid算法 根据网卡、时间、ip地址等信息 自动生成绝不重复的32位码
		 */
		UUID uuid = UUID.randomUUID();
		// 目标文件名32位+文件后缀（源文件的原生文件名）
		String destfilename = uuid.toString() + file.getOriginalFilename();
		// 创建新文件 物理路径/新文件名
		File destfile = new File(path + File.separator + destfilename);
		try {
			// 原始拷贝到新文件
			file.transferTo(destfile);
			return destfilename;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "ERROR";
		}

	}

}
