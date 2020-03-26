package cn.edu.seu.letao.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
public class PmCommImages implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 图片id
     */
    @TableId(value = "imageId", type = IdType.AUTO)
    private Integer imageId;

    /**
     * 商品id
     */
    private Integer commId;

    /**
     * 图片位置
     */
    private String location;

    /**
     * 图片
     */
    private String image;


}
