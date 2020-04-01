package cn.edu.seu.letao.service.mall.impl;

import cn.edu.seu.letao.common.Constants;
import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.controller.vo.LetaoMallCartItemVO;
import cn.edu.seu.letao.entity.OmCart;
import cn.edu.seu.letao.entity.PmCommCategory;
import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.mapper.OmCartMapper;
import cn.edu.seu.letao.mapper.PmCommodityMapper;
import cn.edu.seu.letao.service.mall.IOmCartService;
import cn.edu.seu.letao.util.BeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * @author shkstart
 * @create 2020-03-31 9:19
 */
@Service
public class OmCartServiceImpl implements IOmCartService {
    @Autowired
    OmCartMapper omCartMapper;

    @Autowired
    PmCommodityMapper pmCommodityMapper;

    @Override
    public String saveCartItem(OmCart cart) {
        OmCart temp = omCartMapper.selectByUserIdAndCommId(cart.getUserId(), cart.getCommId());
        if (temp != null) {
            //已存在则修改该记录
            //todo count = tempCount + 1
            temp.setQuantity(temp.getQuantity()+1);
            return updateCartItem(temp);
        }
        PmCommodity comm = pmCommodityMapper.selectById(cart.getCommId());
        //商品为空
        if (comm == null) {
            return ServiceResultEnum.GOODS_NOT_EXIST.getResult();
        }
        int totalItem = omCartMapper.selectCountByUserId(cart.getUserId()) + 1;
        //超出单个商品的最大数量
        if (cart.getQuantity() > Constants.SHOPPING_CART_ITEM_LIMIT_NUMBER) {
            return ServiceResultEnum.SHOPPING_CART_ITEM_LIMIT_NUMBER_ERROR.getResult();
        }
        //超出最大数量
        if (totalItem > Constants.SHOPPING_CART_ITEM_TOTAL_NUMBER) {
            return ServiceResultEnum.SHOPPING_CART_ITEM_TOTAL_NUMBER_ERROR.getResult();
        }
        //保存记录
        if (omCartMapper.insertSelective(cart) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public String updateCartItem(OmCart cart) {
        OmCart cartItemUpdate = omCartMapper.selectByPrimaryKey(cart.getId());
        if (cartItemUpdate == null) {
            return ServiceResultEnum.DATA_NOT_EXIST.getResult();
        }
        //超出单个商品的最大数量
        if (cart.getQuantity() > Constants.SHOPPING_CART_ITEM_LIMIT_NUMBER) {
            return ServiceResultEnum.SHOPPING_CART_ITEM_LIMIT_NUMBER_ERROR.getResult();
        }
        //todo 数量相同不会进行修改
        //todo userId不同不能修改
        cartItemUpdate.setQuantity(cart.getQuantity());
        cartItemUpdate.setModifyDate(LocalDateTime.now());
        //修改记录
        if (omCartMapper.updateByPrimaryKeySelective(cartItemUpdate) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public List<LetaoMallCartItemVO> getMyShoppingCartItems(Long userId) {
        List<LetaoMallCartItemVO> letaoMallShoppingCartItemVOS = new ArrayList<>();
        List<OmCart> letaoMallShoppingCartItems = omCartMapper.selectByUserId(userId, Constants.SHOPPING_CART_ITEM_TOTAL_NUMBER);
        if (!CollectionUtils.isEmpty(letaoMallShoppingCartItems)) {
            //查询商品信息并做数据转换
            List<Integer> commIds = letaoMallShoppingCartItems.stream().map(OmCart::getCommId).collect(Collectors.toList());
            List<PmCommodity> letaoMallGoods = pmCommodityMapper.selectByPrimaryKeys(commIds);
            Map<Integer, PmCommodity> letaoMallCommMap = new HashMap<>();
            if (!CollectionUtils.isEmpty(letaoMallGoods)) {
                letaoMallCommMap = letaoMallGoods.stream().collect(Collectors.toMap(PmCommodity::getCommId, Function.identity(), (entity1, entity2) -> entity1));
            }
            for (OmCart cartItem : letaoMallShoppingCartItems) {
                LetaoMallCartItemVO cartItemVO = new LetaoMallCartItemVO();
                BeanUtil.copyProperties(cartItem, cartItemVO);
                if (letaoMallCommMap.containsKey(cartItem.getCommId())) {
                    PmCommodity commTemp = letaoMallCommMap.get(cartItem.getCommId());
                    cartItemVO.setAlbumPics(commTemp.getAlbumPics());
                    String goodsName = commTemp.getName();
                    // 字符串过长导致文字超出的问题
                    if (goodsName.length() > 28) {
                        goodsName = goodsName.substring(0, 28) + "...";
                    }
                    cartItemVO.setName(goodsName);
                    cartItemVO.setPrice(commTemp.getPrice());
                    letaoMallShoppingCartItemVOS.add(cartItemVO);
                }
            }
        }
        return letaoMallShoppingCartItemVOS;
    }

    @Override
    public String updateLetaoeMallCartItem(OmCart letaoMallCartItem) {
        OmCart cartItemUpdate = omCartMapper.selectByPrimaryKey(letaoMallCartItem.getId());
        if (cartItemUpdate == null) {
            return ServiceResultEnum.DATA_NOT_EXIST.getResult();
        }
        //超出单个商品的最大数量
        if (letaoMallCartItem.getQuantity() > Constants.SHOPPING_CART_ITEM_LIMIT_NUMBER) {
            return ServiceResultEnum.SHOPPING_CART_ITEM_LIMIT_NUMBER_ERROR.getResult();
        }
        //todo 数量相同不会进行修改
        //todo userId不同不能修改
        cartItemUpdate.setQuantity(letaoMallCartItem.getQuantity());
        cartItemUpdate.setModifyDate(LocalDateTime.now());
        //修改记录
        if (omCartMapper.updateByPrimaryKeySelective(cartItemUpdate) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public Boolean deleteById(Integer cartItemId) {
        return omCartMapper.deleteByPrimaryKey(cartItemId) > 0;
    }


}
