package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.entity.StockNumDTO;
import cn.edu.seu.letao.util.PageQueryUtil;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Hala
 * @since 2020-03-23
 */
public interface PmCommodityMapper extends BaseMapper<PmCommodity> {

    List<PmCommodity> selectForPage(PageQueryUtil pageUtil);

    boolean updateSellStatus(@Param("ids")Long[] ids, @Param("sellStatus") int sellStatus);

    List<PmCommodity> getCommodityForIndex(@Param("type")int type, @Param("number")int number);


    //lijia
    List<PmCommodity> selectByPrimaryKeys(@Param("list") List<Integer> commIds);

    //lijia
    int updateStockNum(@Param("stockNumDTOS") List<StockNumDTO> stockNumDTOS);

    List<PmCommodity> findLetaoMallGoodsListBySearch(PageQueryUtil pageUtil);

    int getTotalLetaoMallGoodsBySearch(PageQueryUtil pageUtil);
}
