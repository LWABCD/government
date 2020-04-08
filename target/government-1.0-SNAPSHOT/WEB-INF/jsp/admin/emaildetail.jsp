<%--
  Created by IntelliJ IDEA.
  User: LWABCD
  Date: 2020/1/29
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>信箱详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<div style="padding-left: 130px">
    <div style="padding-left: 340px;padding-top:20px;height: 50px">
        <span style="font-size: large">${sessionScope.ed.title}</span>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">信件标题:</label>
            <div class="layui-input-inline">
                <input type="text" name="title" value="${sessionScope.ed.title}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">信件日期:</label>
            <div class="layui-input-inline">
                <input type="text" id="sendtime" name="sendtime" value="${sessionScope.ed.sendtime}" lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">信件状态:</label>
            <div class="layui-input-inline">
                <input type="text" id="status" name="status" value="${sessionScope.ed.status==1?'已办结':'未办结'}" lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">信件内容:</label>
            <div class="layui-input-inline">
                <textarea name="content" disabled style="width: 850px;height: 300px">${sessionScope.ed.content}</textarea>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">信件回复:</label>
            <div class="layui-input-inline">
                <textarea id="replycontent" name="replycontent" <c:if test="${sessionScope.ed.status==1}">disabled</c:if> style="width: 850px;height: 300px">
                ${sessionScope.er.replycontent}
                </textarea>
            </div>
        </div>
        <div class="layui-form-item" style="padding-left: 110px">
            <div class="layui-inline">
                <p id="message"></p>
            </div>
        </div>
        <c:if test="${sessionScope.ed.status==1}">
            <div class="layui-inline">
                <label class="layui-form-label">回复时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="replytime" value="${sessionScope.er.replytime}"  lay-verify="required" disabled autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </c:if>
        <div class="layui-inline" style="display: none">
            <label class="layui-form-label">信件id:</label>
            <div class="layui-input-inline">
                <input type="text" id="leid" name="leid" value="${sessionScope.ed.leid}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
            <div class="layui-inline"> 
                <c:if test="${sessionScope.ed.status==1}">
                    <div class="layui-input-block" style="padding-left: 300px">
                        <button class="layui-btn layui-btn-normal" align="center"><a href="${pageContext.request.contextPath}/leaderemail/toleaderemail" style="color: white">返回</a></button>   
                    </div>
                </c:if>
                <c:if test="${sessionScope.ed.status==0}">
                    <div class="layui-input-block" style="padding-left: 300px">
                        <button id="save" class="layui-btn layui-btn-normal" align="center">回复</button>
                        <button id="reset" class="layui-btn layui-btn-normal" align="center">重置</button>
                        <button class="layui-btn layui-btn-normal" align="center"><a href="${pageContext.request.contextPath}/leaderemail/toleaderemail" style="color: white">返回</a></button>   
                    </div>
                </c:if>
            </div>
        </div>
</div>
</body>
</div>
</body>

<script>

    //值小于10时，在前面补0
    function dateFilter(date){
        if(date < 10){return "0"+date;}
        return date;
    }
    function tranDate(timeObj){
        var dateObj = new Date(); //表示当前系统时间的Date对象
        dateObj.setDate(timeObj.val());
        var year = dateObj.getFullYear(); //当前系统时间的完整年份值
        var month = dateObj.getMonth()+1; //当前系统时间的月份值
        var date = dateObj.getDate(); //当前系统时间的月份中的日
        var hour = dateObj.getHours(); //当前系统时间的小时值
        var minute = dateObj.getMinutes(); //当前系统时间的分钟值
        var second = dateObj.getSeconds(); //当前系统时间的秒钟
        var tranDate=dateFilter(year)+"-"+dateFilter(month)+"-"+dateFilter(date)+" "+dateFilter(hour)+":"+dateFilter(minute)+":"+dateFilter(second);
        timeObj.val(tranDate);
    }

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
