package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserDao {
	// 通过条件查询
	public List<TUser> queryByCon(QueryUser query);

	// 查询分页
	public List<TUser> queryByPage(QueryUser query);

	// 通过id查询主键
	public TUser queryById(int id);

	// 批量删除
	public void deleteById(int[] ids);

	// 修改
	public void updateUser(TUser user);

	// 新增
	public int addUser(TUser user);

	// 删除一条
	public void deleteUser(int id);

	// 查询总条数
	public int queryByCount(QueryUser query);
}
