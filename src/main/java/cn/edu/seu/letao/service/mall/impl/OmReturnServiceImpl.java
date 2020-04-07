package cn.edu.seu.letao.service.mall.impl;

import cn.edu.seu.letao.entity.OmReturn;
import cn.edu.seu.letao.mapper.OmReturnMapper;
import cn.edu.seu.letao.service.mall.IOmReturnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author shkstart
 * @create 2020-04-07 14:49
 */
@Service
public class OmReturnServiceImpl implements IOmReturnService {

    @Autowired
    OmReturnMapper omReturnMapper;

    @Override
    public void saveOmReturn(OmReturn omReturn) {
        omReturnMapper.insertSelective(omReturn);
    }
}
