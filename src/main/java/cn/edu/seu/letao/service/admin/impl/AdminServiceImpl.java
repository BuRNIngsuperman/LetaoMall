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
import java.util.Date;

@Service
public class AdminServiceImpl extends ServiceImpl<UsrAccountMapper,UsrAccount> implements IAdminService {

    @Autowired
    UsrAccountMapper usrAccountMapper;


    @Override
    public UsrAccount checkAccount(String username, String password) {

        password = MD5Util.MD5Encode(password,"UTF-8");
        QueryWrapper<UsrAccount> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username).eq("password", password).eq("stop","yes");
        UsrAccount usrAccount = usrAccountMapper.selectOne(wrapper);
        return usrAccount;
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
        usrAdmin.setType("normal");
        usrAdmin.setStop("yes");
        usrAdmin.setCreateTime(new Date());
        usrAccountMapper.insert(usrAdmin);
        return true;
    }

    @Override
    public boolean updateName(int userId, String originalUsername, String newUsername) {
        UsrAccount usrAccount = usrAccountMapper.selectById(userId);
        //当前用户非空
        if (usrAccount != null){
            usrAccount.setUsername(newUsername);
            return usrAccountMapper.updateById(usrAccount) > 0;
        }
        return false;
    }

    @Override
    public boolean updatePassword(int userId, String originalPaw, String newPaw) {
        UsrAccount usrAccount = usrAccountMapper.selectById(userId);
        //当前用户非空
        if(usrAccount != null){
            String originalPawMd5 = MD5Util.MD5Encode(originalPaw,"UTF-8");
            String newPawMd5 = MD5Util.MD5Encode(newPaw,"UTF-8");

            //密码相等时才能更改
            if(originalPawMd5.equals(usrAccount.getPassword())){
                usrAccount.setPassword(newPawMd5);
                return usrAccountMapper.updateById(usrAccount) > 0;
            }
        }
        return false;
    }

}
