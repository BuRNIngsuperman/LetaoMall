package cn.edu.seu.letao.service.admin.impl;

import cn.edu.seu.letao.entity.UsrUser;
import cn.edu.seu.letao.mapper.UsrUserMapper;
import cn.edu.seu.letao.service.admin.IAdminUserService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Jin Qiuyang
 * @date 2020/3/31
 */
@Service
public class AdminUserServiceImpl extends ServiceImpl<UsrUserMapper, UsrUser> implements IAdminUserService {

    @Autowired
    UsrUserMapper usrUserMapper;

    @Override
    public PageResult getMallUserPage(PageQueryUtil pageUtil) {
        List<UsrUser> mallUserList = usrUserMapper.findMallUserList(pageUtil);
        int total = usrUserMapper.getTotalMallUsersCount(pageUtil);
        PageResult pageResult = new PageResult(mallUserList, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

    @Override
    public Boolean lockUsers(Integer[] ids, int lockStatus) {
        if(ids.length < 1){
            return false;
        }
        return usrUserMapper.lockUserBatch(ids,lockStatus) > 0;
    }
}
