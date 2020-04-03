package cn.edu.seu.letao.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin")
public class AdminStatisticsController {

    @RequestMapping(value = "/statistics",method = {RequestMethod.GET})
    public String statisticsPage(Model model){
        model.addAttribute("path","admin_statistics");
        return "admin/admin_statistics";
    }


}
