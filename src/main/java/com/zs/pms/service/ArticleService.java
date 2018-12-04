package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.BusinessException;
import com.zs.pms.po.TArticle;

import com.zs.pms.vo.QueryArticle;


public interface ArticleService {
	// 新增
		public int addArticle(TArticle article)throws BusinessException;

		// 批量删除
		public void deleteById(int[] ids)throws BusinessException;

		// 删除一条
		public void deleteArticle(int id)throws BusinessException;

		// 修改
		public void updateArticle(TArticle article)throws BusinessException;

		// 通过条件查询
		public List<TArticle> queryByCon(QueryArticle query)throws BusinessException;

		// 查询分页
		public List<TArticle> queryByPage(QueryArticle query,int page)throws BusinessException;

		// 通过id查询主键
		public TArticle queryById(int id)throws BusinessException;

		// 查询总条数
		public int queryByCount(QueryArticle query)throws BusinessException;

}
