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

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%--引入通用头部--%>
    <div id = "head"></div>
    <%--引入通用左侧导航栏--%>
    <div id = "left"></div>

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div class="layui-row">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>会员充值</legend>
            </fieldset>
            <div class="layui-col-md4 layui-col-md-offset4">
                <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/user/recharge/do"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
                    <div class="layui-form-item">
                        <label class="layui-form-label">身份证号</label>
                        <div class="layui-input-block">
                            <input lay-verify="required|identity" type="text" name="idNumber" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                        <p style="color: red">${msg}</p>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">充值金额</label>
                        <div class="layui-input-block">
                            <input lay-verify="required|number" type="text" name="money" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <button lay-submit>充值</button>
                    </div>
                    <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
                </form>
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
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
<script>
    layui.use('form', function(){
        var form = layui.form;

        //各种基于事件的操作，下面会有进一步介绍
    });
</script>
</body>
</html>

