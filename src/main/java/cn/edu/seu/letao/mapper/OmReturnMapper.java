package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.OmReturn;
import cn.edu.seu.letao.util.PageQueryUtil;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Hala
 * @since 2020-04-07
 */
public interface OmReturnMapper extends BaseMapper<OmReturn> {

    //后台使用
    List<OmReturn> getReturnOrderList(PageQueryUtil pageUtil);

    int accepReturntOrder(@Param("ids") List<Integer> asList);

    int closeReturnOrder(@Param("ids") List<Integer> asList);


}
