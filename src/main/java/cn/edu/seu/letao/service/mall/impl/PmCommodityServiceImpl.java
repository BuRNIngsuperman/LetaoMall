package cn.edu.seu.letao.service.mall.impl;

import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.mapper.PmCommodityMapper;
import cn.edu.seu.letao.service.mall.IPmCommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PmCommodityServiceImpl implements IPmCommodityService {

    @Autowired
    PmCommodityMapper pmCommodityMapper;



    @Override
    public List<PmCommodity> getCommodityForIndex(int type, int number) {
        return pmCommodityMapper.getCommodityForIndex(type,number);
    }

    @Override
    public PmCommodity getDetail(Integer goodsId) {
        return pmCommodityMapper.selectById(goodsId);
    }
}
