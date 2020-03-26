package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.service.admin.IAdminService;
import cn.edu.seu.letao.service.admin.impl.AdminServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import org.springframework.util.StringUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {


    @Autowired
    IAdminService adminService;

    @GetMapping("/login")
    public String login(){
        return "admin/admin_login";
    }

    @GetMapping("/index")
    public String index(){
        return "admin/admin_index";
    }

    @GetMapping("/orders")
    public String orders(){
        return "admin/admin_orders";
    }

    @GetMapping("/category")
    public String category(){
        return "admin/admin_category";
    }

    @GetMapping("/user")
    public String usrer(){
        return "admin/admin_user";
    }


    @GetMapping("/goods")
    public String goods(){
        return "admin/admin_goods";
    }

    @GetMapping("/goods/edit")
    public String goodsEdit(){
        return "admin/admin_goods_edit";
    }

    @GetMapping("/statistics")
    public String statistics(){
        return "admin/admin_statistics";
    }


    @PostMapping(value = "/login")
    public String login(@RequestParam("userName") String userName,
                        @RequestParam("password") String password,
                        @RequestParam("verifyCode") String verifyCode,
                        HttpSession session) {
        if (StringUtils.isEmpty(verifyCode)) {
            session.setAttribute("errorMsg", "验证码不能为空");
            return "admin/admin_login";
        }
        if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
            session.setAttribute("errorMsg", "用户名或密码不能为空");
            return "admin/admin_login";
        }
        String kaptchaCode = session.getAttribute("verifyCode") + "";
        if (StringUtils.isEmpty(kaptchaCode) || !verifyCode.equals(kaptchaCode)) {
            session.setAttribute("errorMsg", "验证码错误");
            return "admin/admin_login";
        }


        boolean bool=adminService.checkAccount(userName,password);

        if (bool) {
            session.setAttribute("loginUser", userName);
            return "redirect:/admin/index";
        } else {
            session.setAttribute("errorMsg", "登陆失败，请联系作者获得测试账号");
            return "admin/admin_login";
        }

    }

}
