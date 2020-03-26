package cn.edu.seu.letao.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin")
public class AdminAccountController {

    @RequestMapping(value = "/account",method = {RequestMethod.GET,RequestMethod.POST})
    public String accountPage(){
        return "admin/admin_account";
    }

}
