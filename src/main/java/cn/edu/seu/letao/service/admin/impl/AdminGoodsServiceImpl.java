package cn.edu.seu.letao.service.admin.impl;

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

    /*
    * 根据父级别id,自身等级查询，分类级别信息
    * */
    @Override
    public List<PmCommCategory> selectByLevelAndParentIdsAndNumber(List<Integer> parentIds, int categoryLevel){

        return categoryMapper.selectByLevelAndParentIdsAndNumber(parentIds, categoryLevel,0);
    }

}
