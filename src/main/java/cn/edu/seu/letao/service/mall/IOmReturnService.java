package cn.edu.seu.letao.service.mall;

import cn.edu.seu.letao.entity.OmReturn;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author shkstart
 * @create 2020-04-07 14:49
 */
public interface IOmReturnService extends IService<OmReturn>{

    void saveReturn(OmReturn omReturn);
}

