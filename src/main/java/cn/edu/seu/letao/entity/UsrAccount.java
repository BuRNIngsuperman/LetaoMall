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
public class UsrAccount implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 账户id
     */
    @TableId(value = "acco_id", type = IdType.AUTO)
    private Integer accoId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 账户类型
     */
    private String type;

    /**
     * 是否启用
     */
    private String stop;


}
