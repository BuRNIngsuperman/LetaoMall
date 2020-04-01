package cn.edu.seu.letao.service.mall.impl;

import cn.edu.seu.letao.entity.PmCommodity;
import cn.edu.seu.letao.mapper.PmCommodityMapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PmCommodityServiceImplTest {
    @Autowired
    PmCommodityMapper pmCommodityMapper;

    @Test
    void getCarouselsForIndex() {
        Map<String,Object> map = new HashMap<>();
        map.put("recommand_status",1);
        List<PmCommodity> pmCommodities = pmCommodityMapper.selectByMap(map);
        for (PmCommodity pmCommodity : pmCommodities) {
            System.out.println(pmCommodity);
        }
    }

    @Test
    void getCarouselsForIndex2() {
        Map<String,Object> map = new HashMap<>();
        map.put("recommand_status",1);
        QueryWrapper<PmCommodity> wrapper = new QueryWrapper<>();



    }
}
