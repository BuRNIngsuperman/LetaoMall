package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.service.admin.IAdminService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.springframework.util.StringUtils;
import org.thymeleaf.model.IModel;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    IAdminService adminService;

    @GetMapping(path = {"","/","/index","index.html"})
    public String index(HttpServletRequest request){
        request.setAttribute("path", "index");
        return "admin/admin_index";
    }

    /*
    * 跳转登陆页面
    * */
    @GetMapping(value = "/login")
    public String toLogin(){
        return "admin/admin_login";
    }

    /*
     * 在登陆页面发出登陆请求
     * */
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
        UsrAccount usrAccount = adminService.checkAccount(username, password);
        if (usrAccount != null) {
            session.setAttribute("loginUser", username);
            session.setAttribute("loginUserId",usrAccount.getAccoId());
            //session过期时间设置为7200秒 即两小时
            //session.setMaxInactiveInterval(60 * 60 * 2);
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
            QueryWrapper<UsrAccount> wrapper = new QueryWrapper<>();
            wrapper.eq("username",username);
            UsrAccount usrAccount = adminService.getOne(wrapper);
            session.setAttribute("loginUserId",usrAccount.getAccoId());
            return "redirect:/admin/index";
        }else {
            session.setAttribute("Msg", "注册失败，用户名已存在");
            return "admin/admin_register";
        }
    }


    @RequestMapping(value = "/profile",method = {RequestMethod.GET})
    public String profile(HttpServletRequest request,Model model){
        Integer userId = (int)request.getSession().getAttribute("loginUserId");
        QueryWrapper<UsrAccount> wrapper = new QueryWrapper<>();
        wrapper.eq("acco_id",userId);
        UsrAccount usrAccount = adminService.getOne(wrapper);
        if(usrAccount == null){
            return "admin/admin_login";
        }
        model.addAttribute("path", "profile");
        model.addAttribute("loginUserName",usrAccount.getUsername());
        return "admin/admin_profile";
    }

    @RequestMapping(value = "/profile/name",method = {RequestMethod.POST})
    @ResponseBody
    public String updateName(HttpServletRequest request, @RequestParam("loginUserName") String originalUserName,
                             @RequestParam("nickName") String newUserName){
        if (originalUserName == null || newUserName == null){
            return "参数不能为空";
        }
        int userId = (int) request.getSession().getAttribute("loginUserId");
        if(adminService.updateName(userId,originalUserName,newUserName)){
            return ServiceResultEnum.SUCCESS.getResult();
        }else {
            return "修改失败";
        }
    }

    @RequestMapping(value = "/profile/password",method = {RequestMethod.POST})
    @ResponseBody
    public String updatepassword(HttpServletRequest request, @RequestParam("originalPassword") String originalPassword,
                             @RequestParam("newPassword") String newPassword){
        if(originalPassword == null || newPassword == null){
            return "参数不能为空";
        }
        int userId = (int)request.getSession().getAttribute("loginUserId");
        if(adminService.updatePassword(userId,originalPassword,newPassword)){
            //修改密码成功后清空所有Session，并跳转至登录页面
            request.getSession().removeAttribute("loginUserId");
            request.getSession().removeAttribute("loginUser");
            request.getSession().removeAttribute("errorMsg");
            return ServiceResultEnum.SUCCESS.getResult();

        }else {
            return "修改失败";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("loginUserId");
        request.getSession().removeAttribute("loginUser");
        request.getSession().removeAttribute("errorMsg");
        return "admin/admin_login";
    }
}
