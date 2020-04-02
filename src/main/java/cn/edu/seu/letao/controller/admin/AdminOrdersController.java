package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.service.admin.IAdminOrderService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Objects;


@Controller
@RequestMapping("/admin")
public class AdminOrdersController {

    @Autowired
    IAdminOrderService orderService;

    @GetMapping("/orders")
    public String ordersPage(HttpServletRequest request) {
        request.setAttribute("path", "orders");
        return "admin/admin_orders";
    }

    /**
     * 列表
     */
    @RequestMapping(value = "/orders/list", method = RequestMethod.GET)
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(orderService.getOrdersPage(pageUtil));
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/orders/update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(@RequestBody OmOrder order) {
        if (Objects.isNull(order.getTotalAmount())
                || Objects.isNull(order.getOrderId())
                || order.getOrderId() < 1
                || order.getTotalAmount().intValue()<1
                || StringUtils.isEmpty(order.getAddress())) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = orderService.updateOrderInfo(order);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult(result);
        }
    }


}
