package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.BusinessException;
import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserService {
	public TUser chkLogin(QueryUser query) throws BusinessException;

	// 获得一条
	public TUser queryById(int id) ;

	// 通过条件查询
	public List<TUser> queryByCon(QueryUser query)throws BusinessException;

	// 查询分页
	public List<TUser> queryByPage(QueryUser query, int page);

	// 批量删除
	public void deleteById(int[] ids)throws BusinessException;

	// 修改
	public void updateUser(TUser user)throws BusinessException;

	// 新增
	public int addUser(TUser user)throws BusinessException;

	// 删除一条
	public void deleteUser(int id)throws BusinessException;

	// 查询总条数
	public int queryByCount(QueryUser query);

}
