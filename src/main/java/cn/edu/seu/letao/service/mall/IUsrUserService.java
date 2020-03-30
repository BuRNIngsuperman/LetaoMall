package cn.edu.seu.letao.service.mall;

import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.entity.UsrUser;

import javax.servlet.http.HttpSession;

public interface IUsrUserService {



     String login(String loginName, String password, HttpSession session);

     String register(String loginName, String password);
}
