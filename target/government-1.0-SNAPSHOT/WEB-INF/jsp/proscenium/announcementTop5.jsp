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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
      <table width="100%" id="table">
<%--		<tr>--%>
<%--			<td align="left"><a href="/government/index/announcementDetail?aid="></a></td>--%>
<%--			<td>abc</td>--%>
<%--		</tr>--%>
	  </table>
  </body>

<script>
	$(function () {
		getData();
	});

	function getData() {
		$.ajax({
			url:'/government/index/announcements',
			type:'post',
			data:{},
			success:function(data){
				for(var i=0;i<5;i++){
					var createtime=new Date(data.data[i].createtime).toLocaleDateString();
					$("#table").append("<tr>\n" +
							"\t\t\t<td align=\"left\"><a href=\"/government/index/announcementDetail?aid="+data.data[i].aid+"\">"+data.data[i].title+"</a></td>\n" +
							"\t\t\t<td>"+createtime+"</td>\n" +
							"\t\t</tr>");
				}
			}
		});
	}
</script>
</html>
