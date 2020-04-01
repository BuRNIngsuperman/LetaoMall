package cn.edu.seu.letao.entity;

/**
 * @author shkstart
 * @create 2020-03-31 18:05
 * 库存修改所需实体
 */
public class StockNumDTO {

    private Integer commId;

    private Integer stock;

    public Integer getCommId() {
        return commId;
    }

    public void setCommId(Integer commId) {
        this.commId = commId;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }
}
