<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'daohang.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all" />
	  <script type="text/javascript" src="${ctx }/resources/layui/layui.js"></script>
  </head>
  
  <body>
<%--     <div class="FooterContainer ">--%>
		 <!-- 底部 -->
		 <div class="layui-footer footer">
			 <p><span>copyright @2020 Gov</span></p>
		 </div>
<%--	</div>--%>
  </body>
</html>
