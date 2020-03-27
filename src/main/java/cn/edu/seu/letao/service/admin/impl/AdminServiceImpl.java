package cn.edu.seu.letao.service.admin.impl;


import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.mapper.UsrAccountMapper;
import cn.edu.seu.letao.service.admin.IAdminService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements IAdminService {

    @Autowired
    UsrAccountMapper usrAccountMapper;

    /*
    * 登陆-检查管理员身份
    * 检查username,password,type
    * 符合条件：return true
    * */
    @Override
    public boolean checkAccount(String username,String password){
        QueryWrapper<UsrAccount> wrapper = new QueryWrapper<>();
        wrapper.eq("username",username).eq("password",password).eq("type","admin");
        UsrAccount usrAccount=usrAccountMapper.selectOne(wrapper);
        if(usrAccount!=null)
            return true;
        return false;
    }
}
