<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>提现打款 - 打款- ShuangSeQiu.admin v2.4</title>

</head>
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<body>
<article class="page-container">
	<c:forEach items="${xiangqingmap.list}" var="cz" varStatus="i" >
	<form class="form form-horizontal" id="form-dakuan">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>用户名：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" readonly  class="input-text" autocomplete="off"  id="username" name="username" value="${cz.userinfo.usersName}" />
		</div>
		<input type="text" hidden="hidden" id="id" value="${cz.wrId}"/>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>打款账号：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" class="input-text" readonly  autocomplete="off"  id="zhanghao" name="zhanghao" />
			<input type="text" hidden="hidden" readonly  id="wrWeiXin" name="wrWeiXin" value='${cz.wrWeiXin}'/>
			<input type="text" hidden="hidden" readonly   id="wrZhifubao" name="wrZhifubao" value='${cz.wrZhifubao}'/>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>账号类型：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" class="input-text" readonly  autocomplete="off"  id="zhanghaoType" name="zhanghaoType" value='${cz.wrTxtpye eq 0?"支付宝":"微信"}'>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>提现金额：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" class="input-text"  readonly  autocomplete="off"  id="wrMoney" name="wrMoney" value="${cz.wrMoney}">
		</div>
	</div>
	
	
	<div class="row cl">
		<div class="col-xs-4 col-sm-4 col-xs-offset-4 col-sm-offset-5">
			<input class="btn btn-primary radius" type="button" onclick="dakuan('${cz.userinfo.usersId}')" value="&nbsp;&nbsp;打款&nbsp;&nbsp;">
		</div>
	</div>
	</form>			
	</c:forEach>
</article>

<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	if($("#zhanghaoType").val()=="支付宝"){
		var zh = $("#wrZhifubao").val();
		$("#zhanghao").val(zh)
	}
	else{
		var zh = $("#wrWeiXin").val();
		$("#zhanghao").val(zh)
	}
</script>
<script type="text/javascript">
	function dakuan(uid) {
		var id= $("#id").val();
		$.ajax({
		url :"${pageContext.request.contextPath}/tixianrecord.do?p=DakuanTouser",
		type : "post",
		data : {"id":id,"uid":uid},
		success : function(data) {
			if(data=="true"){
				alert("OK")
				 window.parent.location.reload();  
			}
			else if(data=="false"){
				alert("ZFBSB")
			}
			
			
		},
		error:function(xhr,msg,obj){
			alert("error:"+msg);
			alert("修改失败")
			}
		});

	}
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
