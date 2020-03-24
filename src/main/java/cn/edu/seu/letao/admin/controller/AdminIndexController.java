package cn.edu.seu.letao.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminIndexController {

    @RequestMapping("/index")
    public String index(Model model){
        return "admin/admin_index";
    }
}
