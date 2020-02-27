<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>个人资料</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/public.css" media="all" />
</head>
<body class="childrenBody">
<form class="layui-form layui-row" action="${pageContext.request.contextPath}/user/updateuser" method="post">
    <div class="layui-col-md3 layui-col-xs12 user_right">
        <div class="layui-upload-list">
            <img class="layui-upload-img layui-circle userFaceBtn userAvatar" src="${sessionScope.user.photo}" id="image">
        </div>
        <div class="layui-inline">
            <button type="button" class="layui-btn layui-btn-primary userFaceBtn" id="upload"><i class="layui-icon">&#xe67c;</i> 换一个头像</button>
        </div>
        <div class="layui-inline">
            <p id="message"></p>
        </div>
        <div class="layui-inline" style="display: none">
            <div class="layui-input-inline">
                <input type="text" name="photo" id="photo" value="${sessionScope.user.photo}" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-col-md6 layui-col-xs12">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" value="${user.username}" disabled class="layui-input layui-disabled">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户手机</label>
            <div class="layui-input-block">
                <input type="text" name="phone" value="${user.phone}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="changeUser">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/userInfo.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cacheUserInfo.js"></script>
</body>
</html>
