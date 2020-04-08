package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.common.Constants;
import cn.edu.seu.letao.common.LetaoMallCategoryLevelEnum;
import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.entity.PmCommCategory;
import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.service.admin.IAdminCategoryService;
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
import java.util.Objects;


@Controller
@RequestMapping("/admin")
public class AdminGoodsController {


    @Autowired
    IAdminGoodsService adminGoodsService;

    @Autowired
    IAdminCategoryService categoryService;

    @GetMapping("/goods")
    public String goodsShow(HttpServletRequest request) {
        request.setAttribute("path", "admin_goods");
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
        List<PmCommCategory> firstLevelCategories = categoryService.selectByLevelAndParentIds(Collections.singletonList(0), LetaoMallCategoryLevelEnum.LEVEL_ONE.getLevel());
        if (!CollectionUtils.isEmpty(firstLevelCategories)) {
            //查询一级分类列表中第一个实体的所有二级分类
            List<PmCommCategory> secondLevelCategories = categoryService.selectByLevelAndParentIds(Collections.singletonList(firstLevelCategories.get(0).getCid()), LetaoMallCategoryLevelEnum.LEVEL_TWO.getLevel());
            if (!CollectionUtils.isEmpty(secondLevelCategories)) {
                //查询二级分类列表中第一个实体的所有三级分类
                List<PmCommCategory> thirdLevelCategories = categoryService.selectByLevelAndParentIds(Collections.singletonList(secondLevelCategories.get(0).getCid()), LetaoMallCategoryLevelEnum.LEVEL_THREE.getLevel());
                request.setAttribute("firstLevelCategories", firstLevelCategories);
                request.setAttribute("secondLevelCategories", secondLevelCategories);
                request.setAttribute("thirdLevelCategories", thirdLevelCategories);

                request.setAttribute("path", "goods-edit");
                return "admin/admin_goods_edit";
            }
        }
        //未完成的错误处理
        return "error/error_5xx";
    }

    @GetMapping("/goods/edit/{goodsId}")
    public String edit(HttpServletRequest request, @PathVariable("goodsId") Long goodsId) {

        request.setAttribute("path", "edit");
        PmCommodity commodity = adminGoodsService.getGoodsById(goodsId.intValue());


        if (commodity == null) {
            return "error/error_400";
        }

        //需要修改的商品的分类信相关息
        PmCommCategory commCategory = categoryService.getCategoryById(commodity.getCommodityCategoryId());

        //商品表中存储的分类id字段为三级分类的id，不为三级分类则是错误数据
        if (commCategory != null && commCategory.getLevel() == LetaoMallCategoryLevelEnum.LEVEL_THREE.getLevel()) {

            //查询所有的一级分类
            List<PmCommCategory> firstLevelCategories = categoryService.selectByLevelAndParentIds(Collections.singletonList(0), LetaoMallCategoryLevelEnum.LEVEL_ONE.getLevel());

            //根据parentId查询当前parentId下所有的三级分类
            List<PmCommCategory> thirdLevelCategories = categoryService.selectByLevelAndParentIds(Collections.singletonList(commCategory.getParentId()), LetaoMallCategoryLevelEnum.LEVEL_THREE.getLevel());

            //查询当前三级分类的父级二级分类
            PmCommCategory secondCategory = categoryService.getCategoryById(commCategory.getParentId());

            if (secondCategory != null) {
                //根据parentId查询当前parentId下所有的二级分类
                List<PmCommCategory> secondLevelCategories = categoryService.selectByLevelAndParentIds(Collections.singletonList(secondCategory.getParentId()), LetaoMallCategoryLevelEnum.LEVEL_TWO.getLevel());
                //查询当前二级分类的父级一级分类
                PmCommCategory firestCategory = categoryService.getCategoryById(secondCategory.getParentId());
                if (firestCategory != null) {
                    //所有分类数据都得到之后放到request对象中供前端读取
                    request.setAttribute("firstLevelCategories", firstLevelCategories);
                    request.setAttribute("secondLevelCategories", secondLevelCategories);
                    request.setAttribute("thirdLevelCategories", thirdLevelCategories);
                    request.setAttribute("firstLevelCategoryId", firestCategory.getCid());
                    request.setAttribute("secondLevelCategoryId", secondCategory.getCid());
                    request.setAttribute("thirdLevelCategoryId", commCategory.getCid());
                }
            }
        }
        request.setAttribute("goods", commodity);
        request.setAttribute("path", "goods-edit");
        return "admin/admin_goods_edit";
    }

    /**
     * 添加
     */
    @RequestMapping(value = "/goods/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestBody PmCommodity commodity) {
        if (StringUtils.isEmpty(commodity.getName())
                || Objects.isNull(commodity.getPrice())
                || Objects.isNull(commodity.getStock())
                || Objects.isNull(commodity.getUnit())
                || Objects.isNull(commodity.getProductSn())
                || Objects.isNull(commodity.getSaleAddress())
                || Objects.isNull(commodity.getMakeAddress())
                || Objects.isNull(commodity.getCommodityCategoryId())
                || Objects.isNull(commodity.getPublishStatus())
                || Objects.isNull(commodity.getNewStatus())
                || Objects.isNull(commodity.getRecommandStatus())
                || Objects.isNull(commodity.getDescription())
                || Objects.isNull(commodity.getSubTitle())
                || Objects.isNull(commodity.getOriginalPrice())
                || Objects.isNull(commodity.getLowStock())
                || Objects.isNull(commodity.getWeight())
                || Objects.isNull(commodity.getDetailTitle())
                || Objects.isNull(commodity.getDetailDesc())
                || Objects.isNull(commodity.getDetailHtml())
                || Objects.isNull(commodity.getNote())
                || Objects.isNull(commodity.getAlbumPics())) {
            return ResultGenerator.genFailResult("参数异常！");
        }

        String result = adminGoodsService.saveCommodity(commodity);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult(result);
        }
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/goods/update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(@RequestBody PmCommodity commodity) {
        if (StringUtils.isEmpty(commodity.getName())
                || Objects.isNull(commodity.getPrice())
                || Objects.isNull(commodity.getCommId())
                || Objects.isNull(commodity.getStock())
                || Objects.isNull(commodity.getUnit())
                || Objects.isNull(commodity.getProductSn())
                || Objects.isNull(commodity.getSaleAddress())
                || Objects.isNull(commodity.getMakeAddress())
                || Objects.isNull(commodity.getCommodityCategoryId())
                || Objects.isNull(commodity.getPublishStatus())
                || Objects.isNull(commodity.getNewStatus())
                || Objects.isNull(commodity.getRecommandStatus())
                || Objects.isNull(commodity.getDescription())
                || Objects.isNull(commodity.getSubTitle())
                || Objects.isNull(commodity.getOriginalPrice())
                || Objects.isNull(commodity.getLowStock())
                || Objects.isNull(commodity.getWeight())
                || Objects.isNull(commodity.getDetailTitle())
                || Objects.isNull(commodity.getDetailDesc())
                || Objects.isNull(commodity.getDetailHtml())
                || Objects.isNull(commodity.getNote())
                || Objects.isNull(commodity.getAlbumPics())) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = adminGoodsService.updateCommodity(commodity);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult(result);
        }
    }
}
