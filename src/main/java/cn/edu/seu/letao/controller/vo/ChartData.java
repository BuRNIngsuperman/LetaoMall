package cn.edu.seu.letao.controller.vo;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author Jin Qiuyang
 * @date 2020/4/4
 */
@Data
public class ChartData {

    private List<Object> xDatas;

    private List<Object> yDatas;

    private Object countAll;
}
