layui.use([ 'jquery', 'layer','layedit','form', 'table','laydate','laypage','upload','element'], function() {
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var laydate = layui.laydate;
    var laypage = layui.laypage;
    var upload = layui.upload;
    var element = layui.element;

    //普通图片上传
    var uploadInst = upload.render({
        elem: '#upload'
        , url: '/government/user/upload'
        , accept: 'images'
        , acceptMime: 'image/*'
        , auto: true//是否选择文件之后自动上传
        , field: 'mf' //表单的name值
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#image').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            layer.alert(res.data.src + ":" + res.code);
            //如果上传失败
            // if(res.code>0){
            //     layer.alert('上传失败');
            // }
            //上传成功
            $('#image').attr('src', res.data.src);
            $("#photo").val(res.data.src);
            //window.parent.uploadHeadImage(res.data.src);
            var message = $('#message');
            message.html('<span style="color: #8f8f8f;">上传成功!!!</span>');
        }
        , error: function () {
            //演示失败状态，并实现重传
            var message = $('#message');
            message.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            message.find('.demo-reload').on('click', function () {
                uploadInst.upload();
            });
        }
    });
});