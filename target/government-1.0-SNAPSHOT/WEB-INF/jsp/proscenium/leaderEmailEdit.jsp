<%--
  Created by IntelliJ IDEA.
  User: LWABCD
  Date: 2020/1/29
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>写信</title>
    <link href="<%=path%>/resources/css/Common.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/resources/css/sitegeneric08.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<%--<jsp:include flush="true" page="/WEB-INF/jsp/proscenium/inc/incTop.jsp"></jsp:include>--%>

<div style="padding-left: 30px">
    <img src="${pageContext.request.contextPath}/resources/images/writeemailtop.jpg">
</div>
<div style="padding-left: 130px;padding-top: 30px">
    <form class="layui-form " id="editform" action="#" lay-filter="dataFrom">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">您的姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" id="name" name="name" value=""  lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-inline">
                    <input type="text" id="id" name="id" value="" lay-verify="required|identity" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">电子邮件:</label>
                <div class="layui-input-inline">
                    <input type="text" id="email" name="email" value="" lay-verify="required|email" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">手机号:</label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" value="" lay-verify="required|phone" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">详细地址:</label>
                <div class="layui-input-inline">
                    <input type="text" id="address" name="address" value="" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">信件主题:</label>
                <div class="layui-input-inline">
                    <input type="text" id="title" name="title" value="" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">信件内容:</label>
                <div class="layui-input-inline">
                    <textarea id="content" name="content" style="width: 850px;height: 300px">${sessionScope.ed.content}</textarea>
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="padding-left: 110px">
            <div class="layui-inline">
                <p id="message"></p>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline"> 
                <div class="layui-input-block" style="padding-left: 300px">
                    <button lay-submit="" lay-filter="save" class="layui-btn layui-btn-normal" align="center">发送</button>
<%--                    <button id="reset" class="layui-btn layui-btn-normal" align="center">重置</button>   --%>
                </div>
            </div>
        </div>
    </form>
<%--    <div class="layui-inline">--%>
<%--        <div class="layui-input-block" style="padding-left: 300px">--%>
<%--            <button id="reset" class="layui-btn layui-btn-normal" align="center">重置</button>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>
</body>
</div>
</body>

<script>
    layui.use([ 'jquery', 'layer', 'form','laydate','element'], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        var element = layui.element;

        form.on('submit(save)', function(data){
            $.ajax({
                url:'/government/pLeaderEmail/saveLeaderEmail',
                method:'post',
                data:data.field,
                dataType:'JSON',
                success:function(result){
                    if (result.code==1){
                        layer.alert("发送成功");
                    }else{
                        layer.alert("发送失败");
                    }
                },
                error:function (data) {

                }
            }) ;
        });

        // $("#save").click(function () {
        //     var name=$('#name').val();
        //     var id=$('#id').val();
        //     var email=$('#email').val();
        //     var address=$('#address').val();
        //     var title=$('#title').val();
        //     var content=$('#content').val();
        //     var message = $('#message');
        //     if (name==''||id==''||email==''||address==''||title==''||content==''){
        //         message.html('<span style="color:red;">请填写完整！</span>');
        //     }
        //     else{
        //         message.html('');
        //         $.ajax({
        //             url: '/government/pLeaderEmail/saveLeaderEmail',
        //             method: 'post',
        //             data:{
        //
        //             },
        //             dataType: 'JSON',
        //             success: function (result) {
        //                 if (result.code == 1) {
        //                     layer.alert("发送成功");
        //                 } else {
        //                     layer.alert("发送失败");
        //                 }
        //             },
        //             error: function (data) {
        //
        //             }
        //         });
        //     }
        // });

        $("#reset").click(function () {
            $('#name').val('');
            $('#id').val('');
            $('#email').val('');
            $('#address').val('');
            $('#title').val('');
            $('#content').val('');
        });
    })

</script>
</html>
