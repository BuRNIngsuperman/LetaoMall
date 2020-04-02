package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;

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
}
