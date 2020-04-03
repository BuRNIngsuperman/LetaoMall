package cn.edu.seu.letao.controller.vo;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 搜索列表页商品VO
 */
public class SearchGoodsVO implements Serializable {

    private Integer commId;

    private String name;

    private String description;

    private String albumPics;

    private BigDecimal price;

    public Integer getGoodsId() {
        return commId;
    }

    public void setCommId(Integer goodsId) {
        this.commId = goodsId;
    }

    public String getGoodsName() {
        return name;
    }

    public void setName(String goodsName) {
        this.name = goodsName;
    }

    public String getGoodsIntro() {
        return description;
    }

    public void setDescription(String goodsIntro) {
        this.description = goodsIntro;
    }

    public String getGoodsCoverImg() {
        return albumPics;
    }

    public void setAlbumPics(String goodsCoverImg) {
        this.albumPics = goodsCoverImg;
    }

    public BigDecimal getSellingPrice() {
        return price;
    }

    public void setPrice(BigDecimal sellingPrice) {
        this.price = sellingPrice;
    }
}
