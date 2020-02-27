<%--
  Created by IntelliJ IDEA.
  User: LWABCD
  Date: 2020/1/30
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>新闻编辑</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<div style="padding-left: 130px;padding-top:10px">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">新闻标题:</label>
            <div class="layui-input-inline">
                <input type="text" id="title" name="title" value="${requestScope.news.title}"  lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片：</label>
        <div class="layui-upload">
            <button type="button" class="layui-btn" id="multiple_img_upload">上传图片</button>
            <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;margin-left:110px;width:850px;height: 140px">
                预览：
                <div class="layui-upload-list" id="div-slide_show">
                    <c:forEach items="${requestScope.newsPics}" var="newsPic">
                        <img src="${newsPic}" id="" style="width: 100px;height: 100px;border-radius: 10px;margin: 5px" alt="" title="点击删除" class="layui-upload-img" onclick=delMultipleImgs(this)>
                    </c:forEach>
                </div>
            </blockquote>
        </div>
        <input type="text" id="url" name="url" value="${requestScope.news.url}" style="display: none;" class="layui-input">
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">新闻内容:</label>
            <div class="layui-input-inline">
                <textarea id="content" name="content" style="width: 850px;height: 300px">${requestScope.news.content}</textarea>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">来源:</label>
            <div class="layui-input-inline">
                <input type="text" id="origin" name="origin" value="${requestScope.news.origin}"  lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="display: none">
            <label class="layui-form-label">新闻id:</label>
            <div class="layui-input-inline">
                <input type="text" id="nid" name="nid" value="${requestScope.news.nid}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="display: none">
            <label class="layui-form-label">创建时间:</label>
            <div class="layui-input-inline">
                <input type="text" id="createtime" name="createtime" value="${requestScope.news.createtime}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="display: none">
            <label class="layui-form-label">阅读数:</label>
            <div class="layui-input-inline">
                <input type="text" id="readnumber" name="readnumber" value="${requestScope.news.readnumber}"  lay-verify="required" disabled autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="padding-left: 110px">
        <div class="layui-inline">
            <p id="message"></p>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline"> 
            <div class="layui-input-block" style="padding-left: 300px">
                <c:if test="${requestScope.news==null}">
                    <button id="save" class="layui-btn layui-btn-normal" align="center">提交</button>
                </c:if>
                <c:if test="${requestScope.news!=null}">
                    <button id="save" class="layui-btn layui-btn-normal" align="center">修改</button>
                </c:if>
                <button id="reset" class="layui-btn layui-btn-normal" align="center">重置</button>
                <button class="layui-btn layui-btn-normal" align="center"><a href="${pageContext.request.contextPath}/news/tonews" style="color: white">返回</a></button>   
            </div>
        </div>
    </div>
</div>
</body>

<script>
    var success=0;
    var fail=0;
    var url="";
    //多图容器 【注册全局变量】
    var multiple_images = [];

    //当编辑新闻时，如果url不为空就要把字符串的url转到数组multiple_images中
    $(function () {
        var url=$("#url").val();
        if (url!=''){
            multiple_images=stringToArray(url);
        }
    });

    layui.use([ 'jquery', 'layer', 'form','laydate','element','upload'], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        var element = layui.element;
        var upload = layui.upload;

        $("#save").click(function () {
            var title=$("#title").val();
            var content=$("#content").val();
            var origin=$("#origin").val();
            var nid=$("#nid").val();
            var createtime=$("#createtime").val();
            var readnumber=$("#readnumber").val();
            var url=$("#url").val();
            var message = $('#message');
            if (title==''||content==''||origin==''){
                message.html('<span style="color:red;">请填写完整！</span>');
            }else{
                message.html('');
                $.ajax({
                    url: '/government/news/saveNews',
                    method: 'post',
                    data:{
                        title:title,
                        content:content,
                        origin:origin,
                        nid:nid,
                        createtime:createtime,
                        readnumber:readnumber,
                        url:url
                    },
                    dataType: 'JSON',
                    success: function (result) {
                        if (result.code == 1) {
                            layer.alert("保存成功");
                            window.location.href="${pageContext.request.contextPath}/news/tonews";
                        } else {
                            layer.alert("保存失败");
                        }
                    },
                    error: function (data) {

                    }
                });
            }
        });

        $("#reset").click(function () {
            $("#content").val('');
        });

        //多图片上传
        var uploadInst=upload.render({
            elem: '#multiple_img_upload'
            ,url: '/government/news/upload'
            ,multiple: true
            ,auto:true
//			上传的单个图片大小
            ,size:10240
//			最多上传的数量
            ,number:20
//			MultipartFile file 对应，layui默认就是file,要改动则相应改动
            ,field:'cmf'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    // $('#div-slide_show').append('<img src="'+ result +'" id="'+file.name+'" style="width: 100px;height: 100px;border-radius: 10px;margin: 5px" alt="'+ file.name
                    //     +'" title="点击删除" class="layui-upload-img" onclick=delMultipleImgs(this)>')
                });
            }
            ,done: function(res){
                //如果上传成功
                if (res.code== 1) {
                    //追加图片成功追加文件名至图片容器
                    //预览图片的顺序为上传图片的顺序，并不是选择时候的顺序
                    //是为了保证预览的顺序和multiple_images中的图片地址顺序一致
                    $('#div-slide_show').append('<img src="'+ res.data.src+'" style="width: 100px;height: 100px;border-radius: 10px;margin: 5px" title="点击删除" class="layui-upload-img" onclick=delMultipleImgs(this)>')
                    multiple_images.push(res.data.src);
                    $("#url").val(multiple_images);
                    success++;
                }else {
                    //提示信息
                    //dialog.tip(res.message);
                    fail++;
                }
            },
            allDone:function(obj){
                layer.msg("总共要上传图片总数为："+(fail+success)+"\n"
                    +"其中上传成功图片数为："+success+"\n"
                    +"其中上传失败图片数为："+fail
                )
            }
        });

    });

    //单击图片删除图片 【注册全局函数】
    function delMultipleImgs(this_img){
        //获取下标
        var subscript=$("#div-slide_show img").index(this_img);
        var delimgurl=multiple_images[subscript];
        //删除已经保存在硬盘上的这张图片
        $.ajax({
            url: '${pageContext.request.contextPath}/news/deleteImage',
            type: 'post',
            dataType: 'json',
            data: {delimgurl:delimgurl}, // 要提交给服务端的数据
            success: function (data) { // 请求成功后如何处理结果?
                if (data.code==1){
                    //删除图片
                    this_img.remove();
                    //删除数组
                    multiple_images.splice(subscript, 1);
                    $("#url").val(multiple_images);
                    alert(删除成功);
                }else{
                    alert(data.msg);
                }
            }
        });
        //console.log("multiple_images",multiple_images);
        //返回
        return ;
    }

    function stringToArray(string) {
        return string.split(",");
    }

</script>
</html>
