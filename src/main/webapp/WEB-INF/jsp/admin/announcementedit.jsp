<%--
  Created by IntelliJ IDEA.
  User: LWABCD
  Date: 2020/2/1
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>公告编辑</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<div style="padding-left: 130px;padding-top:10px">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">公告标题:</label>
            <div class="layui-input-inline">
                <input type="text" id="title" name="title" value="${requestScope.announcement.title}"  lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="display: none;">
        <div class="layui-inline">
            <label class="layui-form-label">公告内容地址:</label>
            <div class="layui-input-inline">
                <textarea id="contenturl" name="contenturl" style="width: 850px;height: 300px;">${requestScope.announcement.contenturl}</textarea>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">公告内容:</label>
            <div class="layui-input-inline">
                <textarea id="content" name="content" style="width: 850px;height: 300px">${requestScope.content}</textarea>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">来源:</label>
            <div class="layui-input-inline">
                <input type="text" id="origin" name="origin" value="${requestScope.announcement.origin}"  lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="display: none">
            <label class="layui-form-label">公告id:</label>
            <div class="layui-input-inline">
                <input type="text" id="aid" name="aid" value="${requestScope.announcement.aid}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="display: none">
            <label class="layui-form-label">创建时间:</label>
            <div class="layui-input-inline">
                <input type="text" id="createtime" name="createtime" value="${requestScope.announcement.createtime}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="display: none">
            <label class="layui-form-label">阅读数:</label>
            <div class="layui-input-inline">
                <input type="text" id="readnumber" name="readnumber" value="${requestScope.announcement.readnumber}"  lay-verify="required" disabled autocomplete="off"
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
                <c:if test="${requestScope.announcement==null}">
                    <button id="save" class="layui-btn layui-btn-normal" align="center">提交</button>
                </c:if>
                <c:if test="${requestScope.announcement!=null}">
                    <button id="save" class="layui-btn layui-btn-normal" align="center">修改</button>
                </c:if>
                <button id="reset" class="layui-btn layui-btn-normal" align="center">重置</button>
                <button class="layui-btn layui-btn-normal" align="center"><a href="${pageContext.request.contextPath}/announcement/toannouncement" style="color: white">返回</a></button>   
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
            var contenturl=$("#contenturl").val();
            var content=$("#content").val();
            var origin=$("#origin").val();
            var aid=$("#aid").val();
            var createtime=$("#createtime").val();
            var readnumber=$("#readnumber").val();
            var message = $('#message');
            if (title==''||content==''||origin==''){
                message.html('<span style="color:red;">请填写完整！</span>');
            }else{
                message.html('');
                $.ajax({
                    url: '/government/announcement/saveannouncement',
                    method: 'post',
                    data:{
                        title:title,
                        contenturl:contenturl,
                        content:content,
                        origin:origin,
                        aid:aid,
                        createtime:createtime,
                        readnumber:readnumber
                    },
                    dataType: 'JSON',
                    success: function (result) {
                        if (result.code == 1) {
                            layer.alert("保存成功");
                            window.location.href="${pageContext.request.contextPath}/announcement/toannouncement";
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

</script>
</html>
