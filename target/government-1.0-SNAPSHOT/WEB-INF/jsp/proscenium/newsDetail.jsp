<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <link href="<%=path%>/resources/css/Common.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/resources/css/sitegeneric08.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css" />
    <link rel="stylesheet" href="<%=path%>/resources/css/typo.css" /><!--内容排版-->

    <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
    <script language="javascript">
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
        <div id="content" class="Sub" style="padding-left: 200px">
            <div class="NewContainer770">
                <div class="BoxHeader">
                    <div class="BoxHeader-center MarginTop10">新闻详情<a href="javascript:;" onclick="self.location=document.referrer;"><<</a></div>
                </div>
                <div class="Slot">
                    <table id="table" align="center" width="100%" border="0" align="center">
                        <tr style="height: 100px">
                            <td align="center"><span style="font-size: x-large">${requestScope.news.title}</span></td>
                        </tr>
                        <tr>
                            <td style="padding-left: 50px;">来源:${requestScope.news.origin}<span style="float: right;padding-right:100px ">阅读:${requestScope.news.readnumber}</span></td>
                        </tr>
                        <tr>
                            <td align="center"><hr></td>
                        </tr>
                        <c:forEach items="${requestScope.newsPics}" var="newsPic">
                            <tr>
                                <td style="padding-left: 250px">
                                    <img src="${newsPic}" style="width: 400px;height: 200px;padding: 10px" class="ui fluid rounded image">
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
<%--                            <td><span style="font-size: larger">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.news.content}</span></td>--%>
                            <td>
                                <div class="typo  typo-selection js-toc-content m-padded-lr-responsive m-padded-tb-large">
                                    <p>${requestScope.news.content}</p>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 50px">
                            <td align="right"><fmt:formatDate value="${requestScope.news.createtime}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--body-->



<!--foot -->
<div align="center" class="Wrapper">
    <div id="footer" align="center" class="Footer">
        <jsp:include flush="true" page="/WEB-INF/jsp/proscenium/inc/incFoot.jsp"></jsp:include>
    </div>
</div>
<!--foot -->
</body>

</html>
