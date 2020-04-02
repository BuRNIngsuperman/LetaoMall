package cn.edu.seu.letao;

import cn.edu.seu.letao.service.mall.OrderService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class LetaoApplicationTests {
    @Autowired
    OrderService orderService;
    @Test
    void contextLoads() {
        String s = orderService.paySuccess("15858339724675188");
        System.out.println(s);
    }

}
