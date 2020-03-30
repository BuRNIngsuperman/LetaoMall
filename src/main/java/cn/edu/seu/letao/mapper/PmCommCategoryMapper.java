package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.PmCommCategory;
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
public interface PmCommCategoryMapper extends BaseMapper<PmCommCategory> {

    public List<PmCommCategory> selectByLevelAndParentIdsAndNumber(List<Integer> parentIds, int categoryLevel);

}
