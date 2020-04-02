package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.entity.UsrUser;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author Jin Qiuyang
 * @date 2020/3/31
 */
public interface IAdminUserService extends IService<UsrUser> {


    /**
     * 后台分页
     */
    PageResult getMallUserPage(PageQueryUtil pageUtil);


    /**
     * 锁定用户
     */
    Boolean lockUsers(Integer[] ids, int lockStatus);
}
