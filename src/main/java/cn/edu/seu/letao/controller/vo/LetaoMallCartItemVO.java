package cn.edu.seu.letao.controller.vo;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author shkstart
 * @create 2020-03-31 15:44
 */
public class LetaoMallCartItemVO implements Serializable {

    private Integer id;

    private Integer commId;

    private Integer quantity;//购买数量

    private String name;//商品名称

    private String albumPics;//商品图片

    private BigDecimal price;//商品价格

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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
