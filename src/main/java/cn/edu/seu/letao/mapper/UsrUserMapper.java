package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.UsrUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

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

     int updateUserInfo(UsrUser user);

}
