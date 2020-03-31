package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.entity.PmCommCategory;
import cn.edu.seu.letao.entity.PmCommodity;
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

    /**
     * 添加商品
     */
    public String saveCommodity(PmCommodity commodity);

    /**
     * 修改商品
     */
    public String updateCommodity(PmCommodity commodity);

    /**
     * 根据id获取商品
     */
    public PmCommodity getGoodsById(int id);

}
