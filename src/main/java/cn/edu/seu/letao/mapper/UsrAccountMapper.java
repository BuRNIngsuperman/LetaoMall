package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.UsrAccount;
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
public interface UsrAccountMapper extends BaseMapper<UsrAccount> {

    List<UsrAccount> getAccountList(PageQueryUtil pageQueryUtil);

    int getTotalAdminCount(PageQueryUtil pageQueryUtil);

    int lockAccountBatch(@Param("ids") Integer[] ids, @Param("stopStatus") String stopStatus);

    int updateTypeRole(@Param("ids") Integer[] ids, @Param("role") String role);

}
