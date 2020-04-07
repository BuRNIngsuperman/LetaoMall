package cn.edu.seu.letao.service.admin.impl;

import cn.edu.seu.letao.common.LetaoMallOrderStatusEnum;
import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.controller.vo.OrderItemVO;
import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.entity.OmOrderItem;
import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.mapper.OmOrderItemMapper;
import cn.edu.seu.letao.mapper.OmOrderMapper;
import cn.edu.seu.letao.mapper.PmCommodityMapper;
import cn.edu.seu.letao.service.admin.IAdminOrderService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import cn.hutool.db.sql.Order;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Service
public class AdminOrderServiceImpl implements IAdminOrderService {

    @Autowired
    OmOrderMapper orderMapper;

    @Autowired
    OmOrderItemMapper orderItemMapper;

    @Autowired
    PmCommodityMapper commodityMapper;

    @Override
    public PageResult getOrdersPage(PageQueryUtil pageUtil) {
        List<OmOrder> newBeeMallOrders = orderMapper.findOrderList(pageUtil);

        //关闭的订单不在操作，4表示订单状态已经关闭
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.in("status",new int[]{0,1});
        int total = orderMapper.selectCount(wrapper);
        PageResult pageResult = new PageResult(newBeeMallOrders, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

    @Override
    @Transactional
    public String updateOrderInfo(OmOrder order) {

        OmOrder temp = orderMapper.selectById(order.getOrderId());
        /*不为空且
            status=0待付款，允许修改价格和地址
            status=1待发货，已经付款，允许修改地址，不允许修改价格
            status>1不因该出现在列表里
        */

        if (temp != null && temp.getStatus() >= 0 && temp.getStatus() < 2) {

            if(temp.getStatus()==1 && temp.getTotalAmount().doubleValue()!= order.getTotalAmount().doubleValue())
                return ServiceResultEnum.NO_UPDATA.getResult();

            temp.setTotalAmount(order.getTotalAmount());
            temp.setAddress(order.getAddress());
            temp.setModifyTime(new Date());
            if (orderMapper.updateById(temp) > 0) {
                return ServiceResultEnum.SUCCESS.getResult();
            }
            return ServiceResultEnum.DB_ERROR.getResult();
        }
        return ServiceResultEnum.DATA_NOT_EXIST.getResult();
    }

    @Override
    @Transactional
    public String checkDone(Integer[] ids) {

        //查询所有的订单 判断状态 修改状态和更新时间
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.in("order_id",ids);
        List<OmOrder> orders = orderMapper.selectList(wrapper);
        String errorOrderSns = "";
        if (!CollectionUtils.isEmpty(orders)) {
            for (OmOrder omOrder : orders) {
                if (omOrder.getDeleteStatus() == 1) {
                    errorOrderSns += omOrder.getOrderSn() + " ";
                    continue;
                }
                if (omOrder.getStatus() != 1) {
                    errorOrderSns += omOrder.getOrderSn() + " ";
                }
            }
            if (StringUtils.isEmpty(errorOrderSns)) {
                //订单状态正常 可以执行配货完成操作 修改订单状态和更新时间

                if (orderMapper.checkDone(Arrays.asList(ids)) > 0) {
                    return ServiceResultEnum.SUCCESS.getResult();
                } else {
                    return ServiceResultEnum.DB_ERROR.getResult();
                }
            } else {
                //订单此时不可执行出库操作
                if (errorOrderSns.length() > 0 && errorOrderSns.length() < 100) {
                    return errorOrderSns + "订单的状态不是支付成功无法执行出库操作";
                } else {
                    return "你选择了太多状态不是支付成功的订单，无法执行配货完成操作";
                }
            }
        }
        //未查询到数据 返回错误提示
        return ServiceResultEnum.DATA_NOT_EXIST.getResult();
    }

    @Override
    @Transactional
    public String closeOrder(Integer[] ids) {
        //查询所有的订单 判断状态 修改状态和更新时间
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.in("order_id",ids);
        List<OmOrder> orders = orderMapper.selectList(wrapper);
        String errorOrderNos = "";
        if (!CollectionUtils.isEmpty(orders)) {
            for (OmOrder order : orders) {
                // 是否处于删除状态
                if (order.getDeleteStatus() == 1) {
                    errorOrderNos += order.getOrderSn() + " ";
                    continue;
                }
                //已关闭或者已完成无法关闭订单
                if (order.getStatus() == 3 || order.getStatus() < 0) {
                    errorOrderNos += order.getOrderSn() + " ";
                }
            }
            if (StringUtils.isEmpty(errorOrderNos)) {
                //订单状态正常 可以执行关闭操作 修改订单状态和更新时间
                if (orderMapper.closeOrder(Arrays.asList(ids))>0) {
                    return ServiceResultEnum.SUCCESS.getResult();
                } else {
                    return ServiceResultEnum.DB_ERROR.getResult();
                }
            } else {
                //订单此时不可执行关闭操作
                if (errorOrderNos.length() > 0 && errorOrderNos.length() < 100) {
                    return errorOrderNos + "订单不能执行关闭操作";
                } else {
                    return "你选择的订单不能执行关闭操作";
                }
            }
        }
        //未查询到数据 返回错误提示
        return ServiceResultEnum.DATA_NOT_EXIST.getResult();
    }

    @Override
    public List<OrderItemVO>  getOrderItems(int orderId){
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("order_id",orderId);
        List<OmOrderItem> itemList = orderItemMapper.selectList(queryWrapper);
        List<OrderItemVO> VOList = new ArrayList<OrderItemVO>();
        for(OmOrderItem item : itemList){
            OrderItemVO itemVO = new OrderItemVO();
            itemVO.setGoodsName(commodityMapper.selectById(item.getCommId()).getName());
            itemVO.setGoodsCount(item.getQuantity());
            itemVO.setGoodsSN(commodityMapper.selectById(item.getCommId()).getProductSn());
            VOList.add(itemVO);
        }

        return VOList;
    }


}
