
<%--
  Created by IntelliJ IDEA.
  User: KelvinSu
  Date: 2020/3/28
  Time: 14:58
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
            <legend>机器状况检修</legend>
        </fieldset>
        <%--栅格--%>
        <div class="layui-row">
            <div class="layui-col-md-offset2 layui-col-md8">
                <%--表格--%>
                <table lay-filter="onlineUser">
                    <thead>
                    <tr>
                        <%--<th lay-data="{type: 'checkbox', fixed: 'left'}">选择</th>--%>
                        <th lay-data="{field: 'idid', width:80, sort: true}">机器编号</th>
                        <th lay-data="{field: 'id', width:80, sort: true}">区域</th>
                        <th lay-data="{field: 'identityNumber',width:160}">CPU</th>
                        <th lay-data="{field: 'name',width:160, sort: true}">GPU</th>
                        <th lay-data="{field: 'balance', width: 80}">RAM</th>
                        <th lay-data="{field: 'member',width: 80,sort: true}">是否在使用</th>
                        <th lay-data="{field: 'aa',width: 180,sort: true}">机器状况</th>
                            <th lay-data="{field: 'bb',width: 180,sort: true}">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="sectionName" value="initial"></c:set>
                    <c:forEach items="${computers}" var="computer">
                        <%--<c:if test="${sectionName != computer.section.name}">
                            <c:set var="sectionName" value="${computer.section.name}"></c:set>
                            <p>${sectionName}</p>
                        </c:if>--%>
                        <tr>
                            <td>${computer.id}</td>
                            <td>${computer.section.name}</td>
                            <td>${computer.cpu}</td>
                            <td>${computer.gpu}</td>
                            <td>${computer.ram}</td>

                            <td>
                                <c:if test="${computer.using == true}">是</c:if>
                                <c:if test="${computer.using == false}">否</c:if>
                            </td>

                            <td>
                                <c:if test="${computer.status == 1}">良好</c:if>
                                <c:if test="${computer.status == 2}">需检查</c:if>
                                <c:if test="${computer.status == 3}">需修理</c:if>
                            </td>

                            <td>
                                <c:if test="${computer.status == 1}">
                                    <a href="${pageContext.request.contextPath}/computer/updateStatus?id=${computer.id}&status=3"><button type="button" class="layui-btn">报损</button></a>
                                </c:if>
                                <c:if test="${computer.status == 2}">
                                    <a href="${pageContext.request.contextPath}/computer/updateStatus?id=${computer.id}&status=1"><button type="button" class="layui-btn">正常</button></a>
                                    <a href="${pageContext.request.contextPath}/computer/updateStatus?id=${computer.id}&status=3"><button type="button" class="layui-btn">报损</button></a>
                                </c:if>
                                <c:if test="${computer.status == 3}">
                                    <a href="${pageContext.request.contextPath}/computer/updateStatus?id=${computer.id}&status=1"><button type="button" class="layui-btn">修复</button></a>
                                </c:if>
                            </td>




                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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


<script>
    layui.use(['laydate','table'], function () {
        var table = layui.table;

        //转换静态表格
        table.init('onlineUser'
            , {
                height: 800 //设置高度
                , limit: 20 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
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

</body>
</html>


