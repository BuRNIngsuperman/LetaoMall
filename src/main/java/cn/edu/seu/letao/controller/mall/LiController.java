package cn.edu.seu.letao.controller.mall;

import cn.edu.seu.letao.common.Constants;
import cn.edu.seu.letao.common.LetaoMallException;
import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.controller.vo.LetaoMallCartItemVO;
import cn.edu.seu.letao.controller.vo.LetaoMallUserVO;
import cn.edu.seu.letao.controller.vo.OrderDetailVO;
import cn.edu.seu.letao.entity.OmCart;
import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.entity.UsrUser;
import cn.edu.seu.letao.service.mall.IOmCartService;
import cn.edu.seu.letao.service.mall.IUsrUserService;
import cn.edu.seu.letao.service.mall.OrderService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
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

    @Autowired
    OrderService orderService;

    @Autowired
    IUsrUserService iUsrUserService;

    @Autowired
    IOmCartService iOmCartService;

    /*个人中心界面*/
    @GetMapping("/personal")
    public String personalPage(HttpServletRequest request,
                               HttpSession httpSession) {
        request.setAttribute("path", "personal");
        return "mall/user_personal";
    }

    /*我的订单界面*/
    @GetMapping("/orders")
    public String orderListPage(@RequestParam Map<String, Object> params, HttpServletRequest request, HttpSession httpSession) {
        LetaoMallUserVO user = (LetaoMallUserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        params.put("userId", user.getUserId());
        if (StringUtils.isEmpty(params.get("page"))) {
            params.put("page", 1);
        }
        params.put("limit", Constants.ORDER_SEARCH_PAGE_LIMIT);
        //封装我的订单数据
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        request.setAttribute("orderPageResult", orderService.getMyOrders(pageUtil));
        request.setAttribute("path", "orders");
        return "mall/user_order";
    }

    /*加入购物车*/
    @PostMapping("/shop-cart")
    @ResponseBody
    public Result saveShoppingCartItem(@RequestBody OmCart cart,
                                       HttpSession httpSession) {
        LetaoMallUserVO user = (LetaoMallUserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        cart.setUserId(user.getUserId());
        //todo 判断数量
        String saveResult = iOmCartService.saveCartItem(cart);
        //添加成功
        if (ServiceResultEnum.SUCCESS.getResult().equals(saveResult)) {
            return ResultGenerator.genSuccessResult();
        }
        //添加失败
        return ResultGenerator.genFailResult(saveResult);
    }

    /*我的购物车界面*/
    @GetMapping("/shop-cart")
    public String cartListPage(HttpServletRequest request,
                               HttpSession httpSession) {
        LetaoMallUserVO user = (LetaoMallUserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        int itemsTotal = 0;
        int priceTotal = 0;
        List<LetaoMallCartItemVO> myShoppingCartItems = iOmCartService.getMyShoppingCartItems(user.getUserId());
        if (!CollectionUtils.isEmpty(myShoppingCartItems)) {
            //购物项总数
            itemsTotal = myShoppingCartItems.stream().mapToInt(LetaoMallCartItemVO::getQuantity).sum();
            if (itemsTotal < 1) {
                return "error/error_5xx";
            }
            //总价
            for (LetaoMallCartItemVO letaoMallCartItemVO : myShoppingCartItems) {
                priceTotal += letaoMallCartItemVO.getQuantity() * letaoMallCartItemVO.getOrderItemPrice().intValue();
            }
            if (priceTotal < 1) {
                return "error/error_5xx";
            }
        }
        request.setAttribute("itemsTotal", itemsTotal);
        request.setAttribute("priceTotal", priceTotal);
        request.setAttribute("myShoppingCartItems", myShoppingCartItems);
        return "mall/user_cart";
    }

    /*修改购物项的数量*/
    @PutMapping("/shop-cart")
    @ResponseBody
    public Result updateNewBeeMallShoppingCartItem(@RequestBody OmCart letaoMallCartItem,
                                                   HttpSession httpSession) {
        LetaoMallUserVO user = (LetaoMallUserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        letaoMallCartItem.setUserId(user.getUserId());
        //todo 判断数量
        String updateResult = iOmCartService.updateLetaoeMallCartItem(letaoMallCartItem);
        //修改成功
        if (ServiceResultEnum.SUCCESS.getResult().equals(updateResult)) {
            return ResultGenerator.genSuccessResult();
        }
        //修改失败
        return ResultGenerator.genFailResult(updateResult);
    }

    /*删除购物车中的某个购物项*/
    @DeleteMapping("/shop-cart/{cartItemId}")
    @ResponseBody
    public Result updateNewBeeMallShoppingCartItem(@PathVariable("cartItemId") Integer cartItemId,
                                                   HttpSession httpSession) {
        LetaoMallUserVO user = (LetaoMallUserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        Boolean deleteResult = iOmCartService.deleteById(cartItemId);
        //删除成功
        if (deleteResult) {
            return ResultGenerator.genSuccessResult();
        }
        //删除失败
        return ResultGenerator.genFailResult(ServiceResultEnum.OPERATE_ERROR.getResult());
    }

    /*订单结算页面*/
    @GetMapping("/shop-cart/settle")
    public String settlePage(HttpServletRequest request,
                             HttpSession httpSession) {
        int priceTotal = 0;
        LetaoMallUserVO user = (LetaoMallUserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        List<LetaoMallCartItemVO> myShoppingCartItems = iOmCartService.getMyShoppingCartItems(user.getUserId());
        if (CollectionUtils.isEmpty(myShoppingCartItems)) {
            //无数据则不跳转至结算页
            return "/shop-cart";
        } else {
            //总价
            for (LetaoMallCartItemVO newBeeMallShoppingCartItemVO : myShoppingCartItems) {
                priceTotal += newBeeMallShoppingCartItemVO.getQuantity() * newBeeMallShoppingCartItemVO.getOrderItemPrice().intValue();
            }
            if (priceTotal < 1) {
                return "error/error_5xx";
            }
        }
        request.setAttribute("priceTotal", priceTotal);
        request.setAttribute("myShoppingCartItems", myShoppingCartItems);
        return "mall/user_saveOrder";
    }

    /*提交订单跳转到跳转到订单详情页*/
    @GetMapping("/saveOrder")
    public String saveOrder(HttpSession httpSession) {
        LetaoMallUserVO user = (LetaoMallUserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        List<LetaoMallCartItemVO> myShoppingCartItems = iOmCartService.getMyShoppingCartItems(user.getUserId());
        if (StringUtils.isEmpty(user.getAddress().trim())) {
            //无收货地址
            LetaoMallException.fail(ServiceResultEnum.NULL_ADDRESS_ERROR.getResult());
        }
        if (CollectionUtils.isEmpty(myShoppingCartItems)) {
            //购物车中无数据则跳转至错误页
            LetaoMallException.fail(ServiceResultEnum.SHOPPING_ITEM_ERROR.getResult());
        }
        //保存订单并返回订单号
        String saveOrderResult = orderService.saveOrder(user, myShoppingCartItems);
        //跳转到订单详情页
        return "redirect:/orders/" + saveOrderResult;
    }

    /*订单详情页面*/
    @GetMapping("/orders/{orderSn}")
    public String orderDetailPage(HttpServletRequest request, @PathVariable("orderSn") String orderSn, HttpSession httpSession) {
        LetaoMallUserVO user = (LetaoMallUserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        OrderDetailVO orderDetailVO = orderService.getOrderDetailByOrderNo(orderSn, user.getUserId());
        if (orderDetailVO == null) {
            return "error/error_5xx";
        }
        request.setAttribute("orderDetailVO", orderDetailVO);
        return "mall/order-detail";
    }

    @GetMapping("/selectPayType")
    public String selectPayType(HttpServletRequest request, @RequestParam("orderNo") String orderNo, HttpSession httpSession) {
        LetaoMallUserVO user = (LetaoMallUserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        OmOrder letaoMallOrder = orderService.getLetaoMallOrderByOrderNo(orderNo);
        //todo 判断订单userId
        //todo 判断订单状态
        httpSession.setAttribute("orderNo", orderNo);
        httpSession.setAttribute("totalPrice", letaoMallOrder.getTotalAmount());
        return "redirect:/pay/codeUrl";
    }

    //退出回到登录界面
    @GetMapping("/logout")
    public String logout(HttpSession httpSession) {
        httpSession.removeAttribute(Constants.MALL_USER_SESSION_KEY);
        return "mall/user_login";
    }

    //修改个人信息
    @PostMapping("/personal/updateInfo")
    @ResponseBody
    public Result updateInfo(@RequestBody UsrUser mallUser, HttpSession httpSession) {
        LetaoMallUserVO mallUserTemp = iUsrUserService.updateUserInfo(mallUser,httpSession);
        if (mallUserTemp == null) {
            Result result = ResultGenerator.genFailResult("修改失败");
            return result;
        } else {
            //返回成功
            Result result = ResultGenerator.genSuccessResult();
            return result;
        }
    }





}
