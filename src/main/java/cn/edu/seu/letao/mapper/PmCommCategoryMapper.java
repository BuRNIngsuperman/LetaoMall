package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.PmCommCategory;
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
 * @since 2020-03-23
 */
public interface PmCommCategoryMapper extends BaseMapper<PmCommCategory> {


    public List<PmCommCategory> selectByLevelAndParentIdsAndNumber(@Param("parentIds") List<Integer> parentIds, @Param("categoryLevel") int categoryLevel, @Param("number") int number);


    public List<PmCommCategory> selectByLevelAndParentIds(List<Integer> parentIds, int categoryLevel);

    List<PmCommCategory> selectForPage(PageQueryUtil pageUtil);

}
