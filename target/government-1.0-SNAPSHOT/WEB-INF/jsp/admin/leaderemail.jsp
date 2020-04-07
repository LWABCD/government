<%--
  Created by IntelliJ IDEA.
  User: LWABCD
  Date: 2020/1/29
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>领导信箱</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
</head>
<body style="padding: 10px">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">状态:</label>
            <div class="layui-input-block">
                <div class="layui-form">
                    <select name="status" id="status" lay-filter="status">
                        <option value="0">未办结</option>
                        <option value="1">已办结</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">开始时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="startTime" id="startTime" readonly="readonly"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="endTime" id="endTime" readonly="readonly"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
                <button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
            </div>
        </div>
    </div>
</form>

<!-- 数据表格开始 -->
<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
<div id="page"></div>
<div  id="userBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
</div>
<!-- 数据表格结束 -->

<script>
    layui.use([ 'jquery', 'layer', 'form', 'table','laydate','laypage','upload','element'], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;
        var laypage = layui.laypage;
        var upload = layui.upload;
        var element = layui.element;

        //渲染时间
        laydate.render({
            elem:'#startTime',
            type:'datetime'
        });
        laydate.render({
            elem:'#endTime',
            type:'datetime'
        });

        //渲染数据表格
        var tableIns = table.render({
            elem: '#userTable'   //渲染的目标对象
            , url: '/government/leaderemail/leaderemails' //数据接口
            , title: ''//数据导出来的标题
            , toolbar: "#userToolBar"   //表格的工具条
            , height: '500'
            , width: '80%'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , page: true
            , limits: [5,10,20]
            , cols: [[   //列表数据
                {field: 'title', title: '标题', align: 'center', width: '500'}
                , {field: 'sendtime', title: '时间', align: 'center', width: '500',
                    templet: function (e) {
                        if (e.sendtime == null) {
                            return '';
                        } else {
                            return layui.util.toDateString(e.sendtime, "yyyy-MM-dd HH:mm:ss");
                        }
                    }
                }
                , {field: 'right', title: '操作', fixed: 'right', width: 177, align: 'center', toolbar: "#userBar"}
            ]]
        });

        //模糊查询
        $("#doSearch").click(function(){
            var params=$("#searchFrm").serialize();
            tableIns.reload({
                url:"${ctx}/leaderemail/leaderemails?"+params,
                page:{curr:1}

            })
        });

        form.on('select(status)', function (obj) {
            search();
        });

        function search() {
            var status=$("#status").val();
            tableIns.reload({
                url:"/government/leaderemail/leaderemails",
                where:{
                    status:status
                }
            });
        }

        //监听行工具事件
        table.on('tool(userTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'detail'){
                $.ajax({
                    url:'/government/leaderemail/emaildetail',
                    type:'post',
                    data:{'leid':data.leid},
                    success:function(json){
                        if(json.code==1){
                            window.location.href="${pageContext.request.contextPath}/leaderemail/toemaildetail";
                        }
                        else{
                            layer.alert("查看失败");
                        }
                    }
                });
            }
        });
    })

</script>
</body>
</html>
