<%--
  Created by IntelliJ IDEA.
  User: LWABCD
  Date: 2020/1/27
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网站公告</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
</head>
<body>
<!-- 数据表格开始 -->
<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
<div id="page"></div>
<div style="display: none;" id="userToolBar">
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add">添加公告</button>
</div>
<div  id="userBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
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
            , url: '/government/announcement/announcements' //数据接口
            , title: ''//数据导出来的标题
            , toolbar: "#userToolBar"   //表格的工具条
            , height: '500'
            , width: '80%'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , cols: [[   //列表数据
                {field: 'title', title: '公告标题', align: 'center', width: '500'}
                , {field: 'createtime', title: '时间', align: 'center', width: '500',templet : "<div>{{layui.util.toDateString(d.departureDate, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
                , {field: 'right', title: '操作', fixed: 'right', width: 177, align: 'center', toolbar: "#userBar"}
            ]]
        });

        //监听头部工具栏事件
        table.on("toolbar(userTable)", function (obj) {
            switch (obj.event) {
                case 'add':
                    window.location.href="/government/announcement/toannouncementedit";
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(userTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除行么', function(index){
                    //向服务端发送删除指令
                    $.ajax({
                        url:'/government/announcement/deleteannouncement',
                        type:'post',
                        data:{aid:data.aid,
                              contenturl:data.contenturl
                            },//向服务端发送删除的id
                        success:function(json){
                            if(json.code==1){
                                layer.alert("删除成功");
                                window.location.href="${pageContext.request.contextPath}/announcement/toannouncement";
                            }
                            else{
                                layer.alert("删除失败");
                            }
                        }
                    });

                });
            }else if(layEvent === 'edit'){ //编辑
                window.location.href="/government/announcement/announcementdetail?aid="+data.aid;
            }
        });
    })

</script>
</body>
</html>
