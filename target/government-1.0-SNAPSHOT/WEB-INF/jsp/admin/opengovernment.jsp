<%--
  Created by IntelliJ IDEA.
  User: LWABCD
  Date: 2020/1/30
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>政务公开</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>

<form style="padding-top:10px">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">类型:</label>
            <div class="layui-input-block">
                <div class="layui-form">
                    <select name="ogtid" id="ogtid" lay-filter="ogtid">

                    </select>
                </div>
            </div>
        </div>
        <div class="layui-inline">
            <button type="button" class="layui-btn layui-btn-sm"><a href="${pageContext.request.contextPath}/opengovernment/toopengovedit" style="color: white">添加公开内容</a></button>
        </div>
    </div>
</form>

<!-- 数据表格开始 -->
<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
<div id="page"></div>
<div  id="userBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
            , url: '/government/opengovernment/opengovernments' //数据接口
            , title: ''//数据导出来的标题
            , toolbar: "#userToolBar"   //表格的工具条
            , height: '500'
            , width: '80%'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , cols: [[   //列表数据
                {field: 'title', title: '标题', align: 'center', width: '500'}
                , {field: 'updatetime', title: '时间', align: 'center', width: '500',templet : "<div>{{layui.util.toDateString(d.departureDate, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
                , {field: 'right', title: '操作', fixed: 'right', width: 177, align: 'center', toolbar: "#userBar"}
            ]]
        });

        form.on('select(ogtid)', function (obj) {
            search();
        });

        function search() {
            var ogtid=$("#ogtid").val();
            tableIns.reload({
                url:"/government/opengovernment/opengovernments",
                where:{
                    ogtid:ogtid
                }
            });
        }

        //监听行工具事件
        table.on('tool(userTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'detail'){
                window.location.href="${pageContext.request.contextPath}/opengovernment/opengovdetail?oid="+data.oid;
            }else if(layEvent === 'del'){ //删除
                layer.confirm('真的删除行么', function(index){
                    //向服务端发送删除指令
                    $.ajax({
                        url:'/government/opengovernment/deleteopengov',
                        type:'post',
                        data:{'oid':data.oid},//向服务端发送删除的id
                        success:function(json){
                            if(json.code==1){
                                layer.alert("删除成功");
                                <%--window.location.href="${pageContext.request.contextPath}/announcement/toannouncement";--%>
                                search();
                            }
                            else{
                                layer.alert("删除失败");
                            }
                        }
                    });

                });
            }
        })
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
</body>
</html>
