<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>网站公告</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<div align="center">
    <div class="layui-carousel" id="test1">
        <div carousel-item>
    <%--                <div><a href="/government/index/newsDetail?nid=1"><img src="${pageContext.request.contextPath}/resources/images/indexbackground.jpg"></a></div>--%>
    <%--        <div><img src="${pageContext.request.contextPath}/resources/images/writeemailtop.jpg"></div>--%>
    <%--        <div><img src="${pageContext.request.contextPath}/resources/images/indexbackground.jpg"></div>--%>
    <%--        <div><img src="${pageContext.request.contextPath}/resources/images/writeemailtop.jpg"></div>--%>
    <%--        <div><img src="${pageContext.request.contextPath}/resources/images/indexbackground.jpg"></div>--%>
        </div>
    </div>
</div>

<table width="100%" height="200px" id="newsTable">
<%--    		<tr>--%>
<%--    			<td align="left" height="50px"><a href="/government/index/announcementDetail?aid="></a></td>--%>
<%--    			<td>abc</td>--%>
<%--    		</tr>--%>
</table>
</body>

<script>
    $(function () {
        getNews();
    });

    var ins;
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        ins=carousel.render({
            elem: '#test1'
            ,width: '80%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            ,anim: 'default' //切换动画方式
            ,autoplay:true   //是否自动切换
        });
    });

    function getNews() {
        $.ajax({
            url:'/government/index/news',
            type:'post',
            data:{},
            success:function(data){
                for(var i=0;i<5;i++){
                    var multiple_images = [];
                    var url=data.data[i].url;
                    if (url!='') {
                        multiple_images=stringToArray(url);
                        $("#test1").children().append("<div align='center'><a href=\"/government/index/newsDetail?nid="+data.data[i].nid+"\"><img src=\""+multiple_images[0]+"\"></a></div>");
                    }

                    var createtime=new Date(data.data[i].createtime).toLocaleDateString();
                    $("#newsTable").append("<tr>\n" +
                        "\t\t\t<td align=\"left\" height=\"30px\"><a href=\"/government/index/newsDetail?nid="+data.data[i].nid+"\">"+data.data[i].title+"</a></td>\n" +
                        "\t\t\t<td>"+createtime+"</td>\n" +
                        "\t\t</tr>");
                }
                //在往轮播容器中动态添加图片后要重置一下轮播，不然图片不显示
                ins.reload({elem: '#test1'});
            }
        });
    }

    function stringToArray(string) {
        return string.split(",");
    }

</script>
</html>
