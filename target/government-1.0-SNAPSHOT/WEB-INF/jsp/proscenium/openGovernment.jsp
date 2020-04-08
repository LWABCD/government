<%--
  Created by IntelliJ IDEA.
  User: LWABCD
  Date: 2020/3/27
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>政务公开</title>
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
<body background="${pageContext.request.contextPath}/resources/images/indexbackground.jpg">
<jsp:include flush="true" page="/WEB-INF/jsp/proscenium/inc/incTop.jsp"></jsp:include>

<div align="center" class="Wrapper" style="padding-top: 150px;">
    <div id="MainCenter" align="center" class="MainCenter" style="width:1000px;">
        <div style="border-right:solid 1px deepskyblue;height: 490px;width: 180px;float: left;">
            <span style="color: darkblue;font-size: larger">信息公开</span>
            <table id="table">
<%--                <tr style="padding-top: 5px">--%>
<%--                    <td style="padding-left: 50px"><a href="#" onclick="getdata(1,1)">abc</a></td>--%>
<%--                </tr>--%>
<%--                <tr style="height: 10px">--%>
<%--                    <td style="padding-left: 50px">abc</td>--%>
<%--                </tr>--%>
<%--                <tr style="height: 10px">--%>
<%--                    <td style="padding-left: 50px">abc</td>--%>
<%--                </tr>--%>
            </table>
        </div>
<%--        <div style="width: 10px;height: 490px; background: darkgray;"></div>--%>
        <div style="height: 490px;width: 760px;float: right;">
            <!-- 数据表格开始 -->
            <table class="layui-table" lay-even lay-skin="nob" id="userTable" lay-filter="userTable"></table>
            <div id="page"></div>
            <!-- 数据表格结束 -->
        </div>
    </div>
</div>
</body>
<script>
    $(function(){
        getOpenGovType();
        getdata(1,1);
    });

    //用于保存当前页面显示的公开类型的id
    var ogtId=1;

    function getOpenGovType() {
        $.ajax({
            url:'/government/pOpenGovernment/openGovTypes',
            type:'post',
            data:{},
            success:function(data){
                for (var i = 0; i < data.data.length;i++)
                $("#table").append("<tr style=\"padding-top: 5px;\">\n" +
                    "                    <td style=\"padding-left: 50px\"><a href=\"#\" style='color: cornflowerblue;' onclick=\"getdata(1,"+data.data[i].ogtid+")\">"+data.data[i].name+"</a></td>\n" +
                    "                </tr>");
            }
        });

    }

    function openGovDetail(ogid) {
        window.location.href="/government/pOpenGovernment/openGovDetail?ogid="+ogid;
    }

    function getdata(pageNow,ogtid){
        //如果ogtid为空，说明点击了当前公开类型的其它页，这时ogtid是没有变的，所以直接把ogtId传给后台
        if (ogtid!=''&&ogtid!=null){
            ogtId=ogtid;
        }
        $.ajax({
            url:'/government/pOpenGovernment/openGovernments',
            data:{pageNow:pageNow,
                  ogtid:ogtId
                },
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
                            {field: 'title', title: '', align: 'center', width: '500',
                                templet:
                                    '<div><a href="/government/pOpenGovernment/openGovDetail/{{d.oid}}" class="layui-table-link" target="_blank">{{d.title}}</a></div>'}
                            , {field: 'createtime', title: '', align: 'center', width: '255',
                                templet: function (e) {
                                    if (e.createtime == null) {
                                        return '';
                                    } else {
                                        return layui.util.toDateString(e.createtime, "yyyy-MM-dd HH:mm:ss");
                                    }
                                }
                            }
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
                        ,limit:10
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
            if(layEvent === 'edit'){ //编辑
                window.location.href="/government/pOpenGovernment/openGovernmentDetail?ogid="+data.ogid;
            }
        });
    })

</script>
</html>
