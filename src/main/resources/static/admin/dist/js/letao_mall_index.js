
  var monday = parseInt($('#monday').val());
  var tuesday = parseInt($('#tuesday').val());
  var wednesday = parseInt($('#wednesday').val());
  var thursday = parseInt($('#thursday').val());
  var friday = parseInt($('#friday').val());
  var saturday = parseInt($('#saturday').val());
  var weekday = parseInt($('#weekday').val());

  var sale_data=[monday,tuesday,wednesday,thursday,friday,saturday,weekday];

  //首页图表
  var dom = document.getElementById("container");
  var myChart = echarts.init(dom);
  var app = {};
  option = null;
  option = {
      title: {
          text: '周销售概览'
      },
      tooltip: {
          trigger: 'axis',
          axisPointer: {
              type: 'cross',
              label: {
                  backgroundColor: '#6a7985'
              }
          }
      },
      legend: {
          data: ['销售额']
      },
      toolbox: {
          feature: {
              saveAsImage: {}
          }
      },
      grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
      },
      xAxis: [
          {
              type: 'category',
              boundaryGap: false,
              data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
          }
      ],
      yAxis: [
          {
              type: 'value'
          }
      ],
      series: [
          {
              name: '销售额',
              type: 'line',
              stack: '总量',
              label: {
                  normal: {
                      show: true,
                      position: 'top'
                  }
              },
              areaStyle: {},
              data: sale_data
          }
      ]
  };
  ;
  if (option && typeof option === "object") {
      myChart.setOption(option, true);
  }