package cn.edu.seu.letao.controller.vo;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-04-01 18:28
 */
public class OrderDetailVO {

    private String orderSn;//订单编号

    private BigDecimal totalAmount;//订单总金额

    private Integer payStatus;//支付状态

    private String payStatusString;//支付状态说明

    private Integer payType;//支付方式

    private String payTypeString;//支付类型说明

    private LocalDateTime paymentTime;//支付时间

    private Integer  status;//订单状态

    private String orderStatusString;//订单状态说明

    private String address;//收货地址

    private Date createdTime;//订单创建时间

    private List<LetaoMallOrderItemVO> letaoMallOrderItemVOS;

    public List<LetaoMallOrderItemVO> getLetaoMallOrderItemVOS() {
        return letaoMallOrderItemVOS;
    }

    public void setLetaoMallOrderItemVOS(List<LetaoMallOrderItemVO> letaoMallOrderItemVOS) {
        this.letaoMallOrderItemVOS = letaoMallOrderItemVOS;
    }



    public String getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Integer getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }

    public String getPayStatusString() {
        return payStatusString;
    }

    public void setPayStatusString(String payStatusString) {
        this.payStatusString = payStatusString;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public String getPayTypeString() {
        return payTypeString;
    }

    public void setPayTypeString(String payTypeString) {
        this.payTypeString = payTypeString;
    }

    public LocalDateTime getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(LocalDateTime paymentTime) {
        this.paymentTime = paymentTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getOrderStatusString() {
        return orderStatusString;
    }

    public void setOrderStatusString(String orderStatusString) {
        this.orderStatusString = orderStatusString;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }
}
