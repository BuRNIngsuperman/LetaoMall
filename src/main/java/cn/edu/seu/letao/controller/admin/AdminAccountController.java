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

    @RequestMapping(value = "/accounts", method = {RequestMethod.GET, RequestMethod.POST})
    public String accountPage(Model model) {
        model.addAttribute("path", "admin_account");
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

    /**
     * 锁定用户
     */
    @RequestMapping(value = "/accounts/lock/{stopStatus}", method = {RequestMethod.POST})
    @ResponseBody
    public Result lockAccount(@RequestBody Integer[] ids, @PathVariable("stopStatus") String stopStatus) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("参数异常! ");
        }
        if (stopStatus.equals("yes") || stopStatus.equals("no")) {
            if (adminAccountService.lockAccounts(ids, stopStatus)) {
                return ResultGenerator.genSuccessResult();
            } else {
                return ResultGenerator.genFailResult("禁用失败");
            }
        } else {
            return ResultGenerator.genFailResult("操作非法");
        }
    }

    /**
     * 更改管理员权限
     */
    @RequestMapping(value = "/accounts/role/{role}", method = {RequestMethod.POST})
    @ResponseBody
    public Result changeRole(@RequestBody Integer[] ids, @PathVariable("role") String role) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("参数异常! ");
        }
        if (role.equals("admin") || role.equals("normal")) {
            if (adminAccountService.updateRoleType(ids,role)) {
                return ResultGenerator.genSuccessResult();
            } else {
                return ResultGenerator.genFailResult("禁用失败");
            }
        } else {
            return ResultGenerator.genFailResult("操作非法");
        }
    }

}
