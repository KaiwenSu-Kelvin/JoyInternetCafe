<%--
  Created by IntelliJ IDEA.
  User: KelvinSu
  Date: 2020/5/8
  Time: 18:42
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
<style>
    .layui-table-cell{
        height:auto !important;
    }
</style>

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
                <legend>修改商品信息</legend>
            </fieldset>
            <div class="layui-col-md4 layui-col-md-offset4">
                <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/product/modify"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
                    <div class="layui-form-item">
                        <label class="layui-form-label">商品名</label>
                        <div class="layui-input-block">
                            <select name="id" lay-verify="" lay-search>
                                <c:forEach items="${allProduct}" var="product">
                                    <option value="${product.id}">${product.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">价格</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="price" placeholder="">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">库存</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"name="stock" placeholder="">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <button lay-submit>修改</button>
                    </div>
                    <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
                </form>
            </div>
        </div>


        <div class="layui-row">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>添加商品（新）</legend>
            </fieldset>
            <div class="layui-col-md4 layui-col-md-offset4">
                <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/product/new"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
                    <div class="layui-upload">
                        <button type="button" class="layui-btn" id="test1">上传图片</button>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="demo1" width="200" height="200" src="${pageContext.request.contextPath}/image/上传.png">
                            <p id="demoText"></p>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">商品名</label>
                        <div class="layui-input-block">
                            <input lay-verify="required" type="text" class="layui-input"name="name" placeholder="">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">价格</label>
                        <div class="layui-input-block">
                            <input lay-verify="required|number" type="text" class="layui-input"name="price" placeholder="">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">库存</label>
                        <div class="layui-input-block">
                            <input lay-verify="required|number" type="text" class="layui-input"name="stock" placeholder="">
                        </div>
                    </div>

                    <input type="hidden" class="layui-input" name="picture" id="hpicture" placeholder="">

                    <div class="layui-form-item">
                        <button lay-submit>添加</button>
                    </div>
                    <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
                </form>
            </div>
        </div>

        <div class="layui-row">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>商品列表</legend>
            </fieldset>
            <div class="layui-col-md6 layui-col-md-offset3">
                <table lay-filter="onlineUser">
                    <thead>
                    <tr>
                        <%--<th lay-data="{type: 'checkbox', fixed: 'left'}">选择</th>--%>
                        <th lay-data="{field: 'a', width:220, sort: true}">名称</th>
                        <th lay-data="{field: 'b', width:220, sort: true}">图片</th>
                        <th lay-data="{field: 'c', width:200, sort: true}">价格</th>
                        <th lay-data="{field: 'd', width:200, sort: true}">库存</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${allProduct}" var="product">
                        <tr>
                                <%--<td></td>--%>
                            <td>${product.name}</td>
                            <td><img src="${pageContext.request.contextPath}/upload/product/${product.picture}" width="70" height="70"></td>
                            <td>${product.price}</td>
                            <td>${product.stock}</td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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

<script>
    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: 'http://localhost:8101/JoyInternetCafe/product/pic' //改成您自己的上传接口
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                alert(res.data +'-图片上传成功')
                $('#hpicture').attr('value',res.data); //图片链接（base64）
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        })})
</script>

<script type="text/javascript">
    <c:if test="${product != null}">
        $(document).ready(function(){
            alert("添加/修改后的商品-价格为：${product.price}，库存为：${product.stock}");
        })
    </c:if>
</script>
</body>
</html>

