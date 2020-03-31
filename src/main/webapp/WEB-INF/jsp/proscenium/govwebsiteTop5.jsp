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

    <title>政府网站</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<table width="100%" id="govwebsiteTable">
<%--    <tr>--%>
<%--        <td align="center"><a href="http://www.baidu.com" target="_blank">百度</a></td>--%>
<%--    </tr>--%>
</table>
</body>

<script>
    $(function () {
        getGovwebsites();
    });

    function getGovwebsites() {
        $.ajax({
            url:'/government/index/govwebsites',
            type:'post',
            data:{},
            success:function(data){
                for(var i=0;i<5;i++){
                    $("#govwebsiteTable").append("<tr>\n" +
                        "        <td align=\"center\"><a href=\""+data.data[i].url+"\" target=\"_blank\">"+data.data[i].name+"</a></td>\n" +
                        "    </tr>");
                }
            }
        });
    }
</script>
</html>
