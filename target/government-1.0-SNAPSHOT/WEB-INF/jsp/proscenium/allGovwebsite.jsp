<%--
  Created by IntelliJ IDEA.
  User: LWABCD
  Date: 2020/2/1
  Time: 23:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>所有政府部门网站</title>
    <link href="<%=path%>/resources/css/Common.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/resources/css/sitegeneric08.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>

    <style type="text/css">
        body,html{
            width: 100%;
            height: 100%;
            background-color: aquamarine;
            font-size: 0.9rem;
            background-image: url(${pageContext.request.contextPath}/resources/images/indexbackground.jpg);
            background-size: 100% 100%;
        }
    </style>

</head>
<body>
<jsp:include flush="true" page="/WEB-INF/jsp/proscenium/inc/incTop.jsp"></jsp:include>

<!--body-->
<div align="center" class="Wrapper">
    <div id="MainCenter" align="center" class="MainCenter">
        <div id="content" class="Sub" style="padding-left: 200px">
            <div class="NewContainer770">
                <div class="BoxHeader">
                    <div class="BoxHeader-center MarginTop10">所有政府部门网站<a href="javascript:;" onclick="self.location=document.referrer;"><<</a></div>
                </div>
                <div class="Slot">
                    <!-- 数据表格开始 -->
                    <table class="layui-hide" id="userTable" lay-filter="userTable"></table>
                    <div id="page"></div>
                    <div  id="userBar" style="display: none;">
                        <a class="layui-btn layui-btn-xs" lay-event="detail">访问</a>
                    </div>
                    <!-- 数据表格结束 -->
                </div>
            </div>
        </div>
    </div>
</div>

<!--foot -->
<div align="center" class="Wrapper">
    <div id="footer" align="center" class="Footer">
        <jsp:include flush="true" page="/WEB-INF/jsp/proscenium/inc/incFoot.jsp"></jsp:include>
    </div>
</div>
<!--foot -->
</body>

<script>
    $(function(){
        getdata(1);
    });
    function getdata(pageNow){
        $.ajax({
            url:'/government/index/govwebsites',
            data:{pageNow:pageNow},
            success:function(datas){
                layui.use('table', function(){
                    var table = layui.table;
                    //第一个实例
                    table.render({
                        elem: '#userTable'
                        ,height: 400
                        // ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                        //     layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        //     //,curr: 5 //设定初始在第 5 页
                        //     ,groups: 5 //只显示 1 个连续页码
                        //     ,first: false //不显示首页
                        //     ,last: false //不显示尾页
                        //     ,jump: function(obj){
                        //         console.info("==="+obj)
                        //     }
                        // } //开启分页
                        ,cols: [[ //表头
                            {field: 'name', title: '网站名称', align: 'center', width: '460'}
                            , {field: 'right', title: '操作', fixed: 'right', width: 177, align: 'center', toolbar: "#userBar"}
                        ]]
                        ,data:datas.data.list
                    });

                });

                layui.use(['laypage', 'layer'], function(){
                    var laypage = layui.laypage
                        ,layer = layui.layer;

                    //完整功能
                    laypage.render({
                        elem: 'page'
                        ,count: datas.data.total
                        ,layout: ['count', 'prev', 'page', 'next', 'skip']
                        ,limit:5
                        ,curr:pageNow
                        ,jump: function(obj,first){
                            if(!first && pageNow != obj.curr){
                                getdata(obj.curr);
                            }
                        }
                    });
                });
            }
        });
    }

    layui.use([ 'jquery', 'table'], function() {
        var $ = layui.jquery;
        var table = layui.table;

        //监听行工具事件
        table.on('tool(userTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'detail'){ //编辑
                window.location.href=data.url;
            }
        });
    })

</script>
</html>
