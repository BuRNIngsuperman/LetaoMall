package cn.edu.seu.letao.controller.mall;

import cn.edu.seu.letao.config.WXPayConfigImpl;
import cn.edu.seu.letao.service.mall.WXPayService;
import com.github.wxpay.sdk.WXPayConfig;
import com.github.wxpay.sdk.WXPayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping(value = "/codeUrl", method = {RequestMethod.GET})
    public Map<String, String> unifiedOrder(){
        Map<String, String> result = new HashMap<>();

        /*
            1. 用户提交订单, 生产订单并保存至数据库
            2. 获取订单号（商户订单号）、支付金额（totalFee）、商品ID（productId）
            3. 自定义参数：attach，可选
         */
        // 以下数据为模拟参数
        String outTradeNo = new Long(new Date().getTime()).toString();
        String totalFee = "3"; // 金额必须为整数，单位：分
        String body = "商品描述信息";
        String productId = new Long(new Date().getTime()).toString();
        String attach = "wxpay";

        String codeUrl = null;
        try {
            codeUrl = wxPayService.wxUnifiedOrder(outTradeNo, totalFee, body, productId, attach);
        } catch (Exception e) {
            e.printStackTrace();
        }
        result.put("codeUrl", codeUrl);
        return result;
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
            String noticeStr = setXML("FAIL", "FAIL");
            writer.write(noticeStr);
            writer.flush();
        }
    }

    private String setXML(String return_code, String return_msg) {
        return "<xml><return_code><![CDATA[" + return_code + "]]></return_code><return_msg><![CDATA[" + return_msg + "]]></return_msg></xml>";
    }

    @GetMapping("/toPayPage")
    public String toPayPage(Model model, String qrAddress, String totalFee,String orderNo){
        model.addAttribute("totalPrice",totalFee);
        model.addAttribute("orderNo",orderNo);
        model.addAttribute("qrAddress",qrAddress);
        return "mall/user_payPage";
    }


}
