package com.zs.pms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.ArticleDao;
import com.zs.pms.exception.BusinessException;
import com.zs.pms.po.TArticle;
import com.zs.pms.vo.Constants;
import com.zs.pms.vo.QueryArticle;
@Service
@Transactional // 该业务支持事务
public class ArticleServiceImpl implements ArticleService{
	@Autowired
 private ArticleDao art;
	@Override
	/**
	 * 文章新增
	 */
	@Transactional(rollbackFor = Exception.class) // 有异常就回滚否则提交
	public int addArticle(TArticle article) throws BusinessException{
		// TODO Auto-generated method stub
		return art.addArticle(article);
	}

	@Override
	/**
	 * 批量删除
	 */
	@Transactional(rollbackFor = Exception.class) // 有异常就回滚否则提交
	public void deleteById(int[] ids)throws BusinessException {
		// TODO Auto-generated method stub
		art.deleteById(ids);
	}

	@Override
	/**
	 * 删除一条
	 */
	@Transactional(rollbackFor = Exception.class) // 有异常就回滚否则提交
	public void deleteArticle(int id)throws BusinessException {
		// TODO Auto-generated method stub
		art.deleteArticle(id);
		
	}

	@Override
	/**
	 * 修改文章
	 */
	@Transactional(rollbackFor = Exception.class) // 有异常就回滚否则提交
	public void updateArticle(TArticle article) throws BusinessException{
		// TODO Auto-generated method stub
		art.updateArticle(article);
	}

	@Override
	/**
	 * 通过条件查询
	 */
	public List<TArticle> queryByCon(QueryArticle query) throws BusinessException{
		// TODO Auto-generated method stub
		// 获得总条数
		return art.queryByCon(query);


	}

	@Override
	/**
	 * 查分页
	 */
	public List<TArticle> queryByPage(QueryArticle query,int page)throws BusinessException {
		// TODO Auto-generated method stub
		query.setPage(page);
		return art.queryByPage(query);
	}

	@Override
	/**
	 * 通过主键查询
	 */
	public TArticle queryById(int id)throws BusinessException {
		// TODO Auto-generated method stub
		return art.queryById(id);
	}

	@Override
	/**
	 * 分页
	 */
	public int queryByCount(QueryArticle query) throws BusinessException{
		// TODO Auto-generated method stub
		int count = art.queryByCount(query);
		// 总条数%总页数为0时表示刚好
		if (count % Constants.PAGECOUNT == 0) {
			return count % Constants.PAGECOUNT;
			// 不能被整除时+一页
		} else {
			return count % Constants.PAGECOUNT + 1;
		}
	
	}

}
