<%--
  Created by IntelliJ IDEA.
  User: KelvinSu
  Date: 2020/3/15
  Time: 18:19
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

<style>
    #MAIN,button{
        text-align: center; /*让div内部文字居中*/
        background-color: #fff;
        border-radius: 20px;
        width: 300px;
        height: 350px;
        margin:30% auto 50%;
        opacity: 0.93
    }
</style>
<body class="layui-layout-body" background="${pageContext.request.contextPath}/image/网咖.jpg">
<div class="layui-layout layui-layout-admin">
    <%--引入通用头部--%>
    <%--<div id = "head"></div>--%>

    <a href="${pageContext.request.contextPath}/overview/do">后端管理系统-点击进入</a>
    <%--<a href="user/all">all</a>--%>

    <div class="layui-row" >
        <div class="layui-col-md4 layui-col-md-offset4">
            <div class="layui-card" id="MAIN">
                <div>
                    <fieldset class="layui-elem-field layui-field-title">
                        <legend>登陆</legend>
                    </fieldset>
                </div>
                <div class="layui-card-body">
                    <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/admin/login"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
                        <div class="layui-form-item" >
                            <label class="layui-form-label">帐号</label>
                            <div class="layui-input-block" style="width: 150px;">
                                <input lay-verify="required" type="text" name="name" placeholder="请输入" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-inline" style="width: 150px;">
                                <input lay-verify="required" type="password" name="password" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">身份</label>
                            <div class="layui-input-block" style="width: 150px;">
                                <select name="ram" lay-verify="" lay-search>
                                    <option value="a" selected>超级管理员</option>
                                    <option value="b">管理员</option>
                                    <option value="c">前台</option>
                                </select>
                            </div>
                        </div>
                        <p style="color: red">${msg}</p>
                        <div>
                            <button type="submit" class="layui-btn layui-btn-fluid">登陆</button>
                        </div>
                        <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
                    </form>
                </div>
            </div>

        </div>
    </div>




</div>

<script>$("#head").load("${pageContext.request.contextPath}/head.jsp")</script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form;

        //各种基于事件的操作，下面会有进一步介绍
    });
</script>
</body>
</html>
