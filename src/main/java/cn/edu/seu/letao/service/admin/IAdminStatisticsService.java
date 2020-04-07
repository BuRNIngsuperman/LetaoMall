package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.controller.vo.OrderChartData;

import java.util.Date;
import java.util.List;

/**
 * @author Jin Qiuyang
 * @date 2020/4/4
 */


public interface IAdminStatisticsService {

    /**
     * 统计订单销量
     * @param type
     * @param startTime
     * @param endTime
     * @param year
     * @return
     */
    List<OrderChartData> getOrderCountData(int type, Date startTime, Date endTime, int year);

}
