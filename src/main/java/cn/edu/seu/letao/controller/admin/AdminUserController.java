package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.service.admin.IAdminUserService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;


@Controller
@RequestMapping("/admin")
public class AdminUserController {

    @Autowired
    IAdminUserService adminUserService;

    @RequestMapping(value = "/users",method = {RequestMethod.GET})
    public String UsersPage(Model model){
        model.addAttribute("path", "admin_user");
        return "admin/admin_user";
    }

    /**
     * 分页列表
     */
    @RequestMapping(value = "/users/list", method = RequestMethod.GET)
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(adminUserService.getMallUserPage(pageUtil));
    }

    /**
     * 账户禁用
     */
    @RequestMapping(value = "/users/lock/{lockStatus}", method = RequestMethod.POST)
    @ResponseBody
    public Result updateStatus(@RequestBody Integer[] ids,@PathVariable("lockStatus") int lockStatus){
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        if (lockStatus != 0 && lockStatus != 1) {
            return ResultGenerator.genFailResult("操作非法！");
        }

        if (adminUserService.lockUsers(ids,lockStatus)){
            return ResultGenerator.genSuccessResult();

        }else {
            return ResultGenerator.genFailResult("禁用失败");
        }
    }


}
