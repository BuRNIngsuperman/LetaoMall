package cn.edu.seu.letao.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin")
public class AdminGoodsController {

    @GetMapping("/goods")
    public String goodsShow(){
        return "admin/admin_goods";
    }

    @GetMapping("/goods/edit")
    public String goodsEdit(){
        return "admin/admin_goods_edit";
    }
}
