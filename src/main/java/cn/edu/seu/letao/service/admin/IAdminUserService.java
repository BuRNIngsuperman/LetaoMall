package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.entity.UsrUser;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;

/**
 * @author Jin Qiuyang
 * @date 2020/3/31
 */
public interface IAdminUserService extends IService<UsrUser> {


    /**
     * 后台分页
     * @param pageUtil
     * @return
     */
    PageResult getMallUserPage(PageQueryUtil pageUtil);


    Boolean lockUsers(Integer[] ids, int lockStatus);
}
