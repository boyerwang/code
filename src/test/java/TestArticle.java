import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.BusinessException;
import com.zs.pms.service.ArticleService;
import com.zs.pms.vo.QueryArticle;


//使用spring框架
@RunWith(SpringJUnit4ClassRunner.class)
// 引入配置文件
@ContextConfiguration("classpath:applicationcontext.xml")
public class TestArticle {
	@Autowired
	ArticleService as;
	
	public void testDeleteBy() throws BusinessException{
		int[] ids={3000,3001};
		as.deleteById(ids);
	}
	
	public void testQueryPage() throws BusinessException{
		QueryArticle qa=new QueryArticle();
		qa.setPage(2);
		qa.setIsremod(1);
		
		as.queryByCon(qa);
		
		
	}
	@Test
	public void testttt() throws BusinessException{
		
		as.deleteArticle(3003);
	}
	
	public void testById() throws BusinessException{
	as.queryById(3004);
		
		
	}
	
	
	
	

}
