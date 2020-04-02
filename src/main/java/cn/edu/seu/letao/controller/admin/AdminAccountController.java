package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.service.admin.impl.AdminAccountService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;


@Controller
@RequestMapping("/admin")
public class AdminAccountController {

    @Autowired
    AdminAccountService adminAccountService;

    @RequestMapping(value = "/accounts",method = {RequestMethod.GET,RequestMethod.POST})
    public String accountPage(Model model){
        model.addAttribute("path","admin_account");
        return "admin/admin_account";
    }

    /**
     * 分页列表
     */
    @RequestMapping(value = "/accounts/list", method = RequestMethod.GET)
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(adminAccountService.getAccountPage(pageUtil));
    }

}
