package cn.edu.seu.letao.controller.vo;


import java.util.List;



import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.util.List;

public class SecondLevelCategoryVO {
    /*
    private Integer cid;

    private Integer parentId;

    private Integer level;

    private String cname;

    private Integer productCount;
>>>>>>> Stashed changes

    private List<ThirdLevelCategoryVO> thirdLevelCategoryVOS;

    public Integer getCategoryId() {
<<<<<<< Updated upstream
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Byte getCategoryLevel() {
        return categoryLevel;
    }

    public void setCategoryLevel(Byte categoryLevel) {
        this.categoryLevel = categoryLevel;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
=======
        return cid;
    }

    public void setCategoryId(Integer categoryId) {
        this.cid = categoryId;
    }

    public Integer productCount() {
        return productCount;
    }

    public void productCount(Integer productCount) {
        this.productCount = productCount;
    }

    public Integer getCategoryLevel() {
        return level;
    }

    public void setCategoryLevel(Integer categoryLevel) {
        this.level = categoryLevel;
    }

    public String getCategoryName() {
        return cname;
    }

    public void setCategoryName(String categoryName) {
        this.cname = categoryName;
>>>>>>> Stashed changes
    }

    public List<ThirdLevelCategoryVO> getThirdLevelCategoryVOS() {
        return thirdLevelCategoryVOS;
    }

    public void setThirdLevelCategoryVOS(List<ThirdLevelCategoryVO> thirdLevelCategoryVOS) {
        this.thirdLevelCategoryVOS = thirdLevelCategoryVOS;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
<<<<<<< Updated upstream
    }
=======
    }*/


    private static final long serialVersionUID = 1L;

    private List<ThirdLevelCategoryVO> thirdLevelCategoryVOS;

    /**
     * 商品分类id
     */
    private Integer cid;

    /**
     * 上级分类的编号：0表示一级分类
     */
    private Integer parentId;

    /**
     * 商品分类名称
     */
    private String cname;

    /**
     * 分类级别：0->1级；1->2级
     */
    private Integer level;

    /**
     * 商品数量
     */
    private Integer productCount;

    /**
     * 商品单位
     */
    private String productUnit;

    /**
     * 是否显示在导航栏：0->不显示；1->显示
     */
    private Integer navStatus;

    /**
     * 显示状态：0->不显示；1->显示
     */
    private Integer showStatus;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 图标
     */
    private String icon;

    /**
     * 关键字
     */
    private String keywords;

    /**
     * 描述
     */
    private String description;

    public List<ThirdLevelCategoryVO> getThirdLevelCategoryVOS() {
        return thirdLevelCategoryVOS;
    }

    public void setThirdLevelCategoryVOS(List<ThirdLevelCategoryVO> thirdLevelCategoryVOS) {
        this.thirdLevelCategoryVOS = thirdLevelCategoryVOS;
    }

    public Integer getCategoryId() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getCategoryName() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getProductCount() {
        return productCount;
    }

    public void setProductCount(Integer productCount) {
        this.productCount = productCount;
    }

    public String getProductUnit() {
        return productUnit;
    }

    public void setProductUnit(String productUnit) {
        this.productUnit = productUnit;
    }

    public Integer getNavStatus() {
        return navStatus;
    }

    public void setNavStatus(Integer navStatus) {
        this.navStatus = navStatus;
    }

    public Integer getShowStatus() {
        return showStatus;
    }

    public void setShowStatus(Integer showStatus) {
        this.showStatus = showStatus;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }



}
