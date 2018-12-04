package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TArticle;
import com.zs.pms.vo.QueryArticle;


public interface ArticleDao {
	// 新增
	public int addArticle(TArticle article);

	// 批量删除
	public void deleteById(int[] ids);

	// 删除一条
	public void deleteArticle(int id);

	// 修改
	public void updateArticle(TArticle article);

	// 通过条件查询
	public List<TArticle> queryByCon(QueryArticle query);

	// 查询分页
	public List<TArticle> queryByPage(QueryArticle query);

	// 通过id查询主键
	public TArticle queryById(int id);

	// 查询总条数
	public int queryByCount(QueryArticle query);
}
