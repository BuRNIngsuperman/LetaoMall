package cn.edu.seu.letao.service.admin.impl;

import cn.edu.seu.letao.common.CountConstant;
import cn.edu.seu.letao.controller.vo.OrderChartData;
import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.mapper.OmOrderMapper;
import cn.edu.seu.letao.service.admin.IAdminStatisticsService;
import cn.edu.seu.letao.util.TimeUtil;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author Jin Qiuyang
 * @date 2020/4/4
 */

@Service
public class AdminStatisticsServiceImpl implements IAdminStatisticsService {

    @Autowired
    OmOrderMapper omOrderMapper;

    @Override
    public List<OrderChartData> getOrderCountData(int type, Date startTime, Date endTime, int year) {
        List<OrderChartData> fullData = new ArrayList<>();

        if(type == CountConstant.THIS_WEEK){
            //本周
            List<OrderChartData> data = omOrderMapper.selectOrderChart(TimeUtil.getBeginDayOfWeek(),TimeUtil.getEndDayOfWeek());
            fullData = getFullData(data,TimeUtil.getBeginDayOfWeek(),TimeUtil.getEndDayOfWeek());
        }else if(type == CountConstant.THIS_MONTH){
            //本月
            List<OrderChartData> data = omOrderMapper.selectOrderChart(TimeUtil.getBeginDayOfMonth(),TimeUtil.getEndDayOfMonth());
            fullData = getFullData(data,TimeUtil.getBeginDayOfMonth(),TimeUtil.getEndDayOfMonth());
        }else if(type == CountConstant.LAST_MONTH){
            //上个月
            List<OrderChartData> data = omOrderMapper.selectOrderChart(TimeUtil.getBeginDayOfLastMonth(), TimeUtil.getEndDayOfLastMonth());
            fullData = getFullData(data,TimeUtil.getBeginDayOfLastMonth(),TimeUtil.getEndDayOfLastMonth());
        }else if(type == CountConstant.CUSTOM_DATE){
            //自定义
            List<OrderChartData> data = omOrderMapper.selectOrderChart(startTime, endTime);
            fullData = getFullData(data,startTime, endTime);
        }else if(type == CountConstant.CUSTOM_YEAR){
            List<OrderChartData> data = omOrderMapper.selectOrderChartByYear(year);
            fullData = getFullYearData(data,year);
        }
        return fullData;
    }

    /**
     * 无数据补0
     * @param startTime
     * @param endTime
     */
    public List<OrderChartData> getFullData(List<OrderChartData> data,Date startTime, Date endTime){

        List<OrderChartData> fullData = new ArrayList<>();
        //相差
        long betweenDay = DateUtil.between(startTime, endTime, DateUnit.DAY);
        //起始时间
        Date everyday = startTime;
        int count = -1;
        for(int i=0;i<=betweenDay;i++){
            boolean flag = true;
            for(OrderChartData chartData:data){
                if(DateUtils.isSameDay(chartData.getTime(),everyday)){
                    //有数据
                    flag = false;
                    count++;
                    break;
                }
            }
            if(!flag){
                fullData.add(data.get(count));
            }else{
                OrderChartData orderChartData = new OrderChartData();
                orderChartData.setTime(everyday);
                orderChartData.setMoney(new BigDecimal("0"));
                fullData.add(orderChartData);
            }

            //时间+1天
            Calendar cal = Calendar.getInstance();
            cal.setTime(everyday);
            cal.add(Calendar.DAY_OF_MONTH, 1);
            everyday = cal.getTime();
        }
        return fullData;
    }


    /**
     * 无数据补0
     * @param data
     * @param year
     * @return
     */
    public List<OrderChartData> getFullYearData(List<OrderChartData> data,int year){

        List<OrderChartData> fullData = new ArrayList<>();
        //起始月份
        Date everyMonth = TimeUtil.getBeginDayOfYear(year);
        for(int i=0;i<12;i++){
            boolean flag = true;
            BigDecimal money = new BigDecimal(0);
            for(OrderChartData chartData:data){
                if(DateUtil.month(chartData.getTime())==DateUtil.month(everyMonth)){
                    //有数据
                    flag = false;
                    money=money.add(chartData.getMoney());
                }
            }
            if (!flag){
                OrderChartData orderChartData = new OrderChartData();
                orderChartData.setTime(everyMonth);
                orderChartData.setMoney(money);
                fullData.add(orderChartData);
            }else {
                OrderChartData orderChartData = new OrderChartData();
                orderChartData.setTime(everyMonth);
                orderChartData.setMoney(new BigDecimal("0"));
                fullData.add(orderChartData);
            }

            //时间+1天
            Calendar cal = Calendar.getInstance();
            cal.setTime(everyMonth);
            cal.add(Calendar.MONTH, 1);
            everyMonth = cal.getTime();
        }
        return fullData;
    }
}
