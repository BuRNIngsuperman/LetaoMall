package cn.edu.seu.letao.service.mall;

import cn.edu.seu.letao.config.WXPayConfigImpl;
import com.github.wxpay.sdk.WXPay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

@Component
public class WXPayService {

    @Autowired
    private WXPayConfigImpl config;

    /**
     * 微信扫码下单 native
     * @param outTradeNo, 商户订单号
     * @param totalFee, 支付金额
     * @param body, 商品描述信息
     * @param productId, 商品ID
     * @param attach 自定义参数，通知中原样返回
     * @return 二维码url
     * @throws Exception
     */
    public String wxUnifiedOrder(String outTradeNo,
                                        String totalFee,
                                        String body,
                                        String productId,
                                        String attach) throws Exception {
        WXPay wxpay = null;
        // 使用沙箱环境
        // wxpay = new WXPay(config, WXPayConstants.SignType.MD5, true);
        // 默认使用MD5，不使用沙箱环境
        wxpay = new WXPay(config);

        // 异步通知地址
        String notifyUrl = config.getNotifyUrl();

        Map<String, String> data = new HashMap<>();
        // 商品描述
        data.put("body", body);
        // 商户订单号
        data.put("out_trade_no", outTradeNo);
        // 标价金额
        data.put("total_fee", totalFee);
        // 产品id
        data.put("product_id", productId);
        // 终端IP:调用微信支付API服务器的IP地址
        String spbillCreateIp = config.getspbillCreateIp();
        data.put("spbill_create_ip", spbillCreateIp);
        // 交易类型:此处指定为扫码支付
        data.put("trade_type", "NATIVE");
        // 异步通知 url
        data.put("notify_url", notifyUrl);
        // 自定义参数
        data.put("attach", attach);
        Map<String, String> resp = null;
        try {
            resp = wxpay.unifiedOrder(data);
            System.out.println("-----------start---------------");
            System.out.println(resp);
            System.out.println("-----------end---------------");
        } catch (Exception e) {
            e.printStackTrace();
        }
        String codeUrl = resp.get("code_url");
        return codeUrl;
    }
    /**
     * 微信订单查询
     *
     * @param outTradeNo
     * @param transactionId
     * @return
     * @throws Exception
     */
    public static Map<String, String> orderQuery(String outTradeNo, String transactionId) throws Exception {
        WXPayConfigImpl config = null;
        WXPay wxpay = null;
        config = new WXPayConfigImpl();
        // wxpay = new WXPay(config, WXPayConstants.SignType.MD5, true); // 使用沙箱
        wxpay = new WXPay(config);// 默认使用MD5，不使用沙箱环境

        Map<String, String> data = new HashMap<String, String>();
        if (!StringUtils.isEmpty(outTradeNo)) {
            data.put("out_trade_no", outTradeNo);
        }
        if (!StringUtils.isEmpty(transactionId)) {
            data.put("transaction_id", transactionId);
        }
        return wxpay.orderQuery(data);
    }

}
