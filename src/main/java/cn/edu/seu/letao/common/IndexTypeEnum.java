package cn.edu.seu.letao.common;

/**
 *
 * @apiNote 推荐状态；0->不推荐；1->导航推荐；2->热门 3->新品 4->为你推荐
 */
public enum IndexTypeEnum {

    DEFAULT(0, "DEFAULT"),
    INDEX_BANNER(1, "INDEX_BANNER"),
    INDEX_GOODS_HOT(2, "INDEX_GOODS_HOTS"),
    INDEX_GOODS_NEW(3, "INDEX_GOODS_NEW"),
    INDEX_GOODS_RECOMMOND(4, "INDEX_GOODS_RECOMMOND");

    private int type;

    private String name;

    IndexTypeEnum(int type, String name) {
        this.type = type;
        this.name = name;
    }

    public static IndexTypeEnum getIndexConfigTypeEnumByType(int type) {
        for (IndexTypeEnum indexConfigTypeEnum : IndexTypeEnum.values()) {
            if (indexConfigTypeEnum.getType() == type) {
                return indexConfigTypeEnum;
            }
        }
        return DEFAULT;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
