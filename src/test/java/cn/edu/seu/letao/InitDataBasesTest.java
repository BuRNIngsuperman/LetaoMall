package cn.edu.seu.letao;

import cn.edu.seu.letao.service.admin.IAdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author Jin Qiuyang
 * @date 2020/3/30
 */

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = LetaoApplication.class)
public class InitDataBasesTest {
    @Autowired
    IAdminService adminService;

    @Test
    public void test(){
        adminService.addAdminAccount("test1","test1");
    }
}
