<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link href="${pageContext.request.contextPath}/resources/css/Common.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/sitegeneric08.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/public.js" type="text/javascript"></script>
    <script language="JavaScript" type="text/javascript">
    </script>

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
<!-- head如果图片高度不合适。请修改Common.ces里面的".Header .HeaderTop"的高度。和".Header"的高度-->
<jsp:include flush="true" page="/WEB-INF/jsp/proscenium/inc/incTop.jsp"></jsp:include>
<!-- head-->	
	
	
	
	
<!--body-->
<div align="center" class="Wrapper">
<div id="MainCenter" align="center" class="MainCenter">
	     <div id="navigation" class="naivgation">
				 <!-- 公告-->
				 <div class="SquarelyGreenContainer">
					<div class="top">
						<div class="bgbtop-center">
							<span><a href="/government/index/toAllAnnouncement">网站公告</a></span>
							<div class="WinRight"></div>
						</div>
					</div>
					<div class="Slot">
						<jsp:include flush="true" page="/WEB-INF/jsp/proscenium/announcementTop5.jsp"></jsp:include>
<%--						<iframe name="ifa" src="${pageContext.request.contextPath}/index/toGonggaoQian5" ></iframe>--%>
					</div>
				 </div>
				 <!-- 公告-->
				 <!-- 公告-->
				 <div class="SquarelyGreenContainer">
					<div class="top">
						<div class="bgbtop-center">
							<span><a href="/government/index/toAllGovwebsite">政府部门网站</a></span>
							<div class="WinRight"></div>
						</div>
					</div>
					<div class="Slot">
						<jsp:include flush="true" page="/WEB-INF/jsp/proscenium/govwebsiteTop5.jsp"></jsp:include>
					</div>
				 </div>
				 <!-- 公告-->
				 <!-- 日历-->
				 <div class="SquarelyGreenContainer">
					<div class="top">
						<div class="bgbtop-center">
							<span><a href="">日历表</a></span>
							<div class="WinRight"></div>
						</div>
					</div>
					<div class="Slot">
					    <jsp:include flush="true" page="/WEB-INF/jsp/proscenium/rili.jsp"></jsp:include>
					</div>
				 </div>
				 <!-- 日历-->
		 </div>
		 <div id="content" class="Sub">
				<div class="NewContainer770">
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10"><a href="/government/index/toAllNews">新闻动态</a></div>
					</div>
					<div class="Slot" align="center" style="background-color: white;height: 570px;">
						<jsp:include flush="true" page="/WEB-INF/jsp/proscenium/newsTop5.jsp"></jsp:include>
                    </div>
				</div>
<%--				<div class="NewContainer770">--%>
<%--					<div class="BoxHeader">--%>
<%--						<div class="BoxHeader-center MarginTop10">地区概况</div>--%>
<%--					</div>--%>
<%--					<div class="Slot">--%>
<%--						<table width="100%" border="0">--%>
<%--						    <tr>--%>
<%--						       <td align="center"><s:property value="#request.diqugaikuang.content" escape="false"/></td>--%>
<%--						    </tr>--%>
<%--						</table>--%>
<%--                    </div>--%>
<%--				</div>--%>
		 </div>
</div>
</div>
<!--body-->
	
	
	
<!--foot -->	
<div align="center" class="Wrapper" style="padding-bottom: 0px">
	<div id="footer" align="center" class="Footer">
		 <jsp:include flush="true" page="/WEB-INF/jsp/proscenium/inc/incFoot.jsp"></jsp:include>
	</div>
</div>
<!--foot -->	
</body>
</html>
