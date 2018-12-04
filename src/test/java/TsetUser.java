import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.BusinessException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

//使用spring框架
@RunWith(SpringJUnit4ClassRunner.class)
// 引入配置文件
@ContextConfiguration("classpath:applicationcontext.xml")
public class TsetUser {
	@Autowired
	UserService us;
	

	public void testLogin() {
		QueryUser query = new QueryUser();
		query.setUsername("test2");
		query.setPassword("222");
		try {
			// 调用查询登录的方法
			TUser user = us.chkLogin(query);
			System.out.println(user.getRealname() + "===" + user.getDept().getName());
			// 遍历权限列表
			for (TPermission permission : user.getPermissions()) {
				System.out.println(permission.getPname());
			}
			for (TPermission per1 : user.getMenu()) {
				System.out.println(per1.getPname());
				for (TPermission per2 : per1.getChildren()) {
					System.out.println(per2.getPname());
				}
			}
		} catch (BusinessException e) {
			System.out.println(e.getErrMsg());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}
	
	public void testLogin2() throws BusinessException {
		QueryUser query = new QueryUser();
		query.setUsername("test2");
		query.setPassword("222");
		query.setIsenabled(1);
		us.queryByCon(query);
		
		
	}
	
	public void deleteBy() throws BusinessException{
		int[] ids={3056,3057};
		us.deleteById(ids);
		
		
	}
	
	public void testt() throws BusinessException{
		us.deleteUser(3058);
		
	}

	public void update(){
		TUser user=new TUser();
		user.setId(3050);
		user.setBirthday(new Date());
		TDep de=new TDep();
		de.setId(10);
		
	}
	
	public void queryPage() throws BusinessException{
		QueryUser user=new QueryUser();
		user.setPage(2);
		
		us.queryByCon(user);
		
		
	}
	@Test
	public void testAdd(){
		TUser user=new TUser();
		user.setBirthday(new Date());
		TDep dep=new TDep();
		user.setDept(dep);
		user.setEmail("asfd@qq.com");
		user.setRealname("sa");
		dep.setId(88);
		user.setUsername("text211");
		user.setPassword("123");
		user.setSex("女");
		user.setPic("aa.jpg");
		user.setCreator(200);
		try {
			us.addUser(user);
		} catch (BusinessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void testPage() throws BusinessException{
		QueryUser user=new QueryUser();
		user.setIsenabled(1);
		System.out.println(us.queryByCount(user));
		for (TUser user2: us.queryByPage(user, 2)) {
			System.out.println(user2.getRealname());
		}
		
		
	}
	

}
