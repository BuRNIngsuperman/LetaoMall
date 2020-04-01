package cn.edu.seu.letao.service.mall.impl;

import cn.edu.seu.letao.controller.vo.LetaoMallIndexCategoryVO;
import cn.edu.seu.letao.service.mall.IPmCommCategoryService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PmCommCategoryServiceImplTest {

    @Autowired
    IPmCommCategoryService pmCommCategoryService;

    @Test
    void getCategoriesForIndex() {
        List<LetaoMallIndexCategoryVO> categoriesForIndex = pmCommCategoryService.getCategoriesForIndex();
        for (LetaoMallIndexCategoryVO categoryVO : categoriesForIndex) {
            System.out.println("categoryvo==");
            System.out.println(categoryVO);
        }

    }
}
