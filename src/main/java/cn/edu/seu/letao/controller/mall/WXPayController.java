package cn.edu.seu.letao.controller.mall;

import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.config.WXPayConfigImpl;
import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.service.mall.OrderService;
import cn.edu.seu.letao.service.mall.WXPayService;
import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import com.github.wxpay.sdk.WXPay;
import com.github.wxpay.sdk.WXPayConfig;
import com.github.wxpay.sdk.WXPayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/pay")
public class WXPayController {

    @Autowired
    private WXPayConfigImpl wxPayConfig;

    @Autowired
    private WXPayService wxPayService;

    @Autowired
    private OrderService orderService;


    @RequestMapping(value = "/codeUrl")
    public String unifiedOrder(RedirectAttributes model,@RequestParam("orderNo")String outTradeNo,@RequestParam("totalPrice")String totalPrice){
        Map<String, String> result = new HashMap<>();

        /*
            1. 用户提交订单, 生产订单并保存至数据库
            2. 获取订单号（商户订单号）、支付金额（totalFee）、商品ID（productId）
            3. 自定义参数：attach，可选
         */
        // 以下数据为模拟参数
        //String outTradeNo = new Long(new Date().getTime()).toString();
        //String outTradeNo = "20200326001";
        //String totalPrice = "1"; // 金额必须为整数，单位：分
        String totalFee= totalPrice.substring(0,totalPrice.length()-3);
        totalPrice = totalPrice.replace(".","");
        totalPrice = totalPrice.substring(0,totalPrice.length()-2);
        System.out.println("支付信息"+outTradeNo+" "+totalPrice);
        String body = "商品描述信息";
        String productId = new Long(new Date().getTime()).toString();
        String attach = "wxpay";

        String codeUrl = null;
        try {
            codeUrl = wxPayService.wxUnifiedOrder(outTradeNo, "1", body, productId, attach);
        } catch (Exception e) {
            e.printStackTrace();
        }
        result.put("codeUrl", codeUrl);
        //return result;
        //System.out.println("codeUrl");
        model.addFlashAttribute("totalPrice",totalFee);
        model.addFlashAttribute("orderNo",outTradeNo);
        model.addFlashAttribute("qrAddress",codeUrl);
        return "redirect:toPayPage";
    }

    @RequestMapping("/payOrder")
    public void payOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 获取微信回调信息
        InputStream inputStream = request.getInputStream();
        BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuffer sb = new StringBuffer();
        // 读取回调信息
        String line;
        while ((line = in.readLine()) != null) {
            sb.append(line);
        }
        in.close();
        inputStream.close();
        String strXml = sb.toString();
        Map<String, String> map = WXPayUtil.xmlToMap(strXml);

        System.out.println(strXml);

        // 获取业务信息
        String outTradeNo = map.get("out_trade_no");
        String totalFee = map.get("total_fee");
        String appId = map.get("appid");
        String mchId = map.get("mch_id");
        String transactionId = map.get("transaction_id");
        String resultCode = map.get("result_code");
        String attach = map.get("attach");

        // 验签
        boolean signatureValid = WXPayUtil.isSignatureValid(strXml, wxPayConfig.getKey());
        /* 补充以下代码
            1、验证该通知数据中的out_trade_no是否为商户系统中创建的订单号
            2、判断total_fee是否确实为该订单的实际金额（即商户订单创建时的金额）
            3、可选的验证自定义参数attach

            验证不通过则停止执行回调并通知微信订单处理失败
        */
        orderService.paySuccess(outTradeNo);



        PrintWriter writer = response.getWriter();
        // 签名是否正确
        if (signatureValid) {
            // 回调信息是否成功
            if ("SUCCESS".equals(map.get("result_code"))) {
                // 补充以下代码, 根据实际业务完善逻辑
                // 如：修改订单状态为"已付款" ...


                System.out.println("********付款成功********");
                // 通知微信订单处理成功
                String noticeStr = setXML("SUCCESS", "SUCCESS");
                writer.write(noticeStr);
                writer.flush();
            }
        } else {
            // 通知微信订单处理失败
            System.out.println("********付款失败********");
            String noticeStr = setXML("FAIL", "FAIL");
            writer.write(noticeStr);
            writer.flush();
        }
    }

    private String setXML(String return_code, String return_msg) {
        return "<xml><return_code><![CDATA[" + return_code + "]]></return_code><return_msg><![CDATA[" + return_msg + "]]></return_msg></xml>";
    }

    @RequestMapping(value="/toPayPage")
    public String toPayPage(Model model, @ModelAttribute("totalPrice")String totalPrice, @ModelAttribute("orderNo")String orderNo, @ModelAttribute("qrAddress")String qrAddress){

        System.out.println(totalPrice+orderNo+qrAddress);
//        model.addAttribute("totalPrice",request.getAttribute("totalFee"));
//        model.addAttribute("orderNo",request.getAttribute("orderNo"));
//        model.addAttribute("qrAddress",request.getAttribute("qrAddress"));
        System.out.println(model.getAttribute("totalFee"));
        return "mall/user_payPage";
    }

    @RequestMapping("/orderQuery")
    public Result orderQuery(Model model,String outTradeNo) throws Exception {


        Map<String, String> map = WXPayService.orderQuery(outTradeNo, "");
        String attach = map.get("attach");
        String appId = map.get("appid");
        String totalFee = map.get("total_fee");
        String strXml = WXPayUtil.mapToXml(map);
        String resultCode = map.get("result_code");
        System.out.println("strXml: " + strXml);
        if("SUCCESS".equals(resultCode)){
            return ResultGenerator.genSuccessResult();
        }
        else{
            return ResultGenerator.genFailResult("ERROR");
        }
    }


    @GetMapping("/paySuccess")
    @ResponseBody
    public Result paySuccess(@RequestParam("outTradeNo") String orderSn) {
        OmOrder order = orderService.getOrderByOrderSn(orderSn);
        if(order==null) return ResultGenerator.genFailResult("此订单不存在");
        int payType = order.getPayType();
        if (payType==2) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("未成功支付");
        }
    }


}
