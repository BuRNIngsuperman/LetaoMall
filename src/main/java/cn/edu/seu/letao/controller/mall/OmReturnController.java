package cn.edu.seu.letao.controller.mall;


import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.entity.OmReturn;
import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.service.mall.IOmReturnService;
import cn.edu.seu.letao.service.mall.IPmCommodityService;
import cn.edu.seu.letao.service.mall.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Hala
 * @since 2020-03-23
 */
@Controller
public class OmReturnController {

    @Autowired
    IOmReturnService iOmReturnService;


    @RequestMapping("/return")
    public String returnOrder(HttpServletRequest request){
        request.setAttribute("path","return");
        return "mall/orderReturn";
    }

    @PostMapping("/returnApp")
    public String returnApp(OmReturn omReturn){
        int status=0;
        omReturn.setStatus(0);
        omReturn.setCreatedTime(new Date());
        iOmReturnService.saveReturn(omReturn);
        return "redirect:/personal";
    }



}
