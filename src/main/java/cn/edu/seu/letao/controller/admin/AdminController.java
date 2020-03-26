package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.entity.UsrAccount;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import org.springframework.util.StringUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping(path = {"","/","/index","index.html"})
    public String index(){
        return "admin/admin_index";
    }

    @RequestMapping(value = "/login",method = {RequestMethod.POST,RequestMethod.GET})
    public String login(){
        return "admin/admin_login";
    }

    @RequestMapping(value = "/register",method = {RequestMethod.POST,RequestMethod.GET})
    public String register(){
        return "admin/admin_login";
    }


    @RequestMapping(value = "/profile",method = {RequestMethod.POST,RequestMethod.GET})
    public String profile(){
        return "admin/admin_profile";
    }
}
