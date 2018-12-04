package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TChannel;

import com.zs.pms.vo.QueryChannel;


public interface ChannelDao {
	// 新增
		public int addChannel(TChannel channel);

		// 批量删除
		public void deleteById(int[] ids);

		// 删除一条
		public void deleteChannel(int id);

		// 修改
		public void updateChannel(TChannel channel);

		// 通过条件查询
		public List<TChannel> queryByCon(QueryChannel query);

		// 查询分页
		public List<TChannel> queryByPage(QueryChannel query);

		// 通过id查询主键
		public List<TChannel> queryById(int id);

		// 查询总条数
		public int queryByCount(QueryChannel query);
}
