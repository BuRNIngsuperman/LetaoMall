package cn.edu.seu.letao.service.mall;

import cn.edu.seu.letao.controller.vo.LetaoMallCartItemVO;
import cn.edu.seu.letao.entity.OmCart;

import java.util.List;

/**
 * @author shkstart
 * @create 2020-03-31 9:19
 */
public interface IOmCartService {
    String saveCartItem(OmCart cart);

    String updateCartItem(OmCart cart);

    List<LetaoMallCartItemVO> getMyShoppingCartItems(Long userId);

    String updateLetaoeMallCartItem(OmCart letaoMallCartItem);

    Boolean deleteById(Integer cartItemId);
}
