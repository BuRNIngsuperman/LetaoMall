package cn.edu.seu.letao.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
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
 * @since 2020-04-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class OmReturn implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 唯一标识id
     */
    @TableId(value = "return_id", type = IdType.AUTO)
    private Integer returnId;

    /**
     * 订单号
     */
    private String orderSn;

    /**
     * 申请创建时间
     */
    private LocalDateTime createdTime;

    /**
     * 退货数量
     */
    private Integer returnCount;

    /**
     * 退货人姓名
     */
    private String returnName;

    /**
     * 退货人电话
     */
    private String returnPhone;

    /**
     * 申请状态
     */
    private Integer status;

    /**
     * 申请原因
     */
    private String reason;

    /**
     * 退货商品条码
     */
    private String productSn;


}
