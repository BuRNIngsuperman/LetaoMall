package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.service.admin.IAdminGoodsService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;


@Controller
@RequestMapping("/admin")
public class AdminGoodsController {


    @Autowired
    IAdminGoodsService adminGoodsService;

    @GetMapping("/goods")
    public String goodsShow(){
        return "admin/admin_goods";
    }

    @GetMapping("/goods/list")
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params){
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(adminGoodsService.getGoodsPage(pageUtil));
    }

    @GetMapping("/goods/edit")
    public String goodsEdit(){
        return "admin/admin_goods_edit";
    }
}
