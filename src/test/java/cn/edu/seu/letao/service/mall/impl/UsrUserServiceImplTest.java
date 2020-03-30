package cn.edu.seu.letao.service.mall.impl;

import cn.edu.seu.letao.entity.UsrUser;
import cn.edu.seu.letao.mapper.UsrUserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UsrUserServiceImplTest {
    @Resource
    UsrUserMapper usrUserMapper;

    @Test
    void register() {

    }

    @Test
    void login() {
        Map<String,Object> map = new HashMap<>();
        map.put("login_name","13700002703");
        List<UsrUser> usrUsers = usrUserMapper.selectByMap(map);
        for (UsrUser usrUser : usrUsers) {
            System.out.println(usrUser.getPassword());
        }


    }
}
