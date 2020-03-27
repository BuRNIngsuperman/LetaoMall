package cn.edu.seu.letao.service.admin;


public interface IAdminService {

    /*
    * 检查账户名，密码，账户类型
    * 正确返回 true
    * 错误返回 false
    * */
    public boolean checkAccount(String username,String password);
}
