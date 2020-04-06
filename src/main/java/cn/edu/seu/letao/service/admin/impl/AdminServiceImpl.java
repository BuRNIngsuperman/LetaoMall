package cn.edu.seu.letao.service.admin.impl;


import cn.edu.seu.letao.entity.OmOrder;
import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.entity.UsrAccount;
import cn.edu.seu.letao.entity.UsrUser;
import cn.edu.seu.letao.mapper.*;
import cn.edu.seu.letao.service.admin.IAdminService;
import cn.edu.seu.letao.util.MD5Util;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class AdminServiceImpl extends ServiceImpl<UsrAccountMapper,UsrAccount> implements IAdminService {

    @Autowired
    UsrAccountMapper usrAccountMapper;

    @Autowired
    OmOrderMapper orderMapper;

    @Autowired
    OmReturnMapper  returnMapper;

    @Autowired
    PmCommodityMapper commodityMapper;

    @Autowired
    UsrUserMapper usrUserMapper;

    @Override
    public void setData(Model model){

        //1.获取今日订单总数sum_orders
        //2.获取今日销售总额today_sum_sale
        //3.获取昨日销售总额yesterday_sum_sale
        //5.获取待付款订单status_0
        //6.获取待发货货订单status_1
        //7.获取待收货订单status_2
        //8.获取以完成订单status_3

        //17.本月订单总数month_orders;
        //18.同比上月month_compare;
        //19.本周订单总数week_orders;
        //20.同比上周week_compare;
        //21.本月销售总额month_sale;
        //22.同比上月month_sale_compare;
        //23.本周销售总额week_sale;
        //24.同比上周week_sale_compare;

        QueryWrapper orderListWrapper = new QueryWrapper<>().ne("status",0);
        List<OmOrder> orderlists=orderMapper.selectList(orderListWrapper);

        //处理日期
        final String todayStr;
        final String yesterdayStr;
        final String monthStr;
        final String lastMonthStr; //上月
        String[] weekStr = new String[7];    //记录本周所有的日期
        String[] lastWeekStr = new String[7];   //上周所有的日期

        Date todayDate= new Date();
        Calendar calendar = Calendar.getInstance();

        //将今天和昨天日期格式化："yyyy-mm-dd"
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        todayStr = dateFormat.format(todayDate); //今天

        //配置本周日期
        calendar.setTime(todayDate);    //重置日历数据
        int w = calendar.get(Calendar.DAY_OF_WEEK)-1; //今天是本周的第几天
        if(w==0){
            //日期类里面，星期日算第一天
            w=7;
        }
        weekStr[w-1] = todayStr;
        //配置本周，今天之前的几天日期
        for(int i=1;i<=w-1;i++){
            calendar.add(Calendar.DATE, -1);
            weekStr[w-i-1] = dateFormat.format(calendar.getTime());
        }
        //配置上周日期
        for(int i=1;i<=7;i++){
            calendar.add(Calendar.DATE, -1);
            lastWeekStr[7-i] = dateFormat.format(calendar.getTime());
        }
        //配置本周，今天之后的几天日期
        calendar.setTime(todayDate);    //重置日历数据
        for(int i=1;i<=7-w;i++){
            calendar.add(Calendar.DATE, 1);
            weekStr[w+i-1] = dateFormat.format(calendar.getTime());
        }

        calendar.setTime(todayDate);    //重置日历数据
        calendar.add(Calendar.DATE, -1);
        Date yesterdayDate = calendar.getTime();
        yesterdayStr = dateFormat.format(yesterdayDate);   //昨天

        monthStr =todayStr.substring(0,7); //本月

        //计算上月日期
        int month = Integer.parseInt(monthStr.substring(5,7));
        if(month==11||month==12){
            lastMonthStr = todayStr.substring(0,5)+(month-1);
        }else if(month==1){
            lastMonthStr=(Integer.parseInt(todayStr.substring(0,4))-1)+"-12";
        }else{
            lastMonthStr=todayStr.substring(0,5)+"0"+(month-1);
        }

        int sum_orders=0;
        double totay_sum_sale=0;
        int yesterday_sum_sale=0;

        int status_0 = 0;
        int status_1 = 0;
        int status_2 = 0;
        int status_3 = 0;

        int month_orders = 0,last_month_orders=0;
        int month_orders_compare = 0;
        int month_sale = 0,last_month_sale=0;
        int month_sale_compare = 0;

        int week_orders = 0,last_week_orders = 0;
        int week_orders_compare = 0;
        int week_sale = 0,last_week_sale = 0;
        int week_sale_compare = 0;

        double[] mondayToweekday = new double[7];//记录本周每天的销售额

        for(OmOrder omOrder:orderlists){
            //计算今天和昨天订单数与销售额
            String tempOrderDateStr = dateFormat.format(omOrder.getCreatedTime()).substring(0,10);
            if(tempOrderDateStr.equals(todayStr)){
                sum_orders++;
                totay_sum_sale += omOrder.getTotalAmount().doubleValue();

            }else if(tempOrderDateStr.equals(yesterdayStr)){
                yesterday_sum_sale += omOrder.getTotalAmount().doubleValue();
            }
            //计算这个订单是否是本周或上周的
            for(int j=0;j<7;j++){
                if(weekStr[j].equals(tempOrderDateStr)){
                    week_orders++;
                    week_sale += omOrder.getTotalAmount().doubleValue();
                    mondayToweekday[j] += omOrder.getTotalAmount().doubleValue();
                    break;
                }else if(lastWeekStr[j].equals(tempOrderDateStr)){
                    last_week_orders++;
                    last_week_sale += omOrder.getTotalAmount().doubleValue();
                    break;
                }
            }

            //分类订单状态
            if(omOrder.getStatus()==0){
                status_0++;
            }else if(omOrder.getStatus()==1){
                status_1++;
            }else if(omOrder.getStatus()==2){
                status_2++;
            }else if(omOrder.getStatus()==3){
                status_3++;
            }
            //计算本月与上月订单与销售额
            String tempMonthStr = dateFormat.format(omOrder.getCreatedTime()).substring(0,7);
            if(tempMonthStr.equals(monthStr)){
                month_orders++;
                month_sale += omOrder.getTotalAmount().doubleValue();
            }else if(tempMonthStr.equals(lastMonthStr)){
                last_month_orders++;
                last_month_sale += omOrder.getTotalAmount().doubleValue();
            }

        }

        //计算月周比值
        if(last_week_orders != 0){
            week_orders_compare = (int)((week_orders-last_week_orders)*1.0/last_week_orders*100);
            if(week_orders_compare>0){
                model.addAttribute("week_orders_compare","+"+week_orders_compare+"%");
            }else{
                model.addAttribute("week_orders_compare",week_orders_compare+"%");
            }
        }else{
            model.addAttribute("week_orders_compare","上周无数据");
        }
        if(last_week_sale != 0){
            week_sale_compare =(int)((week_sale-last_week_sale)*1.0/last_week_sale*100);
            if(week_sale_compare>0){
                model.addAttribute("week_sale_compare","+"+week_sale_compare+"%");
            }else{
                model.addAttribute("week_sale_compare",week_sale_compare+"%");
            }
        }else{
            model.addAttribute("week_sale_compare","上周无数据");
        }
        if(last_month_orders != 0){
            month_orders_compare = (int)((month_orders-last_month_orders)*1.0/last_month_orders*100);
            if(month_orders_compare>0){
                model.addAttribute("month_orders_compare","+"+month_orders_compare+"%");
            }else{
                model.addAttribute("month_orders_compare",month_orders_compare+"%");
            }
        }else{
            model.addAttribute("month_orders_compare","上月无数据");
        }
        if(last_month_sale != 0){
            month_sale_compare = (int)((month_sale-last_month_sale)*1.0/last_month_sale*100);
            if(month_sale_compare>0){
                model.addAttribute("month_sale_compare","+"+month_sale_compare+"%");
            }else{
                model.addAttribute("month_sale_compare",month_sale_compare+"%");
            }
        }else{
            model.addAttribute("month_sale_compare","上月无数据");
        }

        model.addAttribute("sum_orders",(""+sum_orders));
        model.addAttribute("today_sum_sale",("¥"+totay_sum_sale));
        model.addAttribute("yesterday_sum_sale",("¥"+yesterday_sum_sale));

        model.addAttribute("status_0",status_0);
        model.addAttribute("status_1",status_1);
        model.addAttribute("status_2",status_2);
        model.addAttribute("status_3",status_3);

        model.addAttribute("month_orders",month_orders);
        model.addAttribute("month_sale",month_sale);
        model.addAttribute("week_orders",week_orders);
        model.addAttribute("week_sale",week_sale);


        model.addAttribute("monday",mondayToweekday[0]);
        model.addAttribute("tuesday",mondayToweekday[1]);
        model.addAttribute("wednesday",mondayToweekday[2]);
        model.addAttribute("thursday",mondayToweekday[3]);
        model.addAttribute("friday",mondayToweekday[4]);
        model.addAttribute("saturday",mondayToweekday[5]);
        model.addAttribute("weekday",mondayToweekday[6]);

        //7.获取未处理退单returnOrder_status_0
        QueryWrapper wrapper_1 = new QueryWrapper();
        wrapper_1.eq("status",0);
        int returnOrder_status_0 = returnMapper.selectCount(wrapper_1);
        model.addAttribute("returnOrder_status_0",returnOrder_status_0);

        //8.获取缺货商品low_goods
        //9.已下架publish_status_0
        //10.已上架publish_status_1
        //11.库存紧张low_goods
        //12.全部商品all_goods
        int publish_status_0 = 0;
        int publish_status_1 = 0;
        int low_goods = 0;
        int all_goods = 0;

        List<PmCommodity> commodityList = commodityMapper.selectList(null);
        for(PmCommodity commodity:commodityList){

            if(commodity.getPublishStatus()==0){
                publish_status_0++;
            }else{
                publish_status_1++;
            }

            if(commodity.getStock()<commodity.getLowStock()){
                low_goods++;
            }
        }
        all_goods = commodityList.size();

        model.addAttribute("publish_status_0",publish_status_0);
        model.addAttribute("publish_status_1",publish_status_1);
        model.addAttribute("low_goods",low_goods);
        model.addAttribute("all_goods",all_goods);

        //13.今日新账户数量today_account
        //14.昨日新账户数量yesterday_account
        //15.本月新账户数量month_account
        //16.会员总数-缺少字段
        int today_account = 0;
        int yesterday_account =0 ;
        int month_account = 0;

        List<UsrUser> usrUserList = usrUserMapper.selectList(null);
        for(UsrUser usrUser:usrUserList){
            if(dateFormat.format(usrUser.getCreateTime()).substring(0,10).equals(todayStr)){
                today_account++;
                month_account++;
                continue;
            }
            if(dateFormat.format(usrUser.getCreateTime()).substring(0,10).equals(yesterdayStr)){
                yesterday_account++;
            }
            if(dateFormat.format(usrUser.getCreateTime()).substring(0,7).equals(monthStr)){
                month_account++;
            }
        }
        model.addAttribute("today_account",today_account);
        model.addAttribute("yesterday_account",yesterday_account);
        model.addAttribute("month_account",month_account);

    }



    @Override
    public UsrAccount checkAccount(String username, String password) {

        password = MD5Util.MD5Encode(password,"UTF-8");
        QueryWrapper<UsrAccount> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username).eq("password", password).eq("stop","yes");
        UsrAccount usrAccount = usrAccountMapper.selectOne(wrapper);
        return usrAccount;
    }

    @Override
    public boolean addAdminAccount(String username, String password) {
        QueryWrapper<UsrAccount> wrapper = new QueryWrapper<>();
        wrapper.eq("username",username);
        if(usrAccountMapper.selectOne(wrapper)!=null){
            return false;
        }

        UsrAccount usrAdmin = new UsrAccount();
        password = MD5Util.MD5Encode(password,"UTF-8");
        usrAdmin.setUsername(username);
        usrAdmin.setPassword(password);
        usrAdmin.setType("normal");
        usrAdmin.setStop("yes");
        usrAdmin.setCreateTime(new Date());
        usrAccountMapper.insert(usrAdmin);
        return true;
    }

    @Override
    public boolean updateName(int userId, String originalUsername, String newUsername) {
        UsrAccount usrAccount = usrAccountMapper.selectById(userId);
        //当前用户非空
        if (usrAccount != null){
            usrAccount.setUsername(newUsername);
            return usrAccountMapper.updateById(usrAccount) > 0;
        }
        return false;
    }

    @Override
    public boolean updatePassword(int userId, String originalPaw, String newPaw) {
        UsrAccount usrAccount = usrAccountMapper.selectById(userId);
        //当前用户非空
        if(usrAccount != null){
            String originalPawMd5 = MD5Util.MD5Encode(originalPaw,"UTF-8");
            String newPawMd5 = MD5Util.MD5Encode(newPaw,"UTF-8");

            //密码相等时才能更改
            if(originalPawMd5.equals(usrAccount.getPassword())){
                usrAccount.setPassword(newPawMd5);
                return usrAccountMapper.updateById(usrAccount) > 0;
            }
        }
        return false;
    }

}
