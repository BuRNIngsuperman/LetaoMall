package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/admin")
public class AdminStatisticsController {

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

        return ResultGenerator.genSuccessResult();
    }


}
