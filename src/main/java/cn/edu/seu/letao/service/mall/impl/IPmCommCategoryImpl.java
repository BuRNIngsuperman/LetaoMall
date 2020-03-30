package cn.edu.seu.letao.service.mall.impl;

import cn.edu.seu.letao.common.Constants;
import cn.edu.seu.letao.common.LetaoMallCategoryLevelEnum;
import cn.edu.seu.letao.controller.vo.LetaoMallIndexCategoryVO;
import cn.edu.seu.letao.controller.vo.SecondLevelCategoryVO;
import cn.edu.seu.letao.controller.vo.ThirdLevelCategoryVO;
import cn.edu.seu.letao.entity.PmCommCategory;
import cn.edu.seu.letao.mapper.PmCommCategoryMapper;
import cn.edu.seu.letao.service.mall.IPmCommCategory;
import cn.edu.seu.letao.util.BeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.groupingBy;

public class IPmCommCategoryImpl implements IPmCommCategory {

    @Autowired
    PmCommCategoryMapper pmCommCategoryMapper;


    @Override
    public List<LetaoMallIndexCategoryVO> getCategoriesForIndex() {
        List<LetaoMallIndexCategoryVO> LetaoMallIndexCategoryVOS = new ArrayList<>();
        //获取一级分类的固定数量的数据
        List<PmCommCategory> firstLevelCategories = pmCommCategoryMapper.selectByLevelAndParentIdsAndNumber(Collections.singletonList(0), LetaoMallCategoryLevelEnum.LEVEL_ONE.getLevel(), Constants.INDEX_CATEGORY_NUMBER);
        if (!CollectionUtils.isEmpty(firstLevelCategories)) {
            List<Integer> firstLevelCategoryIds = firstLevelCategories.stream().map(PmCommCategory::getCid).collect(Collectors.toList());
            //获取二级分类的数据
            List<PmCommCategory> secondLevelCategories = pmCommCategoryMapper.selectByLevelAndParentIdsAndNumber(firstLevelCategoryIds, LetaoMallCategoryLevelEnum.LEVEL_TWO.getLevel(), 0);
            if (!CollectionUtils.isEmpty(secondLevelCategories)) {
                List<Integer> secondLevelCategoryIds = secondLevelCategories.stream().map(PmCommCategory::getCid).collect(Collectors.toList());
                //获取三级分类的数据
                List<PmCommCategory> thirdLevelCategories = pmCommCategoryMapper.selectByLevelAndParentIdsAndNumber(secondLevelCategoryIds, LetaoMallCategoryLevelEnum.LEVEL_THREE.getLevel(), 0);
                if (!CollectionUtils.isEmpty(thirdLevelCategories)) {
                    //根据 parentId 将 thirdLevelCategories 分组
                    Map<Integer, List<PmCommCategory>> thirdLevelCategoryMap = thirdLevelCategories.stream().collect(groupingBy(PmCommCategory::getParentId));
                    List<SecondLevelCategoryVO> secondLevelCategoryVOS = new ArrayList<>();
                    //处理二级分类
                    for (PmCommCategory secondLevelCategory : secondLevelCategories) {
                        SecondLevelCategoryVO secondLevelCategoryVO = new SecondLevelCategoryVO();
                        BeanUtil.copyProperties(secondLevelCategory, secondLevelCategoryVO);
                        //如果该二级分类下有数据则放入 secondLevelCategoryVOS 对象中
                        if (thirdLevelCategoryMap.containsKey(secondLevelCategory.getCid())) {
                            //根据二级分类的id取出thirdLevelCategoryMap分组中的三级分类list
                            List<PmCommCategory> tempGoodsCategories = thirdLevelCategoryMap.get(secondLevelCategory.getCid());
                            secondLevelCategoryVO.setThirdLevelCategoryVOS((BeanUtil.copyList(tempGoodsCategories, ThirdLevelCategoryVO.class)));
                            secondLevelCategoryVOS.add(secondLevelCategoryVO);
                        }
                    }
                    //处理一级分类
                    if (!CollectionUtils.isEmpty(secondLevelCategoryVOS)) {
                        //根据 parentId 将 thirdLevelCategories 分组
                        Map<Integer, List<SecondLevelCategoryVO>> secondLevelCategoryVOMap = secondLevelCategoryVOS.stream().collect(groupingBy(SecondLevelCategoryVO::getParentId));
                        for (PmCommCategory firstCategory : firstLevelCategories) {
                            LetaoMallIndexCategoryVO newBeeLetaoMallIndexCategoryVO = new LetaoMallIndexCategoryVO();
                            BeanUtil.copyProperties(firstCategory, newBeeLetaoMallIndexCategoryVO);
                            //如果该一级分类下有数据则放入 newBeeMallIndexCategoryVOS 对象中
                            if (secondLevelCategoryVOMap.containsKey(firstCategory.getCid())) {
                                //根据一级分类的id取出secondLevelCategoryVOMap分组中的二级级分类list
                                List<SecondLevelCategoryVO> tempGoodsCategories = secondLevelCategoryVOMap.get(firstCategory.getCid());
                                newBeeLetaoMallIndexCategoryVO.setSecondLevelCategoryVOS(tempGoodsCategories);
                                LetaoMallIndexCategoryVOS.add(newBeeLetaoMallIndexCategoryVO);
                            }
                        }
                    }
                }
            }
            return LetaoMallIndexCategoryVOS;
        } else {
            return null;
        }
    }
}
