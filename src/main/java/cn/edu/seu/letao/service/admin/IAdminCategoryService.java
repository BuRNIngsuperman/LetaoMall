package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.entity.PmCommCategory;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;

import java.util.List;

public interface IAdminCategoryService {

    /*
     * 分页查询分类
     * */
    public PageResult getCategorisPage(PageQueryUtil pageUtil);

    /*查询商品分类表级别信息*/
    public List<PmCommCategory> selectByLevelAndParentIds(List<Integer> parentIds, int categoryLevel);

    /*查询商品分类表级别信息*/
    public PmCommCategory getCategoryById(int id);

    /*添加商品分类信息*/
    public String saveCategory(PmCommCategory category);

    /*更新商品分类信息*/
    public String updateCategory(PmCommCategory goodsCategory);

    /*删除商品分类信息*/
    public Boolean deleteCategoris(Integer[] ids);

}
