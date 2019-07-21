<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

</style>
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<body>
<article class="page-container">
	<form  class="form form-horizontal" id="form-addwuliu">
	<c:forEach items="${map.list}" var="m">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>商品订单号：</label>
			<div class="formControls col-xs-8 col-sm-4">
				<input type="text" class="input-text" readonly="readonly" value="${m.orOrdernumber}" name="ordernumber" id="ordernumber">
			</div>
			<input type="text" hidden="hidden" value="${m.orId}" name="orderid"/>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>用户昵称：</label>
			<div class="formControls col-xs-8 col-sm-4">
				<input type="text" class="input-text" readonly="readonly" value="${m.userinfo.usersName}" name="userName" id="username">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>物流运单号：</label>
			<div class="formControls col-xs-8 col-sm-4">
				<input type="text" class="input-text" autocomplete="off" placeholder="" name="psnumber" id="psnumber">
			</div>
		</div>
		<div class="row cl">
		</c:forEach>
		
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>物流公司：</label>
		<div class="formControls col-xs-8 col-sm-4"> <span class="select-box" >
			<select class="select" name="pscorp" size="1">
				<c:forEach items="${map.pslist}" var="ps">
				<option value="${ps.pscId}">${ps.pscChinesename}</option>
				</c:forEach>
			</select>
			</span> 
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
$("#form-addwuliu").validate({
	rules:{
		psnumber:{
			required:true,
		},
	},
	onkeyup:false,
	focusCleanup:true,
	success:"valid",
	submitHandler:function(form){
		$(form).ajaxSubmit({
			type: 'post',
			url: "${pageContext.request.contextPath}/order.do?p=updateState" ,
			success: function(data){
				if(data=="ture"){
				layer.msg('添加成功!',{icon:6,time:1000});
				setTimeout(function(){window.parent.location.reload();},1000);
				}
				else{
					layer.msg('添加失败!',{icon:2,time:1000});
					setTimeout(function(){window.parent.location.reload();},1000);
				}

			},
            error: function(XmlHttpRequest, textStatus, errorThrown){
				layer.msg('error!',{icon:2,time:1000});
			}
		});
	}

});
		
</script>
</body>
</html>