package cn.edu.seu.letao.service.admin.impl;

import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.mapper.OmOrderMapper;
import cn.edu.seu.letao.service.admin.IAdminOrderService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class AdminOrderServiceImpl implements IAdminOrderService {

    @Autowired
    OmOrderMapper orderMapper;

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


}
