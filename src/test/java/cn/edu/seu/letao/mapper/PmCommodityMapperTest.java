package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.PmCommodity;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PmCommodityMapperTest {

    @Autowired
    PmCommodityMapper pmCommodityMapper;

    @Test
    void getCommodityForIndex() {
        List<PmCommodity> commodityForIndex = pmCommodityMapper.getCommodityForIndex(1, 1);
        for (PmCommodity forIndex : commodityForIndex) {
            System.out.println(forIndex);
        }
    }
}
