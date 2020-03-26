package cn.edu.seu.letao.controller.mall;

import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author shkstart
 * @create 2020-03-26 15:06
 */
@Controller
public class LiController {
    //个人中心界面
    @GetMapping("/personal")
    public String personalPage(HttpServletRequest request,
                               HttpSession httpSession) {
        request.setAttribute("path", "personal");
        return "mall/user_personal";
    }

    //我的订单界面
    @GetMapping("/orders")
    public String orderListPage(@RequestParam Map<String, Object> params, HttpServletRequest request, HttpSession httpSession) {
        request.setAttribute("path", "orders");
        return "mall/user_order";
    }

    //我的购物车界面
    @GetMapping("/shop-cart")
    public String myCart(){
        return "mall/user_cart";
    }

    //订单结算页面
    @GetMapping("/shop-cart/settle")
    public String settle(){
        return "mall/user_saveOrder";
    }

    //提交订单跳转到跳转到订单详情页
    @GetMapping("/saveOrder")
    public String saveOrder() {
        return "mall/order-detail";
    }

    //退出回到登录界面
    @GetMapping("/logout")
    public String logout() {

        return "mall/user_login";
    }





}
