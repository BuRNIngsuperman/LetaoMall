package cn.edu.seu.letao.controller.mall;


import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.entity.OmReturn;
import cn.edu.seu.letao.service.mall.IOmReturnService;
import cn.edu.seu.letao.service.mall.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
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

    @Autowired
    OrderService orderService;

    @RequestMapping("/return/{orderSn}")
    public String returnOrder(@PathVariable String orderSn, Model model){
        model.addAttribute("orderSn",orderSn);
        OmOrder order = orderService.getOrderByOrderSn(orderSn);
        BigDecimal returnAmount = order.getTotalAmount();
        model.addAttribute("returnAmount",returnAmount);
        return "mall/orderReturn";
    }

    @RequestMapping("/returnApplication")
    public String returnApplication(Model model, @RequestParam String returnName,@RequestParam String returnPhone,
                                    @RequestParam String reason,@RequestParam String orderSn,@RequestParam String returnAmount){
        OmReturn omReturn=new OmReturn();
        omReturn.setOrderSn(orderSn);
        omReturn.setReturnAmount(new BigDecimal(returnAmount));
        omReturn.setReturnName(returnName);
        omReturn.setReturnPhone(returnPhone);
        omReturn.setReason(reason);

        iOmReturnService.saveOmReturn(omReturn);

        return "redirect:/personal";
    }

}
