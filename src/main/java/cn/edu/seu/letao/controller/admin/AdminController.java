package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.service.admin.IAdminService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.util.StringUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    IAdminService adminService;

    @GetMapping(path = {"","/","/index","index.html"})
    public String index(){
        return "admin/admin_index";
    }

    @GetMapping(value = "/login")
    public String toLogin(){
        return "admin/admin_login";
    }

    @PostMapping(value = "/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        @RequestParam("verifyCode") String verifyCode,
                        HttpSession session) {
        if (StringUtils.isEmpty(verifyCode)) {
            session.setAttribute("errorMsg", "验证码不能为空");
            return "admin/admin_login";
        }
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            session.setAttribute("errorMsg", "用户名或密码不能为空");
            return "admin/admin_login";
        }
        String kaptchaCode = session.getAttribute("verifyCode") + "";
        if (StringUtils.isEmpty(kaptchaCode) || !verifyCode.equals(kaptchaCode)) {
            session.setAttribute("errorMsg", "验证码错误");
            return "admin/admin_login";
        }
        Boolean bool = adminService.checkAccount(username, password);
        if (bool) {
            session.setAttribute("loginUser", username);
            return "redirect:/admin/index";
        } else {
            session.setAttribute("errorMsg", "登陆失败，没有此账户");
            return "admin/admin_login";
        }
    }


    @RequestMapping(value = "/register",method = {RequestMethod.GET})
    public String toRegister(){
        return "admin/admin_register";
    }

    @PostMapping(value = "/register")
    public String register(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("verifyCode") String verifyCode,
                           HttpSession session){
        if (StringUtils.isEmpty(verifyCode)) {
            session.setAttribute("Msg", "验证码不能为空");
            return "admin/admin_register";
        }
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            session.setAttribute("Msg", "用户名或密码不能为空");
            return "admin/admin_register";
        }
        String kaptchaCode = session.getAttribute("verifyCode") + "";
        if (StringUtils.isEmpty(kaptchaCode) || !verifyCode.equals(kaptchaCode)) {
            session.setAttribute("Msg", "验证码错误");
            return "admin/admin_register";
        }

        boolean flag = adminService.addAdminAccount(username,password);
        if(flag){
            session.setAttribute("loginUser", username);
            return "redirect:/admin/index";
        }else {
            session.setAttribute("Msg", "注册失败，用户名已存在");
            return "admin/admin_register";
        }
    }


    @RequestMapping(value = "/profile",method = {RequestMethod.POST,RequestMethod.GET})
    public String profile(){

        return "admin/admin_profile";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("loginUserId");
        request.getSession().removeAttribute("loginUser");
        request.getSession().removeAttribute("errorMsg");
        return "admin/admin_login";
    }
}
