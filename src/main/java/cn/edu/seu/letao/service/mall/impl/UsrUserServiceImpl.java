package cn.edu.seu.letao.service.mall.impl;

import cn.edu.seu.letao.common.Constants;
import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.controller.vo.LetaoMallUserVO;
import cn.edu.seu.letao.entity.UsrUser;
import cn.edu.seu.letao.mapper.UsrUserMapper;
import cn.edu.seu.letao.service.mall.IUsrUserService;
import cn.edu.seu.letao.util.BeanUtil;
import cn.edu.seu.letao.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UsrUserServiceImpl implements IUsrUserService {

    @Autowired(required = false)
    UsrUserMapper usrUserMapper;




    @Override
    public String login(String loginName, String password , HttpSession httpSession) {
        Map<String,Object> map = new HashMap<>();
        map.put("login_name",loginName);
        map.put("password",password);
        List<UsrUser> users = usrUserMapper.selectByMap(map);

        if (users.size()>0 && httpSession != null) {
            UsrUser user = users.get(0);
            if (user.getLockedFlag() == 1) {
                return ServiceResultEnum.LOGIN_USER_LOCKED.getResult();
            }
            //昵称太长 影响页面展示
            if (user.getNickName() != null && user.getNickName().length() > 7) {
                String tempNickName = user.getNickName().substring(0, 7) + "..";
                user.setNickName(tempNickName);
            }
            LetaoMallUserVO letaoMallUserVO = new LetaoMallUserVO();
            BeanUtil.copyProperties(user, letaoMallUserVO);
            //设置购物车中的数量
            httpSession.setAttribute(Constants.MALL_USER_SESSION_KEY, letaoMallUserVO);
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.LOGIN_ERROR.getResult();
    }

    @Override
    public String register(String loginName, String password) {
        Map<String,Object> map = new HashMap<>();
        map.put("login_name",loginName);
        if (usrUserMapper.selectByMap(map).size()>0) {
            return ServiceResultEnum.SAME_LOGIN_NAME_EXIST.getResult();
        }
        UsrUser usrUser = new UsrUser();
        usrUser.setLoginName(loginName);
        usrUser.setNickName(loginName);
        String passwordMD5 = MD5Util.MD5Encode(password, "UTF-8");
        usrUser.setPassword(passwordMD5);
        if (usrUserMapper.insert(usrUser) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }
}
