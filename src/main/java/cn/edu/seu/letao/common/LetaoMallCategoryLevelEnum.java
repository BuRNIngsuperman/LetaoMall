package cn.edu.seu.letao.common;

/**
 * @apiNote 分类级别
 */
public enum LetaoMallCategoryLevelEnum {

    DEFAULT(0, "ERROR"),
    LEVEL_ONE(1, "一级分类"),
    LEVEL_TWO(2, "二级分类"),
    LEVEL_THREE(3, "三级分类");

    private int level;

    private String name;

    LetaoMallCategoryLevelEnum(int level, String name) {
        this.level = level;
        this.name = name;
    }

    public static LetaoMallCategoryLevelEnum getNewBeeMallOrderStatusEnumByLevel(int level) {
        for (LetaoMallCategoryLevelEnum letaoMallCategoryLevelEnum : LetaoMallCategoryLevelEnum.values()) {
            if (letaoMallCategoryLevelEnum.getLevel() == level) {
                return letaoMallCategoryLevelEnum;
            }
        }
        return DEFAULT;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
