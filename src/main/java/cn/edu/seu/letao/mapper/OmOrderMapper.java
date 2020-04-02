package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.util.PageQueryUtil;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Hala
 * @since 2020-03-23
 */
public interface OmOrderMapper extends BaseMapper<OmOrder> {


    int getMyOrderCount(PageQueryUtil pageUtil);

    List<OmOrder> findMyOrderList(PageQueryUtil pageUtil);

    //后台使用
    List<OmOrder> findOrderList(PageQueryUtil pageUtil);
}
