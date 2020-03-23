package cn.edu.seu.letao.commCategory.entity;

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
public class PmCommCategory implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 商品分类id
     */
    @TableId(value = "cid", type = IdType.AUTO)
    private Integer cid;

    /**
     * 上级分类的编号：0表示一级分类
     */
    private Integer parentId;

    /**
     * 商品分类名称
     */
    private String cname;

    /**
     * 分类级别：0->1级；1->2级
     */
    private Integer level;

    /**
     * 商品数量
     */
    private Integer productCount;

    /**
     * 商品单位
     */
    private String productUnit;

    /**
     * 是否显示在导航栏：0->不显示；1->显示
     */
    private Integer navStatus;

    /**
     * 显示状态：0->不显示；1->显示
     */
    private Integer showStatus;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 图标
     */
    private String icon;

    /**
     * 关键字
     */
    private String keywords;

    /**
     * 描述
     */
    private String description;


}
