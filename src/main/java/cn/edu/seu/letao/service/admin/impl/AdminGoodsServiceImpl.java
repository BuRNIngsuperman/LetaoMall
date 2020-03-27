package cn.edu.seu.letao.service.admin.impl;

import cn.edu.seu.letao.entity.PmCommodity;
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

    @Override
    public PageResult getGoodsPage(PageQueryUtil pageUtil) {
        List<PmCommodity> goodsList = commodityMapper.selectByMap(null);
        int total = commodityMapper.selectCount(null);
        PageResult pageResult = new PageResult(goodsList, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

}
