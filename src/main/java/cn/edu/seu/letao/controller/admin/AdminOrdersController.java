package cn.edu.seu.letao.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin")
public class AdminOrdersController {

    @RequestMapping(value = "/orders",method = {RequestMethod.GET,RequestMethod.POST})
    public String ordersShow(){
        return "admin/admin_orders";
    }

}
