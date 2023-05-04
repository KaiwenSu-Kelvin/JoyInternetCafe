<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: KelvinSu
  Date: 2020/3/28
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>极优新世纪网咖管理系统——JoyInternetCafeManageSystem(JCMS)</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/lib/js/jquery-3.4.1.min.js"></script>
</head>

<body class="layui-layout-body" style="background-color: #F2F2F2">
<div class="layui-layout layui-layout-admin">
    <%--引入通用头部--%>
    <div id = "head"></div>
    <%--引入通用左侧导航栏--%>
    <div id = "left"></div>

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div class="layui-row" style="">

            <div class="layui-col-md4" >
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                    <legend>在线用户</legend>
                </fieldset>
                <div class="layui-row">
                    <div class="layui-col-md3 layui-col-md-offset1">
                        <div class="layui-card">
                            <div class="layui-card-header" style="font-size:17px;text-align: center">当前会员人数</div>
                            <div class="layui-card-body">
                                <div style="font-size:30px;text-align:center">${count[1]}</div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-md3 layui-col-md-offset1">
                        <div class="layui-card">
                            <div class="layui-card-header" style="font-size:17px;text-align: center">当前游客人数</div>
                            <div class="layui-card-body">
                                <div style="font-size:30px;text-align:center">${count[0]}</div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-md3 layui-col-md-offset1">
                        <div class="layui-card">
                            <div class="layui-card-header" style="font-size:17px;text-align: center">当前空闲机器</div>
                            <div class="layui-card-body">
                                <div style="font-size:30px;text-align:center">${50-count[0]-count[1]}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                    <legend>机器状态</legend>
                </fieldset>
                <div class="layui-row">
                    <div class="layui-col-md3 layui-col-md-offset1">
                        <div class="layui-card">
                            <div class="layui-card-header" style="font-size:17px;text-align: center">良好</div>
                            <div class="layui-card-body">
                                <div style="font-size:30px;text-align:center">42</div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-md3 layui-col-md-offset1">
                        <div class="layui-card">
                            <div class="layui-card-header" style="font-size:17px;text-align: center">待检</div>
                            <div class="layui-card-body">
                                <div style="font-size:30px;text-align:center">5</div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-md3 layui-col-md-offset1">
                        <div class="layui-card">
                            <div class="layui-card-header" style="font-size:17px;text-align: center">损坏</div>
                            <div class="layui-card-body">
                                <div style="font-size:30px;text-align:center">3</div>
                            </div>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                    <legend>用户留言</legend>
                </fieldset>
                <div class="layui-row">
                    <div class="layui-col-md11 layui-col-md-offset1">
                        <div class="layui-card">
                            <div class="layui-card-header" style="font-size:17px;text-align: center">用户留言板</div>
                            <div class="layui-card-body">
                                <div style="font-size:30px;text-align:center">${count[1]}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                    <legend>当日一览</legend>
                </fieldset>
                <div class="layui-row">
                    <div class="layui-col-md11 layui-col-md-offset1">
                        <div class="layui-card">
                            <div class="layui-card-header" style="font-size:17px;text-align: center">总顾客数</div>
                            <div class="layui-card-body">
                                <div style="font-size:30px;text-align:center">299</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="layui-col-md8">
                <div class="layui-row">
                    <div class="layui-col-md-offset1 layui-col-md9">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                            <legend>近期数据</legend>
                        </fieldset>
                        <div id="main" style="width: 1200px;height:800px;">
                            <%--echarts图表1--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 极优新世纪网咖管理系统
    </div>
</div>


<script>$("#head").load("${pageContext.request.contextPath}/head.jsp")</script>
<script>$("#left").load("${pageContext.request.contextPath}/left.jsp")</script>

<script src="${pageContext.request.contextPath}/lib/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>


<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
    setTimeout(function () {

        option = {
            legend: {},
            tooltip: {
                trigger: 'axis',
                showContent: true
            },
            dataset: {
                source: [
                    ['product', '15：00', '16：00', '17：00', '18：00', '19：00', '现在'],
                    ['在线会员', ${countByHour[0]}, ${countByHour[1]},${countByHour[2]},${countByHour[3]},${countByHour[4]},${countByHour[5]}],
                    ['在线游客', 1,2,3,2,1,4],
                    ['空闲机器', 10,13,8,9,10,10]
                ]
            },
            xAxis: {type: 'category'},
            yAxis: {gridIndex: 0},
            grid: {top: '55%'},
            series: [
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {
                    type: 'pie',
                    id: 'pie',
                    radius: '30%',
                    center: ['50%', '25%'],
                    label: {
                        fontSize:'20',
                        formatter: '{b}: {@2012} ({d}%)'
                    },
                    encode: {
                        itemName: 'product',
                        value: '2012',
                        tooltip: '2012'
                    }
                }
            ]
        };

        myChart.on('updateAxisPointer', function (event) {
            var xAxisInfo = event.axesInfo[0];
            if (xAxisInfo) {
                var dimension = xAxisInfo.value + 1;
                myChart.setOption({
                    series: {
                        id: 'pie',
                        label: {
                            fontSize:'20',
                            formatter: '{b}: {@[' + dimension + ']} ({d}%)'
                        },
                        encode: {
                            value: dimension,
                            tooltip: dimension
                        }
                    }
                });
            }
        });

        myChart.setOption(option);

    });
</script>
<%--layui--%>
<script>
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
<script>
    layui.use('form', function(){
        var form = layui.form;
    });
</script>
</body>
</html>

