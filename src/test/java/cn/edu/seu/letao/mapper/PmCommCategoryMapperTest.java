package cn.edu.seu.letao.mapper;

import cn.edu.seu.letao.entity.PmCommCategory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PmCommCategoryMapperTest {

    @Autowired
    private PmCommCategoryMapper pmCommCategoryMapper;

    @Test
    void selectByLevelAndParentIdsAndNumber() {
        List<Integer> list = new ArrayList<>();
        list.add(0);
        list.add(1);
        list.add(2);
        Integer level = 2;
        List<PmCommCategory> pmCommCategories = pmCommCategoryMapper.selectByLevelAndParentIdsAndNumber(list, level, 0);
        for (PmCommCategory pmCommCategory : pmCommCategories) {
            System.out.println(pmCommCategory);
        }
    }
}
