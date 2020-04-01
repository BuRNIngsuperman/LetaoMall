package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.entity.UsrAccount;

import com.baomidou.mybatisplus.extension.service.IService;


public interface IAdminService extends IService<UsrAccount> {

    /*
    * 检查账户名，密码
    * 正确返回 true
    * 错误返回 false
    * */
    UsrAccount checkAccount(String username,String password);

    boolean addAdminAccount(String name,String password);

    boolean updateName(int userId,String originalUsername,String newUsername);

    boolean updatePassword(int userId,String originalPaw,String newPaw);


}
