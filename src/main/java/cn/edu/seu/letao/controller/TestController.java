package cn.edu.seu.letao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TestController {


    @GetMapping({"/index", "/", "/index.html"})
    public String indexPage(){
        return "mall/index";
    }
}
