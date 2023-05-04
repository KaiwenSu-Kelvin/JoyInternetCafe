<%--
  Created by IntelliJ IDEA.
  User: KelvinSu
  Date: 2020/3/15
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
</head>
<body>
    <div class="layui-bg-red"> aaa </div>
    <c:forEach items="${allUser}" var="user">
        <p>${user.toString()}</p>
    </c:forEach>
    <div class="layui-row">
        <div class="layui-col-md4 layui-col-md-offset4">
            <form class="layui-form" action="${pageContext.request.contextPath}/user/register"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">身份证号</label>
                    <div class="layui-input-block">
                        <input lay-verify="identity" type="text" name="identityNumber" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="password" name="password" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">初始金额</label>
                    <div class="layui-input-block">
                        <input type="text" name="balance" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">注册日期</label>
                    <div class="layui-input-inline" style="width: 100px;">
                        <input type="text" name="" autocomplete="off" class="layui-input" id="registerDate">
                    </div>
                </div>

                <div class="layui-form-item">
                    <button lay-submit>提交</button>
                </div>
                <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
            </form>
        </div>
    </div>


</body>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#registerDate' //指定元素
        });
    });
</script>

<script>
    layui.use('form', function(){
        var form = layui.form;

        //各种基于事件的操作，下面会有进一步介绍
    });
</script>





</html>
