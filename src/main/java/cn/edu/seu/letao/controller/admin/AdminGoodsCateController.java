package cn.edu.seu.letao.controller.admin;

import cn.edu.seu.letao.common.LetaoMallCategoryLevelEnum;
import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.entity.PmCommCategory;
import cn.edu.seu.letao.service.admin.IAdminCategoryService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.Result;
import cn.edu.seu.letao.util.ResultGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;


@Controller
@RequestMapping("/admin")
public class AdminGoodsCateController {

    @Autowired
    IAdminCategoryService categoryService;

    @GetMapping("/categories")
    public String categoriesPage(HttpServletRequest request, @RequestParam("categoryLevel") Integer categoryLevel, @RequestParam("parentId") Integer parentId, @RequestParam("backParentId") Integer backParentId) {
        if (categoryLevel == null || categoryLevel < 1 || categoryLevel > 3) {
            return "error/error_5xx";
        }
        request.setAttribute("path", "admin_category");
        request.setAttribute("parentId", parentId);
        request.setAttribute("backParentId", backParentId);
        request.setAttribute("categoryLevel", categoryLevel);
        return "admin/admin_category";
    }

    /**
     * 列表
     */
    @RequestMapping(value = "/categories/list", method = RequestMethod.GET)
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit")) || StringUtils.isEmpty(params.get("categoryLevel")) || StringUtils.isEmpty(params.get("parentId"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(categoryService.getCategorisPage(pageUtil));
    }

    /**
     * 列表
     */
    @RequestMapping(value = "/categories/listForSelect", method = RequestMethod.GET)
    @ResponseBody
    public Result listForSelect(@RequestParam("categoryId") Integer categoryId) {
        if (categoryId == null || categoryId < 1) {
            return ResultGenerator.genFailResult("缺少参数！");
        }
        PmCommCategory category = categoryService.getCategoryById(categoryId);
        //既不是一级分类也不是二级分类则为不返回数据
        if (category == null || category.getLevel() == LetaoMallCategoryLevelEnum.LEVEL_THREE.getLevel()) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        Map categoryResult = new HashMap(2);
        if (category.getLevel() == LetaoMallCategoryLevelEnum.LEVEL_ONE.getLevel()) {
            //如果是一级分类则返回当前一级分类下的所有二级分类，以及二级分类列表中第一条数据下的所有三级分类列表
            //查询一级分类列表中被选中实体的所有二级分类
            List<PmCommCategory> secondLevelCategories = categoryService.selectByLevelAndParentIds(Collections.singletonList(categoryId), LetaoMallCategoryLevelEnum.LEVEL_TWO.getLevel());
            if (!CollectionUtils.isEmpty(secondLevelCategories)) {
                //查询二级分类列表中第一个实体的所有三级分类
                List<PmCommCategory> thirdLevelCategories = categoryService.selectByLevelAndParentIds(Collections.singletonList(secondLevelCategories.get(0).getCid()), LetaoMallCategoryLevelEnum.LEVEL_THREE.getLevel());
                categoryResult.put("secondLevelCategories", secondLevelCategories);
                categoryResult.put("thirdLevelCategories", thirdLevelCategories);
            }
        }
        if (category.getLevel() == LetaoMallCategoryLevelEnum.LEVEL_TWO.getLevel()) {
            //如果是二级分类则返回当前分类下的所有三级分类列表
            List<PmCommCategory> thirdLevelCategories = categoryService.selectByLevelAndParentIds(Collections.singletonList(categoryId), LetaoMallCategoryLevelEnum.LEVEL_THREE.getLevel());
            categoryResult.put("thirdLevelCategories", thirdLevelCategories);
        }
        return ResultGenerator.genSuccessResult(categoryResult);
    }

    /**
     * 添加
     */
    @RequestMapping(value = "/categories/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestBody PmCommCategory category) {
        if (Objects.isNull(category.getLevel())
                || StringUtils.isEmpty(category.getCname())
                || Objects.isNull(category.getParentId())
                || Objects.isNull(category.getSort())) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = categoryService.saveCategory(category);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult(result);
        }
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/categories/update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(@RequestBody PmCommCategory category) {
        if (Objects.isNull(category.getCid())
                || Objects.isNull(category.getLevel())
                || StringUtils.isEmpty(category.getCname())
                || Objects.isNull(category.getParentId())
                || Objects.isNull(category.getSort())) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = categoryService.updateCategory(category);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult(result);
        }
    }

    /**
     * 分类删除
     */
    @RequestMapping(value = "/categories/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(@RequestBody Integer[] ids) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        if (categoryService.deleteCategoris(ids)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("删除失败");
        }
    }

}
