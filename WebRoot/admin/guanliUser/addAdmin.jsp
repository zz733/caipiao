<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>   
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>添加管理员</title>
</head>
<style>
input.valid{
background-color: #fff;
border-color: #32bc61;
color: black;
}
label.valid {
    width:16px;
    height:16px;
   background:url(../img/sucess.png) no-repeat ;
   margin-top: 2px;
}

</style>
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<body>
<article class="page-container">
	<form action="/" method="post" class="form form-horizontal" id="form-addadmin">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>名称：</label>
			<div class="formControls col-xs-8 col-sm-3">
				<input type="text" class="input-text" autocomplete="off" placeholder="" name="Name" id="name">
			</div>
			<label class="form-label col-xs-1 col-sm-1">
				<span id="msg"></span> 
			</label>
		</div>
		<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>角色：</label>
		<div class="formControls col-xs-8 col-sm-3"> <span class="select-box" >
			<select class="select" name="adminPower" size="1">
				<option value="2">普通管理员</option>
				<option value="1">超级管理员</option>
			</select>
			</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>账号：</label>
			<div class="formControls col-xs-8 col-sm-3">
				<input type="text" class="input-text"  onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" autocomplete="off" placeholder="" name="usersname" id="usersname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>新密码：</label>
			<div class="formControls col-xs-8 col-sm-3">
				<input type="password" class="input-text" autocomplete="off" placeholder="" name="newpassword" id="newpassword">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-3">
				<input type="password" class="input-text" autocomplete="off" placeholder="" name="newpassword2" id="new-password2">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-5 col-sm-offset-5">
				<input class="btn btn-primary radius" type="submit" id="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>






<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>

<script type="text/javascript">

//得到工程路径
function getRootPath() {
	//http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	//uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	//http://localhost:8083
	var localhostPaht = curWwwPath.substring(0, pos);
	// uimcardprj
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
    if (projectName=="/admin" || projectName=="/pc")
      projectName = "";
	return (localhostPaht+projectName);
}

var path = getRootPath() ;
$(function(){
	$("#form-addadmin").validate({
		rules:{
			Name:{
				required:true,
				minlength:2,
				maxlength:16,
				remote: { 
					url: path+"/admin.do?p=yzname",//后台处理程序 
					type: "post", //数据发送方式 
					data: { //要传递的数据 
						name:function() {
							return $("#name").val();
							}
	                 }
				}
			},
			usersname:{
				required:true,
				minlength:5,
				maxlength:16,
				remote: { 
					url: path+"/admin.do?p=yzusersname",//后台处理程序 
					type: "post", //数据发送方式 
					data: { //要传递的数据 
						usersname:function() {
							return $("#usersname").val();
							}
	                 }
				}
			},
			newpassword:{
				required:true,
				minlength:6,
				maxlength:16
			},
			newpassword2:{
				required:true,
				minlength:6,
				maxlength:16,
				equalTo: "#newpassword"
			},
			messages:{
				 Name:{
                     required:"该名字已被使用",
                      remote:"该名字已被使用"
                 }
				},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				data:{newPassword:$("#new-password2").val()},
				url: path+"/admin.do?p=addAdmin",
				success: function(data){
					layer.msg('添加成功!',{icon:6,time:1000});
					setTimeout(function(){window.location.href=path+"/admin.do?p=adminlisting";},1000);
				},
                error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('error!',{icon:2,time:1000});
				}
			});
		}
	});
});
		
</script>
</body>
</html>