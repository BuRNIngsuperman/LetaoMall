package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.util.PageQueryUtil;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import javax.jws.soap.SOAPBinding;
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

}
