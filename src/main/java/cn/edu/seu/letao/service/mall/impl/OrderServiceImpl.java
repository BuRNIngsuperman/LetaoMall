package cn.edu.seu.letao.service.mall.impl;

import cn.edu.seu.letao.common.Constants;
import cn.edu.seu.letao.common.LetaoMallException;
import cn.edu.seu.letao.common.LetaoMallOrderStatusEnum;
import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.controller.vo.LetaoMallCartItemVO;
import cn.edu.seu.letao.controller.vo.LetaoMallOrderItemVO;
import cn.edu.seu.letao.controller.vo.LetaoMallOrderListVO;
import cn.edu.seu.letao.controller.vo.LetaoMallUserVO;
import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.entity.OmOrderItem;
import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.entity.StockNumDTO;
import cn.edu.seu.letao.mapper.OmCartMapper;
import cn.edu.seu.letao.mapper.OmOrderItemMapper;
import cn.edu.seu.letao.mapper.OmOrderMapper;
import cn.edu.seu.letao.mapper.PmCommodityMapper;
import cn.edu.seu.letao.service.mall.OrderService;
import cn.edu.seu.letao.util.BeanUtil;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import com.baomidou.mybatisplus.core.metadata.OrderItem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.groupingBy;

/**
 * @author shkstart
 * @create 2020-03-31 12:26
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    PmCommodityMapper pmCommodityMapper;

    @Resource
    OmOrderMapper omOrderMapper;

    @Resource
    OmOrderItemMapper omOrderItemMapper;

    @Resource
    OmCartMapper omCartMapper;

    //我的订单
    @Override
    public PageResult getMyOrders(PageQueryUtil pageUtil) {
        int total = omOrderMapper.getMyOrderCount(pageUtil);
        List<OmOrder> letaoMallOrders = omOrderMapper.findMyOrderList(pageUtil);
        List<LetaoMallOrderListVO> orderListVOS = new ArrayList<>();
        if (total > 0) {
            //数据转换 将实体类转成vo
            orderListVOS = BeanUtil.copyList(letaoMallOrders, LetaoMallOrderListVO.class);
            //设置订单状态中文显示值
            for (LetaoMallOrderListVO letaoMallOrderListVO : orderListVOS) {
                letaoMallOrderListVO.setOrderStatusString(LetaoMallOrderStatusEnum.getNewBeeMallOrderStatusEnumByStatus(letaoMallOrderListVO.getStatus()).getName());
            }
            List<Integer> orderIds = letaoMallOrders.stream().map(OmOrder::getOrderId).collect(Collectors.toList());
            if (!CollectionUtils.isEmpty(orderIds)) {
                List<OmOrderItem> orderItems = omOrderItemMapper.selectByOrderIds(orderIds);
                Map<Integer, List<OmOrderItem>> itemByOrderIdMap = orderItems.stream().collect(groupingBy(OmOrderItem::getOrderId));
                for (LetaoMallOrderListVO letaoMallOrderListVO : orderListVOS) {
                    //封装每个订单列表对象的订单项数据
                    if (itemByOrderIdMap.containsKey(letaoMallOrderListVO.getOrderId())) {
                        List<OmOrderItem> orderItemListTemp = itemByOrderIdMap.get(letaoMallOrderListVO.getOrderId());
                        //将NewBeeMallOrderItem对象列表转换成NewBeeMallOrderItemVO对象列表
                        List<LetaoMallOrderItemVO> letaoMallOrderItemVOS = BeanUtil.copyList(orderItemListTemp, LetaoMallOrderItemVO.class);
                        letaoMallOrderListVO.setLetaoMallOrderItemVOS(letaoMallOrderItemVOS);
                    }
                }
            }
        }
        PageResult pageResult = new PageResult(orderListVOS, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

    @Override
    public String saveOrder(LetaoMallUserVO user, List<LetaoMallCartItemVO> myShoppingCartItems) {
        return null;
    }

//    @Transactional
//    @Override
    /*public String saveOrder(LetaoMallUserVO user, List<LetaoMallCartItemVO> myShoppingCartItems) {
        List<Integer> itemIdList = myShoppingCartItems.stream().map(LetaoMallCartItemVO::getId).collect(Collectors.toList());
        List<Integer> goodsIds = myShoppingCartItems.stream().map(LetaoMallCartItemVO::getCommId).collect(Collectors.toList());
        List<PmCommodity> letaoMallGoods = pmCommodityMapper.selectByPrimaryKeys(goodsIds);
        //检查是否包含已下架商品
        List<PmCommodity> goodsListNotSelling = letaoMallGoods.stream()
                .filter(letaoMallGoodsTemp -> letaoMallGoodsTemp.getPublishStatus() != Constants.SELL_STATUS_UP)
                .collect(Collectors.toList());
        if (!CollectionUtils.isEmpty(goodsListNotSelling)) {
            //goodsListNotSelling 对象非空则表示有下架商品
            LetaoMallException.fail(goodsListNotSelling.get(0).getName() + "已下架，无法生成订单");
        }
        Map<Integer, PmCommodity> letaoMallGoodsMap = letaoMallGoods.stream().collect(Collectors.toMap(PmCommodity::getCommId, Function.identity(), (entity1, entity2) -> entity1));
        //判断商品库存
        for (LetaoMallCartItemVO shoppingCartItemVO : myShoppingCartItems) {
            //查出的商品中不存在购物车中的这条关联商品数据，直接返回错误提醒
            if (!letaoMallGoodsMap.containsKey(shoppingCartItemVO.getCommId())) {
                LetaoMallException.fail(ServiceResultEnum.SHOPPING_ITEM_ERROR.getResult());
            }
            //存在数量大于库存的情况，直接返回错误提醒
            if (shoppingCartItemVO.getQuantity() > letaoMallGoodsMap.get(shoppingCartItemVO.getCommId()).getStock()) {
                LetaoMallException.fail(ServiceResultEnum.SHOPPING_ITEM_COUNT_ERROR.getResult());
            }
        }
        //删除购物项
        if (!CollectionUtils.isEmpty(itemIdList) && !CollectionUtils.isEmpty(goodsIds) && !CollectionUtils.isEmpty(newBeeMallGoods)) {
            if (omCartMapper.deleteBatchIds(itemIdList) > 0) {
                List<StockNumDTO> stockNumDTOS = BeanUtil.copyList(myShoppingCartItems, StockNumDTO.class);
                int updateStockNumResult = pmCommodityMapper.updateStockNum(stockNumDTOS);
                if (updateStockNumResult < 1) {
                    LetaoMallException.fail(ServiceResultEnum.SHOPPING_ITEM_COUNT_ERROR.getResult());
                }
                //生成订单号
                String orderNo = NumberUtil.genOrderNo();
                int priceTotal = 0;
                //保存订单
                NewBeeMallOrder newBeeMallOrder = new NewBeeMallOrder();
                newBeeMallOrder.setOrderNo(orderNo);
                newBeeMallOrder.setUserId(user.getUserId());
                newBeeMallOrder.setUserAddress(user.getAddress());
                //总价
                for (NewBeeMallShoppingCartItemVO newBeeMallShoppingCartItemVO : myShoppingCartItems) {
                    priceTotal += newBeeMallShoppingCartItemVO.getGoodsCount() * newBeeMallShoppingCartItemVO.getSellingPrice();
                }
                if (priceTotal < 1) {
                    NewBeeMallException.fail(ServiceResultEnum.ORDER_PRICE_ERROR.getResult());
                }
                newBeeMallOrder.setTotalPrice(priceTotal);
                //todo 订单body字段，用来作为生成支付单描述信息，暂时未接入第三方支付接口，故该字段暂时设为空字符串
                String extraInfo = "";
                newBeeMallOrder.setExtraInfo(extraInfo);
                //生成订单项并保存订单项纪录
                if (newBeeMallOrderMapper.insertSelective(newBeeMallOrder) > 0) {
                    //生成所有的订单项快照，并保存至数据库
                    List<NewBeeMallOrderItem> newBeeMallOrderItems = new ArrayList<>();
                    for (NewBeeMallShoppingCartItemVO newBeeMallShoppingCartItemVO : myShoppingCartItems) {
                        NewBeeMallOrderItem newBeeMallOrderItem = new NewBeeMallOrderItem();
                        //使用BeanUtil工具类将newBeeMallShoppingCartItemVO中的属性复制到newBeeMallOrderItem对象中
                        BeanUtil.copyProperties(newBeeMallShoppingCartItemVO, newBeeMallOrderItem);
                        //NewBeeMallOrderMapper文件insert()方法中使用了useGeneratedKeys因此orderId可以获取到
                        newBeeMallOrderItem.setOrderId(newBeeMallOrder.getOrderId());
                        newBeeMallOrderItems.add(newBeeMallOrderItem);
                    }
                    //保存至数据库
                    if (newBeeMallOrderItemMapper.insertBatch(newBeeMallOrderItems) > 0) {
                        //所有操作成功后，将订单号返回，以供Controller方法跳转到订单详情
                        return orderNo;
                    }
                    NewBeeMallException.fail(ServiceResultEnum.ORDER_PRICE_ERROR.getResult());
                }
                NewBeeMallException.fail(ServiceResultEnum.DB_ERROR.getResult());
            }
            NewBeeMallException.fail(ServiceResultEnum.DB_ERROR.getResult());
        }
        NewBeeMallException.fail(ServiceResultEnum.SHOPPING_ITEM_ERROR.getResult());
        return ServiceResultEnum.SHOPPING_ITEM_ERROR.getResult();
    }*/
}
