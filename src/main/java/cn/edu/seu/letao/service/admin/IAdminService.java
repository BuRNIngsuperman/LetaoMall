package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.entity.UsrAccount;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import jdk.nashorn.internal.runtime.UserAccessorProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

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
