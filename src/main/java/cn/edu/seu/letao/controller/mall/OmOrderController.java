package cn.edu.seu.letao.controller.mall;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
@RequestMapping("/mall/om-order")
public class OmOrderController {

    @GetMapping("/payPage")
    public String toPayPage(){
        return "mall/payPage";
    }



}
