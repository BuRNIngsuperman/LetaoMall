package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author Jin Qiuyang
 * @date 2020/4/1
 */
public interface IAdminAccountService extends IService<UsrAccount> {

    /**
     * 管理员信息分类展示
     */
    PageResult getAccountPage(PageQueryUtil pageQueryUtil);

}
