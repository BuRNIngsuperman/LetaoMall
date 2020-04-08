package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.controller.vo.OrderChartData;
import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.entity.OmReturn;
import cn.edu.seu.letao.util.PageQueryUtil;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Hala
 * @since 2020-03-23
 */
public interface OmOrderMapper extends BaseMapper<OmOrder> {


    int getMyOrderCount(PageQueryUtil pageUtil);

    List<OmOrder> findMyOrderList(PageQueryUtil pageUtil);

    //后台使用
    List<OmOrder> findOrderList(PageQueryUtil pageUtil);

    int closeOrder(@Param("ids") List<Integer> asList);

    int checkDone(@Param("ids") List<Integer> asList);

    int insertSelective(OmOrder letaoMallOrder);


    OmOrder selectByOrderSn(String orderSn);

    int updateByPrimaryKeySelective(OmOrder order);


    List<OrderChartData> selectOrderChart(@Param("startTime") Date startTime, @Param("endTime") Date endTime);

    List<OrderChartData> selectOrderChartByYear(@Param("year") int year);


}
