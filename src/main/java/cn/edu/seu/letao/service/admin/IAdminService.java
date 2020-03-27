package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.entity.UsrAccount;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

public interface IAdminService {

    /*
    * 检查账户名，密码
    * 正确返回 true
    * 错误返回 false
    * */
    public boolean checkAccount(String username,String password);
}
