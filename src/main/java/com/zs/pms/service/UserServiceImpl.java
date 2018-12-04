 package com.zs.pms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.UserDao;
import com.zs.pms.exception.BusinessException;
import com.zs.pms.po.TUser;
import com.zs.pms.utils.MD5;
import com.zs.pms.vo.Constants;
import com.zs.pms.vo.QueryUser;

/**
 * user实现
 * 
 * @author Administrator
 *
 */
@Service
@Transactional // 该业务支持事务
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao udao;

	@Override
	public TUser chkLogin(QueryUser query) throws BusinessException {
		// TODO Auto-generated method stub
		// 将明码加密
		MD5 md5 = new MD5();
		// 加密后的密码
		String ps1 = md5.getMD5ofStr(query.getPassword());
		// 将密码放到query中
		query.setPassword(ps1);
		List<TUser> list = udao.queryByCon(query);
		// 没有用户
		if (list == null || list.size() != 1) {
			throw new BusinessException("用户名或密码有误，请重新输入", 1000);
		}

		// 返回第一条
		TUser user = list.get(0);
		return udao.queryById(user.getId());
	}

	@Override
	// 通过条件查询
	public List<TUser> queryByCon(QueryUser query)throws BusinessException {
		// TODO Auto-generated method stub
		return udao.queryByCon(query);
	}

	@Override
	@Transactional(rollbackFor = Exception.class) // 有异常就回滚否则提交
	// 批量删除
	public void deleteById(int[] ids)throws BusinessException {
		// TODO Auto-generated method stub
		udao.deleteById(ids);

	}

	@Override
	@Transactional(rollbackFor = Exception.class) // 有异常就回滚否则提交
	// 用户修改
	public void updateUser(TUser user) throws BusinessException{
		// TODO Auto-generated method stub
		if (user.getIsenabled()==-1) {
			throw new BusinessException("不能修改不可用用户",1003);
		}
//		获得原来的用户
		TUser ouser=udao.queryById(user.getId());
		if (user.getPassword() != null && (!"".equals(user.getPassword()))&&!user.getPassword().equals(ouser.getPassword())) {
			MD5 md5 = new MD5();
			user.setPassword(md5.getMD5ofStr(user.getPassword()));

		}
		udao.updateUser(user);

	}

	@Override
	@Transactional(rollbackFor = Exception.class) // 有异常就回滚否则提交
	// 用户新增
	public int addUser(TUser user) throws BusinessException{

		// TODO Auto-generated method stub
		if ("admin".equals(user.getUsername())) {
			throw new  BusinessException("登录名不能为admin",1001);
		}
		return udao.addUser(user);
	}

	@Override
	// 查分页
	public List<TUser> queryByPage(QueryUser query, int page) {
		// TODO Auto-generated method stub
		// 将当前页设置到条件中
		query.setPage(page);
		// 设置起始和截止;
		return udao.queryByPage(query);
	}

	@Override
	@Transactional(rollbackFor = Exception.class) // 有异常就回滚否则提交
	// 删除一条信息
	public void deleteUser(int id)throws BusinessException {
		// TODO Auto-generated method stub
		udao.deleteUser(id);
	}

	// 计算总页数
	@Override
	public int queryByCount(QueryUser query) {
		// TODO Auto-generated method stub
		// 获得总条数
		int count = udao.queryByCount(query);
		// 总条数%总页数为0时表示刚好
		if (count % Constants.PAGECOUNT == 0) {
			return count % Constants.PAGECOUNT;
			// 不能被整除时+一页
		} else {
			return count % Constants.PAGECOUNT + 1;
		}

	}

	@Override
	public TUser queryById(int id) {
		// TODO Auto-generated method stub
		return udao.queryById(id);
	}

}
