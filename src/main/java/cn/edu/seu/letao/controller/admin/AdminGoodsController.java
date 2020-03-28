package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.common.Constants;
import cn.edu.seu.letao.common.LetaoMallCategoryLevelEnum;
import cn.edu.seu.letao.entity.PmCommCategory;
import cn.edu.seu.letao.service.admin.IAdminGoodsService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;
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


    /*
    * 进入添加商品页面，初始化数据
    * */
    @GetMapping("/goods/edit")
    public String edit(HttpServletRequest request) {
        request.setAttribute("path", "edit");
        //查询所有的一级分类
        List<PmCommCategory> firstLevelCategories = adminGoodsService.selectByLevelAndParentIdsAndNumber(Collections.singletonList(0), LetaoMallCategoryLevelEnum.LEVEL_ONE.getLevel());
        if (!CollectionUtils.isEmpty(firstLevelCategories)) {
            //查询一级分类列表中第一个实体的所有二级分类
            List<PmCommCategory> secondLevelCategories = adminGoodsService.selectByLevelAndParentIdsAndNumber(Collections.singletonList(firstLevelCategories.get(0).getCid()), LetaoMallCategoryLevelEnum.LEVEL_TWO.getLevel());
            if (!CollectionUtils.isEmpty(secondLevelCategories)) {
                //查询二级分类列表中第一个实体的所有三级分类
                List<PmCommCategory> thirdLevelCategories = adminGoodsService.selectByLevelAndParentIdsAndNumber(Collections.singletonList(secondLevelCategories.get(0).getCid()), LetaoMallCategoryLevelEnum.LEVEL_THREE.getLevel());
                request.setAttribute("firstLevelCategories", firstLevelCategories);
                request.setAttribute("secondLevelCategories", secondLevelCategories);
                request.setAttribute("thirdLevelCategories", thirdLevelCategories);

                request.setAttribute("path", "goods-edit");
                return "admin/admin_goods_edit";
            }
        }
        return "error/error_5xx";
    }

//    @GetMapping("/goods/edit/{goodsId}")
//    public String goodsEdit(){
//        return "admin/admin_goods_edit";
//    }
}
