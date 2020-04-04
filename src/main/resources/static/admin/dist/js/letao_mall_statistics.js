//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('container'),'light');
var xDatas=[],yDatas=[],startDate,endDate,year=0;

getChartData(0,null,null);
function getChartData(type) {
    var index = layer.load(3);
    $.ajax({
        type: 'GET',
        url: '/admin/statistics/order',
        dataType: 'json',
        data:{
            type: type,
            startTime: startDate,
            endTime: endDate,
            year: year
        },
        success: function(r){
            layer.close(index);
            if(r.resultCode != 200){
                layer.alert(data.message,{title: '错误信息',icon: 2});
                return;
            }
            console.log(data)
            xDatas = r.result.xDatas;
            yDatas = r.result.yDatas;
            $("#countAll").html(r.result.countAll);
            drawChart();
        },
        error:function(XMLHttpRequest){
            layer.close(index);
            layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
        }
    });
}

function getCustomData() {
    startDate = $('#startDate').val();
    if(startDate==""||startDate==null){
        $('#startDate').focus();
        return;
    }
    endDate = $('#endDate').val();
    if(endDate==""||endDate==null){
        $('#endDate').focus();
        return;
    }
    getChartData(-1);
}

function getYearData() {
    console.log(1)
    year = $('#year').val();
    if(year==""||year=="-1"||year==null){
        return;
    }
    getChartData(-2);
}


function drawChart() {
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '订单销量统计',
            subtext: 'XMall'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['销售金额']
        },
        toolbox: {
            show: true,
            feature: {
                dataZoom: {
                    yAxisIndex: 'none'
                },
                dataView: {readOnly: false},
                magicType: {type: ['line', 'bar']},
                restore: {},
                saveAsImage: {}
            }
        },
        xAxis: {
            boundaryGap: false,
            data: xDatas
        },
        yAxis: {
            type: 'value',
            axisLabel: {
                formatter: '{value} ￥'
            }
        },
        series: [{
            name: '销售金额',
            type: 'line',
            data: yDatas
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
}