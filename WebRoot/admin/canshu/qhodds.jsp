<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/respond.min.js"></script>

<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>竞猜球号的赔率</title>
</head>
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<body>
<div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-user-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">
				<span class="c-red">*</span>
				竞猜球号赔率：</label>
			<div class="formControls col-xs-6 col-sm-4">		
				<input type="text" class="input-text" value="${qhodds}" id="qhodds" name="qhodds">
			</div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-4">
				<input class="btn btn-primary radius" type="button"  onclick="xiugai()" value="&nbsp;&nbsp;修改&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">

function xiugai()
{	
	var qhodds=$("#qhodds").val();
	var num = /^[0-9]+(.[0-9]{1,2})?$/;
	if(qhodds==null || ""==qhodds){
		layer.msg("请输入球号赔率!",{icon:2,time:1000});
		return false;
	}
	if(!num.test(qhodds)){
		layer.msg("格式有误",{icon:2,time:1000});
		$("#qhodds").val("");
		return false;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/jccs.do?p=xgjccsqh",
		data:{qhodds:qhodds},
		type:"post",
		success:function(data){
		    layer.msg("设置成功",{icon:6,time:2000});
			//location.replace(location.href);
		}
	});
}
</script>
</body>
</html>