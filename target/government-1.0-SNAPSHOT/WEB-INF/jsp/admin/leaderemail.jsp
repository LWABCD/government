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
<body>

<form style="padding-top:10px">
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

        var exceldata;

        //渲染数据表格
        var tableIns = table.render({
            elem: '#userTable'   //渲染的目标对象
            , url: '/government/leaderemail/leaderemails' //数据接口
            , title: ''//数据导出来的标题
            , toolbar: "#userToolBar"   //表格的工具条
            , height: '500'
            , width: '80%'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , cols: [[   //列表数据
                {field: 'title', title: '标题', align: 'center', width: '500'}
                , {field: 'sendtime', title: '时间', align: 'center', width: '500',templet : "<div>{{layui.util.toDateString(d.departureDate, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
                , {field: 'right', title: '操作', fixed: 'right', width: 177, align: 'center', toolbar: "#userBar"}
            ]]
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
