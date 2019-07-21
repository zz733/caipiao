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
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->


<title>管理员编辑</title>
</head>
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<body>
<input type="hidden" value= />
<article class="cl pd-20">
	<form action="" method="post" class="form form-horizontal" id="form-admin-add">
		<div class="row cl">
	       <label class="form-label col-xs-2 col-sm-4 mylabel"><span class="c-red">*</span>ID：</label>
			<div class="formControls col-xs-8 col-sm-5" >
				<input type="text" class="input-text" autocomplete="off"  name="adminId" id="adminId" value=${eadmin.adminId} disabled="true">
			</div>
			<label class="form-label col-xs-1 col-sm-1">
				<span id="msg"></span> 
			</label>
        </div>
		<div class="row cl">
			<label class="form-label col-xs-2 col-sm-4 mylabel"><span class="c-red">*</span>账号：</label>
			<div class="formControls col-xs-8 col-sm-5" >
				<input type="text" class="input-text"  onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"  value=${eadmin.adminUsername}  autocomplete="off" disabled="true" name="adminName" id="adminName">
			</div>
		</div>
        
		<div class="row cl">
		<label class="form-label col-xs-2 col-sm-4 mylabel"><span class="c-red">*</span>角色：</label>
		<div class="formControls col-xs-8 col-sm-5" > <span class="select-box" >
			<select class="select" name="adminPower" size="1">
			    <option value="0" ${eadmin.adminPower==0 ? 'selected':' '}>已注销</option>
				<option value="2" ${eadmin.adminPower==2 ? 'selected':' '}>普通管理员</option>
				<option value="1" ${eadmin.adminPower==1 ? 'selected':' '}>超级管理员</option>
			</select>
			</span> </div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-5">
				<input id="submit_but" class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;修改&nbsp;&nbsp;">
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
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">


$(function(){

	$("#submit_but").click(function(){
	   var info=$(".select option:selected").val();
	   var adminId=$(".input-text").val();
		$.ajax({
			
			url:"${pageContext.request.contextPath}/admin.do",
			type:"post",
			
			data:{
				"p":"sureEdit",
				"info":info,
				"adminId":adminId
			},
			
			success:function(data){
				
				if(data=="false"){
					window.parent.location.reload();
				}else{
					layer.msg('修改成功!',{icon:6,time:1000});   
					setTimeout(function(){window.parent.location.href="${pageContext.request.contextPath}/admin.do?p=adminlisting";},1000);
				   
				};
			},
			error:function(data){
				
				layer.msg("系统异常",{icon:6,time:1000});
			}
		});
	});
		
});



</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>