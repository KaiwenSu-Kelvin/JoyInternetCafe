<%--
  Created by IntelliJ IDEA.
  User: KelvinSu
  Date: 2020/3/28
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <legend>添加机器</legend>
            </fieldset>
            <div class="layui-col-md4 layui-col-md-offset4">
                <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/computer/add"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
                    <div class="layui-form-item">
                        <label class="layui-form-label">CPU</label>
                        <div class="layui-input-block">
                            <select name="cpu" lay-verify="" lay-search>
                                <option value="i5-7400">i5-7400</option>
                                <option value="i9-9900k">i9-9900k</option>
                                <option value="i9-9900k" selected>i9-9900k</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">GPU</label>
                        <div class="layui-input-block">
                            <select name="gpu" lay-verify="" lay-search>
                                <option value="1080ti">1080ti</option>
                                <option value="1050ti">1050ti</option>
                                <option value="2080ti" selected>2080ti</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">内存</label>
                        <div class="layui-input-block">
                            <select name="ram" lay-verify="" lay-search>
                                <option value="8G">8G</option>
                                <option value="16G">16G</option>
                                <option value="8G * 2" selected>8G * 2</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">所属位置</label>
                        <div class="layui-input-block">
                            <select name="sectionId" lay-verify="" lay-search>
                                <c:forEach items="${sections}" var="section">
                                    <option value="${section.id}">${section.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <button lay-submit>提交</button>
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

