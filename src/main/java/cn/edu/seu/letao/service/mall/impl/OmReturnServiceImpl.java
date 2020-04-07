package cn.edu.seu.letao.service.mall.impl;

import cn.edu.seu.letao.entity.OmReturn;
import cn.edu.seu.letao.mapper.OmReturnMapper;
import cn.edu.seu.letao.service.mall.IOmReturnService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author shkstart
 * @create 2020-04-07 14:49
 */
@Service
public class OmReturnServiceImpl extends ServiceImpl<OmReturnMapper,OmReturn> implements IOmReturnService {

    @Resource
    OmReturnMapper omReturnMapper;


    @Override
    public void saveReturn(OmReturn omReturn) {
        omReturnMapper.insert(omReturn);
    }
}
