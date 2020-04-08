package cn.edu.seu.letao.service.admin.impl;

import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.entity.PmCommCategory;
import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.mapper.PmCommCategoryMapper;
import cn.edu.seu.letao.mapper.PmCommodityMapper;
import cn.edu.seu.letao.service.admin.IAdminGoodsService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminGoodsServiceImpl implements IAdminGoodsService {


    @Autowired
    PmCommodityMapper commodityMapper;

    @Autowired
    PmCommCategoryMapper categoryMapper;

    /*
    * 分页查询商品数量
    * */
    @Override
    public PageResult getGoodsPage(PageQueryUtil pageUtil) {
        List<PmCommodity> goodsList = commodityMapper.selectForPage(pageUtil);
        int total = commodityMapper.selectCount(null);
        PageResult pageResult = new PageResult(goodsList, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }


    /*
    * 上架下架商品
    * */
    @Override
    public boolean updateSellStatus(Long[] ids, int sellStatus) {
        return commodityMapper.updateSellStatus(ids,sellStatus);
    }

    /**
     * 添加商品
     */
    @Override
    public String saveCommodity(PmCommodity commodity){

        commodity.setDeleteStatus(0);
        commodity.setVerifyStatus(1);
        commodity.setBrandId(0);
        commodity.setSort(0);
        commodity.setSale(0);
        commodity.setKeywords("keyWords");
        if(commodityMapper.insert(commodity) > 0)
            return  ServiceResultEnum.SUCCESS.getResult();

        return ServiceResultEnum.DB_ERROR.getResult();
    }

    /**
     * 修改商品
     */
    public String updateCommodity(PmCommodity commodity){
        if(commodityMapper.updateById(commodity) > 0)
            return  ServiceResultEnum.SUCCESS.getResult();

        return ServiceResultEnum.DB_ERROR.getResult();
    }
    /**
     * 获取商品信息
     */
    @Override
    public PmCommodity getGoodsById(int id){
        return commodityMapper.selectById(id);
    }


}
