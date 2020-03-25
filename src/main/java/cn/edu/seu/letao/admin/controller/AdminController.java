package cn.edu.seu.letao.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {


    @RequestMapping("/login")
    public String login(){
        return "admin/admin_login";
    }

    @RequestMapping("/index")
    public String index(){
        return "admin/admin_index";
    }

    @RequestMapping("/orders")
    public String orders(){
        return "admin/admin_orders";
    }

    @RequestMapping("/category")
    public String category(){
        return "admin/admin_category";
    }

    @RequestMapping("/user")
    public String usrer(){
        return "admin/admin_user";
    }


    @RequestMapping("/goods")
    public String goods(){
        return "admin/admin_goods";
    }

    @RequestMapping("/goods/edit")
    public String goodsEdit(){
        return "admin/admin_goods_edit";
    }

    @RequestMapping("/statistics")
    public String statistics(){
        return "admin/admin_statistics";
    }

}
