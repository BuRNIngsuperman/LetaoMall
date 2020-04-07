package cn.edu.seu.letao.service.mall.impl;

import cn.edu.seu.letao.controller.vo.SearchGoodsVO;
import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.mapper.PmCommodityMapper;
import cn.edu.seu.letao.service.mall.IPmCommodityService;
import cn.edu.seu.letao.util.BeanUtil;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
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

    @Override
    public PageResult searchLetaoMallGoods(PageQueryUtil pageUtil) {
        List<PmCommodity> goodsList = pmCommodityMapper.findLetaoMallGoodsListBySearch(pageUtil);
        int total = pmCommodityMapper.getTotalLetaoMallGoodsBySearch(pageUtil);
        List<SearchGoodsVO> SearchGoodsVOS = new ArrayList<>();
        if (!CollectionUtils.isEmpty(goodsList)) {
            SearchGoodsVOS = BeanUtil.copyList(goodsList, SearchGoodsVO.class);
            for (SearchGoodsVO SearchGoodsVO : SearchGoodsVOS) {
                String goodsName = SearchGoodsVO.getGoodsName();
                String goodsIntro = SearchGoodsVO.getGoodsIntro();
                // 字符串过长导致文字超出的问题
                if (goodsName.length() > 28) {
                    goodsName = goodsName.substring(0, 28) + "...";
                    SearchGoodsVO.setName(goodsName);
                }
                if (goodsIntro.length() > 30) {
                    goodsIntro = goodsIntro.substring(0, 30) + "...";
                    SearchGoodsVO.setDescription(goodsIntro);
                }
            }
        }
        PageResult pageResult = new PageResult(SearchGoodsVOS, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }
}
