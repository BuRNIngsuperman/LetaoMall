package cn.edu.seu.letao.service.admin.impl;

import cn.edu.seu.letao.entity.PmCommCategory;
import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.mapper.PmCommCategoryMapper;
import cn.edu.seu.letao.service.admin.IAdminCategoryService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminCategoryServiceImpl implements IAdminCategoryService {

    @Autowired
    PmCommCategoryMapper categoryMapper;

    /*
     * 根据父级别id,自身等级查询，分类级别信息
     * */
    @Override
    public List<PmCommCategory> selectByLevelAndParentIds(List<Integer> parentIds, int categoryLevel){

        return categoryMapper.selectByLevelAndParentIds(parentIds, categoryLevel);
    }

    /*
     * 分页查询商品数量
     * */
    @Override
    public PageResult getCategorisPage(PageQueryUtil pageUtil) {
        List<PmCommCategory> categoryList = categoryMapper.selectForPage(pageUtil);


        QueryWrapper wrapper =new QueryWrapper();
        wrapper.eq("level",pageUtil.get("categoryLevel"));
        wrapper.eq("parent_id",pageUtil.get("parentId"));
        int total = categoryMapper.selectCount(wrapper);

        PageResult pageResult = new PageResult(categoryList, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

    /*查询商品分类表级别信息*/
    @Override
    public PmCommCategory getCategoryById(int id){
        return categoryMapper.selectById(id);
    }


}
