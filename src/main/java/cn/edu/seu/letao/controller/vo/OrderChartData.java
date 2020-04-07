package cn.edu.seu.letao.controller.vo;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author Jin Qiuyang
 * @date 2020/4/4
 */
@Data
public class OrderChartData implements Serializable {
    Date time;

    BigDecimal money;
}
