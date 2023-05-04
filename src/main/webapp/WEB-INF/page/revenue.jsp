<%--
  Created by IntelliJ IDEA.
  User: KelvinSu
  Date: 2020/5/3
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>极优新世纪网咖管理系统——JoyInternetCafeManageSystem(JCMS)</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/lib/js/jquery-3.4.1.min.js"></script>
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%--引入通用头部--%>
    <div id = "head"></div>
    <%--引入通用左侧导航栏--%>
    <div id = "left"></div>

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>${date}营收分析</legend>
        </fieldset>
        <%--栅格--%>
        <div class="layui-row">
            <div class="layui-col-md-offset2 layui-col-md8">
                <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/revenue/search"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
                    <div class="layui-form-item">
                        <label class="layui-form-label">日期</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" id="test1" name="date" placeholder="yyyy-MM-dd">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <button lay-submit>查询</button>
                    </div>

                    <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
                </form>
                <%--表格--%>
                <table lay-filter="onlineUser">
                    <thead>
                    <tr>
                        <%--<th lay-data="{type: 'checkbox', fixed: 'left'}">选择</th>--%>
                        <th lay-data="{field: 'a', width:110, sort: true}">会员编号</th>
                        <th lay-data="{field: 'b', width:275, sort: true}">上机时间</th>
                        <th lay-data="{field: 'c', width:275, sort: true}">下机时间</th>
                        <th lay-data="{field: 'd', width:240, sort: true}">上机时长</th>
                        <th lay-data="{field: 'e', width:240, sort: true}">上机区域</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${usages}" var="usage">
                        <tr>
                                <%--<td></td>--%>
                            <td>${usage.id}</td>
                            <td><fmt:formatDate type="both"
                                                dateStyle="medium" timeStyle="medium"
                                                value="${usage.startDatetime}" /></td>
                            <td><fmt:formatDate type="both"
                                                dateStyle="medium" timeStyle="medium"
                                                value="${usage.endDatetime}" /></td>
                            <td>${usage.hours}</td>
                            <td>${usage.section.name}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div id="main" style="width: 1200px;height:800px;">
                    <%--echarts图表1--%>
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
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/lib/echarts/echarts.min.js"></script>
<%--<script src="${pageContext.request.contextPath}/lib/echarts/ecStat.min.js"></script>--%>

<script>
    layui.use(['laydate','table'], function () {
        var table = layui.table;

        //转换静态表格
        table.init('onlineUser'
            , {
                height: 400 //设置高度
                , limit: 10 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
                //支持所有基础参数
            });
    });
</script>


<%--layui--%>
<script>
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
            ,value: '${date}'
            ,isInitValue: true
        });
    });
</script>

<script>
    var myChart = echarts.init(document.getElementById('main'));

    option = {
        title: {
            text: '${date}各时段用户数量',
            subtext:'<c:if test="${income != null}">${date}当日收入为${income}</c:if>',
            left: 'center'
        },
        xAxis: {
            name:'时间',
            type: 'category',
            data: ['01:00','02:00','03:00','04:00','05:00','06:00','07:00','08:00','09:00','10:00','11:00','12:00',
                    '13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00','23:00','24:00',]
        },
        yAxis: {
            name:'在线人数',
            type: 'value'
        },
        series: [{
            name:'在线人数',
            data: [<c:forEach items="${userInHour}" var="hours">${hours},</c:forEach>],
            type: 'line'
        }],
        tooltip: {
            trigger: 'axis'
        },
    };

    myChart.setOption(option);
</script>
</body>
</html>



