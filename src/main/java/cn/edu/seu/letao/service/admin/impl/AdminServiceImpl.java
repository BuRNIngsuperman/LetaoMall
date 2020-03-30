package cn.edu.seu.letao.service.admin.impl;


import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.mapper.UsrAccountMapper;
import cn.edu.seu.letao.service.admin.IAdminService;
import cn.edu.seu.letao.util.MD5Util;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminServiceImpl extends ServiceImpl<UsrAccountMapper,UsrAccount> implements IAdminService {

    @Autowired
    UsrAccountMapper usrAccountMapper;


    @Override
    public boolean checkAccount(String username, String password) {

        password = MD5Util.MD5Encode(password,"UTF-8");
        QueryWrapper<UsrAccount> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username).eq("password", password).eq("stop","yes");
        UsrAccount usrAccount = usrAccountMapper.selectOne(wrapper);
        if (usrAccount != null)
            return true;
        return false;
    }

    @Override
    public boolean addAdminAccount(String username, String password) {
        QueryWrapper<UsrAccount> wrapper = new QueryWrapper<>();
        wrapper.eq("username",username);
        if(usrAccountMapper.selectOne(wrapper)!=null){
            return false;
        }

        UsrAccount usrAdmin = new UsrAccount();
        password = MD5Util.MD5Encode(password,"UTF-8");
        usrAdmin.setUsername(username);
        usrAdmin.setPassword(password);
        usrAdmin.setType("admin");
        usrAdmin.setStop("yes");
        usrAccountMapper.insert(usrAdmin);
        return true;
    }


}
