<%--
  Created by IntelliJ IDEA.
  User: LWABCD
  Date: 2020/1/30
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>政务编辑</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<div style="padding-left: 130px;padding-top:10px">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">政务标题:</label>
            <div class="layui-input-inline">
                <input type="text" id="title" name="title" value="${requestScope.opengov.title}"  lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">类型:</label>
            <div class="layui-input-block">
                <div class="layui-form">
                    <select name="ogtid" id="ogtid" lay-filter="ogtid">

                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">政务内容:</label>
            <div class="layui-input-inline">
                <textarea id="content" name="content" style="width: 850px;height: 300px">${requestScope.opengov.content}</textarea>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">来源:</label>
            <div class="layui-input-inline">
                <input type="text" id="origin" name="origin" value="${requestScope.opengov.origin}"  lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="display: none">
            <label class="layui-form-label">政务id:</label>
            <div class="layui-input-inline">
                <input type="text" id="oid" name="oid" value="${requestScope.opengov.oid}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="display: none">
            <label class="layui-form-label">创建时间:</label>
            <div class="layui-input-inline">
                <input type="text" id="createtime" name="createtime" value="${requestScope.opengov.createtime}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="display: none">
            <label class="layui-form-label">阅读数:</label>
            <div class="layui-input-inline">
                <input type="text" id="readnumber" name="readnumber" value="${requestScope.opengov.readnumber}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
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
                <c:if test="${requestScope.opengov==null}">
                    <button id="save" class="layui-btn layui-btn-normal" align="center">提交</button>
                </c:if>
                <c:if test="${requestScope.opengov!=null}">
                    <button id="save" class="layui-btn layui-btn-normal" align="center">修改</button>
                </c:if>
                <button id="reset" class="layui-btn layui-btn-normal" align="center">重置</button>
                <button class="layui-btn layui-btn-normal" align="center"><a href="${pageContext.request.contextPath}/opengovernment/toopengovernment" style="color: white">返回</a></button>   
            </div>
        </div>
    </div>
</div>
</body>

<script>
    layui.use([ 'jquery', 'layer', 'form','laydate','element'], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        var element = layui.element;

        $("#save").click(function () {
            var title=$("#title").val();
            var content=$("#content").val();
            var origin=$("#origin").val();
            var oid=$("#oid").val();
            var ogtid=$("#ogtid").val();
            var message = $('#message');
            var createtime=$("#createtime").val();
            var readnumber=$("#readnumber").val();
            if (title==''||content==''||origin==''){
                message.html('<span style="color:red;">请填写完整！</span>');
            }else{
                message.html('');
                $.ajax({
                    url: '/government/opengovernment/saveopengov',
                    method: 'post',
                    data:{
                        title:title,
                        content:content,
                        origin:origin,
                        oid:oid,
                        ogtid:ogtid,
                        createtime:createtime,
                        readnumber:readnumber
                    },
                    dataType: 'JSON',
                    success: function (result) {
                        if (result.code == 1) {
                            layer.alert("保存成功");
                            window.location.href="${pageContext.request.contextPath}/opengovernment/toopengovernment";
                        } else {
                            layer.alert("保存失败");
                        }
                    },
                    error: function (data) {

                    }
                });
            }
        });

        $("#reset").click(function () {
            $("#content").val('');
        });
    });

    $(document).ready(function () {
        $.ajax({
            url: '${pageContext.request.contextPath}/opengovernment/opengovtype',
            type: 'post',
            dataType: 'json',
            data: {}, // 要提交给服务端的数据
            success: function (data) { // 请求成功后如何处理结果?
                var len = data.data.length;
                var ogtid=$('#ogtid');
                for (var i = 0; i < len; i++) {
                    var opt = document.createElement('option');
                    opt.innerText = data.data[i].name;
                    opt.value = data.data[i].ogtid;
                    ogtid.append(opt);
                }

            }
        });
    });

</script>

</html>
