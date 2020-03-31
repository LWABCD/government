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
    <title>信箱详情</title>
    <link href="<%=path%>/resources/css/Common.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/resources/css/sitegeneric08.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<jsp:include flush="true" page="/WEB-INF/jsp/proscenium/inc/incTop.jsp"></jsp:include>

<div style="padding-left: 130px;padding-top: 100px">
    <div style="padding-left: 340px;padding-top:20px;height: 50px">
        <span style="font-size: large">${sessionScope.ed.title}</span>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">信件标题:</label>
            <div class="layui-input-inline">
                <input type="text" name="title" value="${sessionScope.ped.title}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">信件日期:</label>
            <div class="layui-input-inline">
                <input type="text" name="sendtime" value="${sessionScope.ped.sendtime}" lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">信件状态:</label>
            <div class="layui-input-inline">
                <input type="text" id="status" name="status" value="${sessionScope.ped.status==1?'已办结':'未办结'}" lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">信件内容:</label>
            <div class="layui-input-inline">
                <textarea name="content" disabled style="width: 850px;height: 300px">${sessionScope.ped.content}</textarea>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">信件回复:</label>
            <div class="layui-input-inline">
                <textarea id="replycontent" name="replycontent" <c:if test="${sessionScope.ped.status==1}">disabled</c:if> style="width: 850px;height: 300px">
                    ${sessionScope.per.replycontent}
                </textarea>
            </div>
        </div>
        <div class="layui-form-item" style="padding-left: 110px">
            <div class="layui-inline">
                <p id="message"></p>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">回复时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="replytime" value="${sessionScope.per.replytime}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline"> 
            <div class="layui-input-block" style="padding-left: 300px">
                <button class="layui-btn layui-btn-normal" align="center"><a href="${pageContext.request.contextPath}/pLeaderEmail/toLeaderEmail" style="color: white">返回</a></button>   
            </div>
        </div>
    </div>
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

        $("#save").click(function () {
            var replycontent=$("#replycontent").val();
            var leid=$("#leid").val();
            var message = $('#message');
            if (replycontent==''){
                message.html('<span style="color:red;">请输入内容！</span>');
            }else{
                message.html('');
                $.ajax({
                    url: '/government/leaderemail/reply',
                    method: 'post',
                    data:{
                        replycontent:replycontent,
                        leid:leid
                    },
                    dataType: 'JSON',
                    success: function (result) {
                        if (result.code == 1) {
                            layer.alert("回复成功");
                            $("#status").val('已办结');
                        } else {
                            layer.alert("回复失败");
                        }
                    },
                    error: function (data) {

                    }
                });
            }
        });

        $("#reset").click(function () {
            $("#replycontent").val('');
        });
    })

</script>
</html>
