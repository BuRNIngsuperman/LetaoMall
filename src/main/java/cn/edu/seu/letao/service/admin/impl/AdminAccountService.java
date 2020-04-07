package cn.edu.seu.letao.service.admin.impl;

import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.mapper.UsrAccountMapper;
import cn.edu.seu.letao.service.admin.IAdminAccountService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Jin Qiuyang
 * @date 2020/4/1
 */
@Service
public class AdminAccountService extends ServiceImpl<UsrAccountMapper, UsrAccount> implements IAdminAccountService {

    @Autowired
    UsrAccountMapper usrAccountMapper;


    @Override
    public PageResult getAccountPage(PageQueryUtil pageQueryUtil) {
        List<UsrAccount> list = usrAccountMapper.getAccountList(pageQueryUtil);
        int total = usrAccountMapper.getTotalAdminCount(pageQueryUtil);
        PageResult pageResult = new PageResult(list,total,pageQueryUtil.getLimit(),pageQueryUtil.getPage());
        return pageResult;
    }

    @Override
    public boolean lockAccounts(Integer[] ids, String stopStatus) {
        if(ids.length < 1){
            return false;
        }

        return usrAccountMapper.lockAccountBatch(ids,stopStatus) > 0;
    }

    @Override
    public boolean updateRoleType(Integer[] ids, String role) {
        if(ids.length < 1){
            return false;
        }
        return usrAccountMapper.updateTypeRole(ids,role) > 0;
    }
}
