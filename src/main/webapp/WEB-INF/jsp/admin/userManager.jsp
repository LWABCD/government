<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>用户管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="favicon.ico">
	<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx }/resources/css/public.css" media="all" />
</head>
<body class="childrenBody">
	<!-- 搜索条件开始 -->
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>查询条件</legend>
	</fieldset>
	<form class="layui-form" method="post" id="searchFrm">
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label">用户名:</label>
		      <div class="layui-input-inline">
		        <input type="text" name="username"  autocomplete="off" class="layui-input">
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">手机号:</label>
		      <div class="layui-input-inline">
		        <input type="text" name="phone"  autocomplete="off" class="layui-input">
		      </div>
		    </div>
		 </div>
		 <div  class="layui-form-item">
		  <div class="layui-input-block" >
		      <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
		      <button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
		    </div>
		 </div>
	</form>
	
	<!-- 搜索条件结束 -->
	
	<!-- 数据表格开始 -->
	<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
	<div style="display: none;" id="userToolBar">
	   <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
       <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteBatch">批量删除</button>
	</div>
	<div  id="userBar" style="display: none;">
	  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	  <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="resetUserPwd">重置密码</a>
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	  <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="selectUserRole">分配角色</a>
	</div>
	<!-- 数据表格结束 -->
	
	<!-- 添加和修改的弹出层开始 -->
	<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
		<form class="layui-form"  lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">登录名称:</label>
					<div class="layui-input-inline">
						<input type="hidden" name="uid">
						<input type="text" name="username" lay-verify="required"   placeholder="请输入用户名" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">密码:</label>
					<div class="layui-input-inline">
						<input type="text" name="password" lay-verify="required"  placeholder="请输入密码" autocomplete="off"
							   class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">手机号:</label>
					<div class="layui-input-inline">
						<input type="text" name="phone"  placeholder="请输入手机号" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item" style="text-align: center;">
			    <div class="layui-input-block">
			      <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
			      <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" >重置</button>
			    </div>
		  	</div>
		</form>
	
	</div>
	<!-- 添加和修改的弹出层结束 -->
	
	<!-- 用户分配角色的弹出层开始 -->
	<div style="display: none;padding: 10px" id="selectUserRole">
		<table class="layui-hide" id="roleTable" lay-filter="roleTable"></table>
	</div>
	<!-- 用户分配角色的弹出层结束 -->
	
	<script src="${ctx }/resources/layui/layui.js"></script>
	<script type="text/javascript">
	    var tableIns;
	    layui.extend({
			dtree:'${ctx}/resources/layui_ext/dist/dtree'
		}).use([ 'jquery', 'layer', 'form', 'table','dtree'  ], function() {
			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
			var dtree=layui.dtree;
			//渲染数据表格
			 tableIns=table.render({
				 elem: '#userTable'   //渲染的目标对象
			    ,url:'${ctx}/user/loadAllUser' //数据接口
			    ,title: '用户数据表'//数据导出来的标题
			    ,toolbar:"#userToolBar"   //表格的工具条
			    ,height:'full-200'
			    ,cellMinWidth:100 //设置列的最小默认宽度
			    ,page: true  //是否启用分页
			    ,cols: [[   //列表数据
			     {type: 'checkbox', fixed: 'left'}
			      ,{field:'uid', title:'ID',align:'center',width:'180'}
			      ,{field:'username', title:'用户名',align:'center',width:'180'}
			      ,{field:'phone', title:'手机号',align:'center',width:'180'}
			      ,{field:'pwd', title:'密码',align:'center',width:'180',templet:function(d){
			    	  return "******";
			      }}
			      ,{fixed: 'right', title:'操作', toolbar: '#userBar', width:360,align:'center'}
			    ]]
			})
			//模糊查询
			$("#doSearch").click(function(){
				var params=$("#searchFrm").serialize();
				tableIns.reload({
					url:"${ctx}/user/loadAllUser?"+params
				})
			});
			
			//监听头部工具栏事件
			table.on("toolbar(userTable)",function(obj){
				 switch(obj.event){
				    case 'add':
				      openAddUser();
				    break;
				    case 'deleteBatch':
				      deleteBatch();
					break;
				  };
			})
			//监听行工具事件
		   table.on('tool(userTable)', function(obj){
			   var data = obj.data; //获得当前行数据
			   var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			  if(layEvent === 'del'){ //删除
				  layer.confirm('真的删除【'+data.username+'】这个用户吗', function(index){
				       //向服务端发送删除指令
				       $.post("${ctx}/user/deleteUser",{uid:data.uid},function(res){
				    	   layer.msg(res.msg);
				    	    //刷新数据 表格
							tableIns.reload();
				       })
				     }); 
			   } else if(layEvent === 'edit'){ //编辑
			     openUpdateUser(data);
			   }else if(layEvent==='resetUserPwd'){
				   layer.confirm('真的重置【'+data.username+'】这个用户的密码吗', function(index){
				       //向服务端发送删除指令
				       $.post("${ctx}/user/resetUserPwd.action",{uid:data.uid},function(res){
				    	   layer.msg(res.msg);
				       })
				     }); 
			   }else if(layEvent==='selectUserRole'){
				 openselectUserRole(data);
			   }
			 });
			
			var url;
			var mainIndex;
			//打开添加页面
			function openAddUser(){
				mainIndex=layer.open({
					type:1,
					title:'添加用户',
					content:$("#saveOrUpdateDiv"),
					area:['800px','400px'],
					success:function(index){
						//清空表单数据       
						$("#dataFrm")[0].reset();
						url="${ctx}/user/addUser";
					}
				});
			}
			//打开修改页面
			function openUpdateUser(data){
				mainIndex=layer.open({
					type:1,
					title:'修改用户',
					content:$("#saveOrUpdateDiv"),
					area:['800px','400px'],
					success:function(index){
						form.val("dataFrm",data);
						url="${ctx}/user/updateUser";
					}
				});
			}
			//保存
			form.on("submit(doSubmit)",function(obj){
				//序列化表单数据
				var params=$("#dataFrm").serialize();
				$.post(url,params,function(obj){
					layer.msg(obj.msg);
					//关闭弹出层
					layer.close(mainIndex)
					//刷新数据 表格
					tableIns.reload();
				})
			});
			
			//批量删除
			function deleteBatch(){
				//得到选中的数据行
				var checkStatus = table.checkStatus('userTable');
			    var data = checkStatus.data;
			    var params="";
			    $.each(data,function(i,item){
			    	if(i==0){
			    		params+="ids="+item.uid;
			    	}else{
			    		params+="&ids="+item.uid;
			    	}
			    });
			    layer.confirm('真的删除选中的这些用户吗', function(index){
				       //向服务端发送删除指令
				       $.post("${ctx}/user/deleteBatchUser",params,function(res){
				    	   layer.msg(res.msg);
				    	    //刷新数据 表格
							tableIns.reload();
				       })
				     }); 
			}
			//打开分配角色的弹出层
			function openselectUserRole(data){
				mainIndex=layer.open({
					type:1,
					title:'分配【'+data.username+'】的角色',
					content:$("#selectUserRole"),
					area:['800px','400px'],
					btnAlign:'c',
					height:'full',
					btn:['<div class="layui-icon layui-icon-release" id="provide">确认分配</div>','<div class="layui-icon layui-icon-close" id="notprovide">取消分配</div>'],
					yes:function(index, layero){
						//得到选中的数据行
						var checkStatus = table.checkStatus('roleTable');
						var roleData = checkStatus.data;
						var params="uid="+data.uid;
					    //如果该用户是超级管理员，则不可以更改他的角色，其它用户无法分配超级管理员这个角色
						if (data.uid!=1){
							var flag=true;
					    	$.each(roleData,function(i,item){
								//如果其它用户点了超级管理员这个角色，则进行提示
					    		if (item.roleid==1) {
									flag=false;
									return;
								}
								params+="&ids="+item.roleid;
							});
							if (flag){
								//保存
								$.post("${ctx}/user/saveUserRole",params,function(obj){
									layer.msg(obj.msg);
								})
							}else{
								layer.msg("该用户无法拥有超级管理员这个角色");
							}
						//超级管理员拥有了所有的菜单权限，没有不要分配其它的角色了
						}else{
					    	layer.msg("您是超级管理员，拥有所有的菜单权限");
						}
					},
					success:function(index){
						//渲染数据表格
						 var roleTableIns=table.render({
							 elem: '#roleTable'   //渲染的目标对象
						    ,url:'${ctx}/user/initUserRole?uid='+data.uid //数据接口
						    ,title: '角色列表'//数据导出来的标题
						    ,cellMinWidth:100 //设置列的最小默认宽度
						    ,cols: [[   //列表数据
						     {type: 'checkbox', fixed: 'left'}
						      ,{field:'roleid', title:'ID',align:'center'}
						      ,{field:'rolename', title:'角色名称',align:'center'}
						      ,{field:'roledesc', title:'角色备注',align:'center'}
						    ]]
						})
					}
				});
			}
		});
	</script>
</body>
</html>