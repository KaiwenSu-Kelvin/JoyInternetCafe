<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">主页</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/overview/do">数据总览</a></dd>
                </dl>
            </li>

            <li class="layui-nav-item">
                <a class="" href="javascript:;">会员管理模块</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/register/go">会员办理</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/user/recharge/go">会员充值</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/user/online">会员注销</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">电脑管理模块</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/computer/all">电脑故障报修</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/computer/addPage">电脑数量增加</a></dd>
                </dl>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">营收管理模块</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/revenue/show-page">分时段收入查询</a></dd>
                    <dd><a href="javascript:;">财务统计分析</a></dd>
                </dl>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">网咖商城模块</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/product/all">修改商品信息（价格/存货）</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>