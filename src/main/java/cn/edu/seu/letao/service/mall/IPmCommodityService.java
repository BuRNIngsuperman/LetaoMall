package cn.edu.seu.letao.service.mall;

import cn.edu.seu.letao.common.IndexTypeEnum;
import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.util.PageQueryUtil;
import cn.edu.seu.letao.util.PageResult;

import java.util.List;

public interface IPmCommodityService {



    List<PmCommodity> getCommodityForIndex(int type, int number);

    PmCommodity getDetail(Integer goodsId);

    PageResult searchLetaoMallGoods(PageQueryUtil pageUtil);


}
