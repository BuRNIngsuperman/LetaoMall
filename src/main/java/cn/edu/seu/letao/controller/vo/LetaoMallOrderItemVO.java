package cn.edu.seu.letao.controller.vo;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 订单详情页页面订单项VO
 */
public class LetaoMallOrderItemVO implements Serializable {
    private Integer commId; //商品id

    private Integer quantity;//购买数量

    private String name;//商品名称

    private String albumPics;//商品图片

    private BigDecimal price;//商品价格

    public Integer getCommId() {
        return commId;
    }

    public void setCommId(Integer commId) {
        this.commId = commId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAlbumPics() {
        return albumPics;
    }

    public void setAlbumPics(String albumPics) {
        this.albumPics = albumPics;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
