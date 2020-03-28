package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.common.Constants;
import cn.edu.seu.letao.service.admin.IAdminGoodsService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@Controller
@RequestMapping("/admin")
public class AdminGoodsController {


    @Autowired
    IAdminGoodsService adminGoodsService;

    /*
    * 跳转至商品管理页面
    * */
    @GetMapping("/goods")
    public String goodsShow(){
        return "admin/admin_goods";
    }

    /*
    * 获取商品分页列表数据
    * */
    @GetMapping("/goods/list")
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params){
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }

        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(adminGoodsService.getGoodsPage(pageUtil));
    }


    /**
     * 批量修改销售状态
     */
    @RequestMapping(value = "/goods/status/{sellStatus}", method = RequestMethod.PUT)
    @ResponseBody
    public Result delete(@RequestBody Long[] ids, @PathVariable("sellStatus") int sellStatus) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        if (sellStatus != Constants.SELL_STATUS_UP && sellStatus != Constants.SELL_STATUS_DOWN) {
            return ResultGenerator.genFailResult("状态异常！");
        }
        if (adminGoodsService.updateSellStatus(ids, sellStatus)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("修改失败");
        }
    }

    @GetMapping("/goods/edit")
    public String goodsEdit(){
        return "admin/admin_goods_edit";
    }
}
