package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.entity.PmCommCategory;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;

import java.util.List;

public interface IAdminGoodsService {
    /*
    * 分页查询商品
    * */
    public PageResult getGoodsPage(PageQueryUtil pageUtil);

    /*上架下架商品*/
    public boolean updateSellStatus(Long[] ids,int sellStatus);

    /*查询商品分类表级别信息*/
    public List<PmCommCategory> selectByLevelAndParentIdsAndNumber(List<Integer> parentIds, int categoryLevel);

}
