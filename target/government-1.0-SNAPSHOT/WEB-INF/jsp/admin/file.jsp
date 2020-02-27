<%--
  Created by IntelliJ IDEA.
  User: LWABCD
  Date: 2020/1/28
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
</head>
<body>
<!-- 数据表格开始 -->
<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
<div id="page"></div>
<div style="display: none;" id="userToolBar">
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add">添加文件</button>
</div>
<div  id="userBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
    <form class="layui-form " id="editform" action="#" lay-filter="dataFrom" method="post">
        <div class="layui-form-item">
            <div class="layui-inline" style="display: none">
                <div class="layui-input-inline">
                    <input type="text" name="fid" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">文件名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="name"  lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">文件简介:</label>
                <div class="layui-input-inline">
                    <input type="text" name="description"  lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">文件地址:</label>
                <div class="layui-input-inline">
                    <input type="text" id="url" name="url"  lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <button type="button" class="layui-btn" id="upload">上传文件</button>
            </div>
            <div class="layui-inline">
                <p id="message"></p>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline"> 
                <div class="layui-input-block">
                    <button lay-submit="" lay-filter="save" class="layui-btn layui-btn-normal" align="center">提交</button>   
                </div>
            </div>
        </div>
    </form>

</div>
<!-- 添加和修改的弹出层结束 -->
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
            , url: '/government/file/files' //数据接口
            , title: ''//数据导出来的标题
            , toolbar: "#userToolBar"   //表格的工具条
            , height: '500'
            , width: '80%'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , cols: [[   //列表数据
                {field: 'name', title: '文件名', align: 'center', width: '330'}
                ,{field: 'description', title: '文件简介', align: 'center', width: '330'}
                , {field: 'createtime', title: '上传时间', align: 'center', width: '330',templet : "<div>{{layui.util.toDateString(d.departureDate, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
                , {field: 'right', title: '操作', fixed: 'right', width: 177, align: 'center', toolbar: "#userBar"}
            ]]
        });

        //监听头部工具栏事件
        table.on("toolbar(userTable)", function (obj) {
            switch (obj.event) {
                case 'add':
                    $("#editform")[0].reset();
                    openAddUser();
                    break;
            }
            ;
        })

        //打开添加页面
        function openAddUser() {
            layer.open({
                type: 1,
                title: '添加文件',
                content: $("#saveOrUpdateDiv"),
                area: ['700px'],
                btnAlign: 'c'
            });
        }

        form.on('submit(save)', function (data) {
            $.ajax({
                url: '/government/file/savefile',
                method: 'post',
                data: data.field,
                dataType: 'JSON',
                success: function (result) {
                    if (result.code == 1) {
                        layer.alert("保存成功");
                    } else {
                        layer.alert("保存失败");
                    }
                },
                error: function (data) {

                }
            });
        });

        //监听行工具事件
        table.on('tool(userTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除行么', function(index){
                    //向服务端发送删除指令
                    $.ajax({
                        url:'/government/file/deletefile',
                        type:'post',
                        data:{'fid':data.fid},//向服务端发送删除的id
                        success:function(json){
                            if(json.code==1){
                                layer.alert("删除成功");
                                window.location.href="${pageContext.request.contextPath}/file/tofile";
                            }
                            else{
                                layer.alert("删除失败");
                            }
                        }
                    });

                });
            }else if(layEvent === 'edit'){ //编辑
                openAddUser();
                //表单值
                form.val("dataFrom",{
                    "fid":data.fid,
                    "name":data.name,
                    "description":data.description,
                    "createtime":data.createtime,
                    "url":data.url
                });
            }
        });

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#upload'
            , url: '/government/file/upload'
            , accept: 'file'
            , acceptMime: 'xls|xlsx|csv|world|image|*'
            //, exts:'xls|xlsx|csv|world|image|*'
            , auto: true//是否选择文件之后自动上传
            , field: 'cmf' //表单的name值
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#url').val(result);
                });
            }
            , done: function (res) {
                layer.alert(res.data.url + ":" + res.code);
                //如果上传失败
                // if(res.code>0){
                //     layer.alert('上传失败');
                // }
                //上传成功
                $('#url').val(res.data.url);
                var message = $('#message');
                message.html('<span style="color: #8f8f8f;">上传成功!!!</span>');
            }
            , error: function () {
                //演示失败状态，并实现重传
                var message = $('#message');
                message.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                message.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    })

</script>
</body>
</html>
