package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;

public interface IAdminGoodsService {


    public PageResult getGoodsPage(PageQueryUtil pageUtil);
    public boolean updateSellStatus(Long[] ids,int sellStatus);

}
