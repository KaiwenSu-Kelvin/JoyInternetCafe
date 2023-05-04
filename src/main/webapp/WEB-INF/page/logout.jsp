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
            <legend>在线用户</legend>
        </fieldset>
        <%--栅格--%>
        <div class="layui-row">
            <div class="layui-col-md-offset2 layui-col-md8">
                <%--表格--%>
                <table lay-filter="onlineUser">
                    <thead>
                    <tr>
                        <%--<th lay-data="{type: 'checkbox', fixed: 'left'}">选择</th>--%>
                        <th lay-data="{field: 'id', width:80, sort: true}">ID</th>
                        <th lay-data="{field: 'identityNumber',width:240}">身份证号</th>
                        <th lay-data="{field: 'name',width:80, sort: true}">姓名</th>
                        <th lay-data="{field: 'balance', width: 80}">余额</th>
                        <th lay-data="{field: 'member',width: 80}">会员</th>
                        <th lay-data="{field: 'aa',width: 180}">上机时间</th>
                        <th lay-data="{field: 'bb',width: 120}">上机时长</th>
                        <th lay-data="{field: 'cc',width: 150}">区域/价格</th>
                        <th lay-data="{field: 'dd',width:80}">下机</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${onlineUsers}" var="onlineUser">
                        <tr>
                            <%--<td></td>--%>
                            <td>${onlineUser.id}</td>
                            <td>${onlineUser.identityNumber}</td>
                            <td>${onlineUser.name}</td>
                            <td>${onlineUser.balance}</td>
                            <c:if test="${onlineUser.member == true}">
                                <td>是</td>
                            </c:if>
                            <c:if test="${onlineUser.member == false}">
                                <td>否</td>
                            </c:if>
                            <%--<td>${onlineUser.member}</td>--%>
                            <td><fmt:formatDate type="both"
                                                dateStyle="medium" timeStyle="medium"
                                                value="${onlineUser.latestUserRecord.startDatetime}" /></td>
                            <td>${onlineUser.latestUserRecord.hours}</td>
                            <td>${onlineUser.latestUserRecord.section.name}-${onlineUser.latestUserRecord.section.price}/h</td>
                            <td><a href="${pageContext.request.contextPath}/user/logout?uid=${onlineUser.id}&pay=${onlineUser.latestUserRecord.hours * onlineUser.latestUserRecord.section.price}"><button type="button" class="layui-btn">下机</button></a></td>
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
                height: 500 //设置高度
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
<script type="text/javascript">
    <c:if test="${pay != null}">
    $(document).ready(function(){
        alert("该用户消费${pay}元");
    })
    </c:if>
</script>
</body>
</html>


