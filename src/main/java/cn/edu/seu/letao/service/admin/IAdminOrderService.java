package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.controller.vo.OrderItemVO;
import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.entity.OmOrderItem;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;

import java.util.List;

public interface IAdminOrderService {

    /**
     * 分页
     * @param pageUtil
     * @return
     */
    PageResult getOrdersPage(PageQueryUtil pageUtil);

    /**
     * 订单信息修改
     * @param order
     * @return
     */
    String updateOrderInfo(OmOrder order);

    /**
     * 配货
     *
     * @param ids
     * @return
     */
    String checkDone(Integer[] ids);

    /**
     * 关闭
     *
     * @param ids
     * @return
     */
    String closeOrder(Integer[] ids);

    List<OrderItemVO>  getOrderItems(int orderId);
}
