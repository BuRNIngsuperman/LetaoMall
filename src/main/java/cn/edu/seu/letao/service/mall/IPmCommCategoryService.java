package cn.edu.seu.letao.service.mall;

import cn.edu.seu.letao.controller.vo.LetaoMallIndexCategoryVO;

import java.util.List;

public interface IPmCommCategoryService {
    List<LetaoMallIndexCategoryVO> getCategoriesForIndex();
}
