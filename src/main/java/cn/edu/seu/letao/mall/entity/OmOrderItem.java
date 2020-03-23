package cn.edu.seu.letao.mall.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author Hala
 * @since 2020-03-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class OmOrderItem implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 订单项id
     */
    @TableId(value = "item_id", type = IdType.AUTO)
    private Integer itemId;

    /**
     * 订单id
     */
    private Integer orderId;

    /**
     * 商品id
     */
    private Integer commId;

    /**
     * 购买数量
     */
    private Integer productQuantity;

    /**
     * 订单项目价格
     */
    @TableField("orderItemPrice")
    private BigDecimal orderItemPrice;

    /**
     * 商品的销售属性1
     */
    private String sp1;


}
