package cn.edu.seu.letao.service.admin;

import cn.edu.seu.letao.entity.PmCommCategory;

import java.util.List;

public interface IAdminCategoryService {


    /*查询商品分类表级别信息*/
    public List<PmCommCategory> selectByLevelAndParentIds(List<Integer> parentIds, int categoryLevel);

    /*查询商品分类表级别信息*/
    public PmCommCategory getCategoryById(int id);

}
