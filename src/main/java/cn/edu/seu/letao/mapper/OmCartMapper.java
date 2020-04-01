package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.OmCart;
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
public interface OmCartMapper extends BaseMapper<OmCart> {


    OmCart selectByUserIdAndCommId(@Param("userId") Long userId, @Param("commId") Integer commId);

    int updateByPrimaryKeySelective(OmCart cartItemUpdate);

    int selectCountByUserId(Long userId);

    int insertSelective(OmCart cart);

    List<OmCart> selectByUserId(@Param("userId") Long userId, @Param("number") int number);

    OmCart selectByPrimaryKey(Integer id);
}
