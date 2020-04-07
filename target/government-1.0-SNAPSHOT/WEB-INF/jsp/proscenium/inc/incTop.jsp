<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <style type="text/css">
        .Header {CLEAR: both; DISPLAY: block; FLOAT: left;); WIDTH: 1365px; POSITION: relative; HEIGHT: 110px}
        .Header .HeaderTop {algin:center;padding-right:100px;HEIGHT: 70px}
    </style>
    <script type="text/javascript">
        function liuyanAll()
        {
                 var url="<%=path %>/liuyanAll.action";
			     window.open(url,"_blank");
        }
    </script>
  </head>
  
  <body>
	 <div align="center" class="Wrapper">
		 <div class="Header">
				<div class="HeaderTop">
				    <br/>
				    <font size="22px;">电子政务网</font>
				</div>
				<div id="Menu" class="Menu">
					<div id="fstMenu" class="fstMenu"></div>
					<div class="secMenu">
						<span id="secMenu0" class="secMenu-center">
						     <a href="<%=path%>/index/toindex">首页</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							 <a href="<%=path%>/index/toAllAnnouncement">网站公告</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						     <a href="<%=path %>/pLeaderEmail/toLeaderEmail">领导信箱</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						     <a href="<%=path %>/pFile/toFileDownload">文件下载</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						     <a href="<%=path %>/pOpenGovernment/toOpenGovernment">政务公开</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
							 <a href="<%=path%>/index/toAllNews">新闻动态</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
							<a target="_blank" href="<%=path %>/login/toLogin">进入后台</a>
						</span>
					</div>
				</div>
		    </div>
        </div>	
  </body>
</html>
