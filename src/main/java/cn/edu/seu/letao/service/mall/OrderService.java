package cn.edu.seu.letao.service.mall;

import cn.edu.seu.letao.controller.vo.LetaoMallCartItemVO;
import cn.edu.seu.letao.controller.vo.LetaoMallUserVO;
import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;

import java.util.List;

/**
 * @author shkstart
 * @create 2020-03-31 12:25
 */
public interface OrderService {
    PageResult getMyOrders(PageQueryUtil pageUtil);

    String saveOrder(LetaoMallUserVO user, List<LetaoMallCartItemVO> myShoppingCartItems);

    OmOrder getOrderByOrderNo(String OrderNo);

    String paySuccess(String orderNo);
}
