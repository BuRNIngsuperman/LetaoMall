package cn.edu.seu.letao.mall.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Hala
 * @since 2020-03-23
 */
@Controller
@RequestMapping("/mall/usr-account")
public class UsrAccountController {
    @RequestMapping("/personal")
    public String personalPage(){
        return "mall/personal";
    }
}
