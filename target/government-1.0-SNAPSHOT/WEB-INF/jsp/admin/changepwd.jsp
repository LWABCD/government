<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>修改密码--layui后台管理模板 2.0</title>
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
<form class="layui-form" action="#" method="post">
    <div class="layui-col-xs12 layui-col-sm6 layui-col-md6">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" value="${sessionScope.user.username}" disabled class="layui-input layui-disabled">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">旧密码</label>
            <div class="layui-input-block">
                <input type="password" value="" id="oldpwd" name="oldpwd" placeholder="请输入旧密码" lay-verify="required|oldPwd" autocomplete="off" class="layui-input pwd">
                <p id="message"></p>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input type="password" value="" id="newpwd" name="newpwd" placeholder="请输入新密码" lay-verify="required|newPwd" class="layui-input pwd">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password" value="" name="confirmpwd" placeholder="请确认密码" lay-verify="required|confirmPwd" class="layui-input pwd">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="changePwd" lay-submit="" lay-filter="changePwd">立即修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user.js"></script>--%>
<script type="text/javascript">
    layui.use(['form','layer','laydate','table','laytpl','jquery'],function() {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery,
            laydate = layui.laydate,
            laytpl = layui.laytpl,
            table = layui.table;

        //添加验证规则
        form.verify({
            oldPwd: function (value, item) {
                $.ajax({
                    url: '/government/user/checkpwd',
                    method: 'post',
                    data: {password: value},
                    dataType: 'JSON',
                    success: function (result) {
                        if (result.code == 0) {
                            $("#message").html('<span style="color:red;">密码错误，请重新输入</span>');
                            $("#oldpwd").val("");
                        } else {
                            $("#message").html('');
                        }
                    }
                });
            },
            newPwd: function (value, item) {
                if (value.length < 6) {
                    return "密码长度不能小于6位";
                }
            },
            confirmPwd: function (value, item) {
                if (!new RegExp($("#newpwd").val()).test(value)) {
                    return "两次输入密码不一致，请重新输入！";
                }
            }
        });

        // form.on('submit(changePwd)', function(data){
        //     $.ajax({
        //         url:'/government/user/changepwd',
        //         method:'post',
        //         data:data.field,
        //         dataType:'JSON',
        //         success:function(result){
        //             if (result.code==1){
        //                 layer.alert("保存成功");
        //             }else{
        //                 layer.alert("保存失败");
        //             }
        //         },
        //         error:function (data) {
        //
        //         }
        //     }) ;
        // });

        $("#changePwd").click(function () {
            var newPwd=$("#newPwd").val();
            $.ajax({
                url:'/government/user/changepwd',
                method:'post',
                data:{newpwd:newPwd},
                dataType: 'JSON',
                success:function(result){
                    if (result.code==1){
                        layer.alert("保存成功");
                    }else{
                        layer.alert("保存失败");
                    }
                },
                error:function (data) {

                }
            }) ;
        })
    })
</script>
</body>
</html>
