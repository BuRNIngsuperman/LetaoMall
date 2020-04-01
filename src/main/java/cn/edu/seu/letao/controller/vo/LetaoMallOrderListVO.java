package cn.edu.seu.letao.controller.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-03-31 14:38
 */
public class LetaoMallOrderListVO implements Serializable {
    private Integer orderId;//订单id

    private String orderSn;//订单编号

    private BigDecimal payAmount;//订单价格

    private Integer payType;

    private Integer status;//订单状态

    private String orderStatusString;//订单状态描述

    //private String userAddress;

    private LocalDateTime createdTime;

    private List<LetaoMallOrderItemVO> letaoMallOrderItemVOS;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn;
    }

    public BigDecimal getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(BigDecimal payAmount) {
        this.payAmount = payAmount;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
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

    public LocalDateTime getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(LocalDateTime createdTime) {
        this.createdTime = createdTime;
    }

    public List<LetaoMallOrderItemVO> getLetaoMallOrderItemVOS() {
        return letaoMallOrderItemVOS;
    }

    public void setLetaoMallOrderItemVOS(List<LetaoMallOrderItemVO> letaoMallOrderItemVOS) {
        this.letaoMallOrderItemVOS = letaoMallOrderItemVOS;
    }
}
