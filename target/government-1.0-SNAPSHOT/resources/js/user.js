layui.use(['form','layer','laydate','table','laytpl'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;

    //添加验证规则
    form.verify({
        oldPwd : function(value, item){
            $.ajax({
                url:'/government/user/checkpwd',
                method:'post',
                data:{password:value},
                dataType:'JSON',
                success:function(result){
                    if (result.code==0){
                        $("#message").html('<span style="color:red;">密码错误，请重新输入</span>');
                        $("#oldpwd").val("");
                    }else{
                        $("#message").html('');
                    }
                }
            });
        },
        newPwd : function(value, item){
            if(value.length < 6){
                return "密码长度不能小于6位";
            }
        },
        confirmPwd : function(value, item){
            if(!new RegExp($("#newpwd").val()).test(value)){
                return "两次输入密码不一致，请重新输入！";
            }
        }
    });

    // form.on('submit(changePwd)', function(data){
    //     $.ajax({
    //         url:'/government/user/changepwd',
    //         method:'post',
    //         data:data.field,
    //         dataType:'JSON',
    //         success:function(result){
    //             if (result.code==1){
    //                 layer.alert("保存成功");
    //             }else{
    //                 layer.alert("保存失败");
    //             }
    //         },
    //         error:function (data) {
    //
    //         }
    //     }) ;
    // });

    // $(document).on('click','#changepwd',function(){
    //     //var newpwd=$("#newpwd").val();
    //     $.ajax({
    //         url:'/government/user/changepwd',
    //         method:'post',
    //         data:123456,
    //         dataType:'JSON',
    //         success:function(result){
    //             if (result.code==1){
    //                 layer.alert("保存成功");
    //             }else{
    //                 layer.alert("保存失败");
    //             }
    //         },
    //         error:function (data) {
    //
    //         }
    //     }) ;
    // });


    form.on('switch(gradeStatus)', function(data){
        var tipText = '确定禁用当前会员等级？';
        if(data.elem.checked){
            tipText = '确定启用当前会员等级？'
        }
        layer.confirm(tipText,{
            icon: 3,
            title:'系统提示',
            cancel : function(index){
                data.elem.checked = !data.elem.checked;
                form.render();
                layer.close(index);
            }
        },function(index){
            layer.close(index);
        },function(index){
            data.elem.checked = !data.elem.checked;
            form.render();
            layer.close(index);
        });
    });
    //新增等级
    $(".addGrade").click(function(){
        var $tr = $(".layui-table-body.layui-table-main tbody tr:last");
        if($tr.data("index") < 9) {
            var newHtml = '<tr data-index="' + ($tr.data("index") + 1) + '">' +
                '<td data-field="id" data-edit="text" align="center"><div class="layui-table-cell laytable-cell-1-id">' + ($tr.data("index") + 2) + '</div></td>' +
                '<td data-field="gradeIcon" align="center" data-content="icon-vip' + ($tr.data("index") + 2) + '"><div class="layui-table-cell laytable-cell-1-gradeIcon"><span class="seraph vip' + ($tr.data("index") + 2) + ' icon-vip' + ($tr.data("index") + 2) + '"></span></div></td>' +
                '<td data-field="gradeName" data-edit="text" align="center"><div class="layui-table-cell laytable-cell-1-gradeName">请输入等级名称</div></td>' +
                '<td data-field="gradeValue" data-edit="text" align="center"><div class="layui-table-cell laytable-cell-1-gradeValue">0</div></td>' +
                '<td data-field="gradeGold" data-edit="text" align="center"><div class="layui-table-cell laytable-cell-1-gradeGold">0</div></td>' +
                '<td data-field="gradePoint" data-edit="text" align="center"><div class="layui-table-cell laytable-cell-1-gradePoint">0</div></td>' +
                '<td data-field="' + ($tr.data("index") + 1) + '" align="center" data-content="" data-minwidth="100"><div class="layui-table-cell laytable-cell-1-' + ($tr.data("index") + 1) + '"> <input type="checkbox" name="gradeStatus" lay-filter="gradeStatus" lay-skin="switch" lay-text="启用|禁用" checked=""><div class="layui-unselect layui-form-switch layui-form-onswitch" lay-skin="_switch"><em>启用</em><i></i></div></div></td>' +
                '</tr>';
            $(".layui-table-body.layui-table-main tbody").append(newHtml);
            $(".layui-table-fixed.layui-table-fixed-l tbody").append('<tr data-index="' + ($tr.data("index") + 1) + '"><td data-field="id" data-edit="text" align="center"><div class="layui-table-cell laytable-cell-1-id">' + ($tr.data("index") + 2) +'</div></td></tr>');
            $(".layui-table-fixed.layui-table-fixed-r tbody").append('<tr data-index="' + ($tr.data("index") + 1) + '"><td data-field="' + ($tr.data("index") + 1) + '" align="center" data-content="" data-minwidth="100"><div class="layui-table-cell laytable-cell-1-' + ($tr.data("index") + 1) + '"> <input type="checkbox" name="gradeStatus" lay-filter="gradeStatus" lay-skin="switch" lay-text="启用|禁用" checked=""><div class="layui-unselect layui-form-switch layui-form-onswitch" lay-skin="_switch"><em>启用</em><i></i></div></div></td></tr>');
            form.render();
        }else{
            layer.alert("模版中由于图标数量的原因，只支持到vip10，实际开发中可根据实际情况修改。当然也不要忘记增加对应等级的颜色。",{maxWidth:300});
        }
    });

    //控制表格编辑时文本的位置【跟随渲染时的位置】
    $("body").on("click",".layui-table-body.layui-table-main tbody tr td",function(){
        $(this).find(".layui-table-edit").addClass("layui-"+$(this).attr("align"));
    });

})