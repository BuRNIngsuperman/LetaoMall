package cn.edu.seu.letao.service.admin.impl;

import cn.edu.seu.letao.common.ServiceResultEnum;
import cn.edu.seu.letao.entity.PmCommCategory;
import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.mapper.PmCommCategoryMapper;
import cn.edu.seu.letao.service.admin.IAdminCategoryService;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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

    /*添加商品分类信息*/
    @Override
    public String saveCategory(PmCommCategory category){

        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("level",category.getLevel());
        wrapper.eq("cname",category.getCname());
        PmCommCategory temp = categoryMapper.selectOne(wrapper);

        if (temp != null) {
            return ServiceResultEnum.SAME_CATEGORY_EXIST.getResult();
        }
        if (categoryMapper.insert(category) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    /*更新商品分类信息*/
    @Override
    public String updateCategory(PmCommCategory category){
        PmCommCategory temp = categoryMapper.selectById(category.getCid());
        if (temp == null) {
            return ServiceResultEnum.DATA_NOT_EXIST.getResult();
        }

        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("level",category.getLevel());
        wrapper.eq("cname",category.getCname());
        PmCommCategory temp2 = categoryMapper.selectOne(wrapper);
        if (temp2 != null && !temp2.getCid().equals(category.getCid())) {
            //同名且不同id 不能继续修改
            return ServiceResultEnum.SAME_CATEGORY_EXIST.getResult();
        }

        if (categoryMapper.updateById(category) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    /*删除商品分类信息*/
    public Boolean deleteCategoris(Integer[] ids){
        if (ids.length < 1) {
            return false;
        }

        PmCommCategory category = categoryMapper.selectById(ids[0]);

        if(category==null){
            return false;
        }

        int currLevel = category.getLevel();

        //当前删除的分类为第三级
        if(currLevel == 3){
            for(int i=0;i<ids.length;i++){
                if(ids[i]<1)
                    return false;
                categoryMapper.deleteById(ids[i]);
            }
            return true;
        }

        //当前删除的分类为第二级
        if(currLevel == 2){
            QueryWrapper wrapper;
            for(int i=0;i<ids.length;i++){
                if(ids[i]<1)
                    return false;
                categoryMapper.deleteById(ids[0]);
                wrapper = new QueryWrapper();
                wrapper.eq("parent_id",ids[i]);
                categoryMapper.delete(wrapper);
            }
            return true;
        }

        //当前删除的分类为第一级
        if(currLevel == 1){
            QueryWrapper wrapper = new QueryWrapper();
            for(int i=0;i<ids.length;i++){
                if(ids[i]<1)
                    return false;
                wrapper = new QueryWrapper();
                wrapper.eq("parent_id",ids[i]);
                List<PmCommCategory> list = categoryMapper.selectList(wrapper);
                categoryMapper.delete(wrapper);


                for(PmCommCategory commCategory:list){
                    wrapper = new QueryWrapper();
                    wrapper.eq("parent_id",commCategory.getCid());
                    categoryMapper.delete(wrapper);
                }
                categoryMapper.deleteById(ids[i]);
            }
            return true;
        }

        return false;
    }

}
