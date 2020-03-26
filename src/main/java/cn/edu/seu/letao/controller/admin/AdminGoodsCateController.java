package cn.edu.seu.letao.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin")
public class AdminGoodsCateController {

    @RequestMapping(value = "/categories",method = {RequestMethod.GET,RequestMethod.POST})
    public String categoriesPage(){
        return "admin/admin_category";
    }
}
