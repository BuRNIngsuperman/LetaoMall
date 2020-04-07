package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.common.CountConstant;
import cn.edu.seu.letao.controller.vo.ChartData;
import cn.edu.seu.letao.controller.vo.OrderChartData;
import cn.edu.seu.letao.service.admin.IAdminStatisticsService;
import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.crypto.Data;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminStatisticsController {

    @Autowired
    IAdminStatisticsService adminStatisticsService;

    @RequestMapping(value = "/statistics",method = {RequestMethod.GET})
    public String statisticsPage(Model model){
        model.addAttribute("path","admin_statistics");
        return "admin/admin_statistics";
    }

    @RequestMapping(value = "/statistics/order",method = {RequestMethod.GET})
    @ResponseBody
    public Result orderCount(@RequestParam int type,
                             @RequestParam(required = false) String startTime,
                             @RequestParam(required = false) String endTime,
                             @RequestParam(required = false) int year){
        ChartData chartData = new ChartData();
        Date startDate = null, endDate = null;
        if (type == CountConstant.CUSTOM_DATE){
            startDate = DateUtil.beginOfDay(DateUtil.parse(startTime));
            endDate = DateUtil.endOfDay(DateUtil.parse(endTime));
            long betweenDay = DateUtil.between(startDate, endDate, DateUnit.DAY);
            if(betweenDay > 31){
                return ResultGenerator.genFailResult("所选日期范围过长，最多不能超过31天");
            }
        }
        List<OrderChartData> list = adminStatisticsService.getOrderCountData(type, startDate, endDate, year);
        List<Object> xDatas = new ArrayList<>();
        List<Object> yDatas = new ArrayList<>();
        BigDecimal countAll = new BigDecimal("0");
        for(OrderChartData orderData : list){
            if(type==CountConstant.CUSTOM_YEAR){
                xDatas.add(DateUtil.format(orderData.getTime(),"yyyy-MM"));
            }else{
                xDatas.add(DateUtil.formatDate(orderData.getTime()));
            }
            yDatas.add(orderData.getMoney());
            countAll=countAll.add(orderData.getMoney());
        }
        chartData.setXDatas(xDatas);
        chartData.setYDatas(yDatas);
        chartData.setCountAll(countAll);

        return ResultGenerator.genSuccessResult(chartData);
    }


}
