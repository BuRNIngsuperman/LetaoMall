package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.OmOrderItem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Hala
 * @since 2020-03-23
 */
public interface OmOrderItemMapper extends BaseMapper<OmOrderItem> {

    List<OmOrderItem> selectByOrderIds(@Param("orderIds") List<Integer> orderIds);

    //lijia
    int insertBatch(@Param("orderItems") List<OmOrderItem> leTaoMallOrderItems);

    List<OmOrderItem> selectByOrderId(Integer orderId);
}
