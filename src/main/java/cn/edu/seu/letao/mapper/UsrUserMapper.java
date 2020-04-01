package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.UsrUser;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import com.alibaba.druid.sql.PagerUtils;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Hala
 * @since 2020-03-30
 */
public interface UsrUserMapper extends BaseMapper<UsrUser> {

    List<UsrUser> findMallUserList(PageQueryUtil pageQueryUtil);

    int getTotalMallUsersCount(PageQueryUtil pageUtil);

    int updateUserInfo(UsrUser user);

}
