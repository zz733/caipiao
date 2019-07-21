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
<title>开奖纪录 - 修改开奖纪录- ShuangSeQiu.admin v2.4</title>

</head>
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-qiuhao-add">
	<input type="hidden" name="id" value="${param.id }"/>
	<c:forEach items="${list }" var="z">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>开奖时间：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" id="commentdatemin" name="commentdatemin" class="input-text Wdate" value="${z.kjTime }">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>开奖期数：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" class="input-text" placeholder="开奖期数" id="Qishu" name="Qishu" value="${z.kjQishu }">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>第一个红球：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" class="input-text" autocomplete="off"  placeholder="第一个红球" id="oneRed" name="oneRed" value="${z.kjRedone }">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>第二个红球：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" class="input-text" autocomplete="off"  placeholder="第二个红球" id="twoRed" name="twoRed" value="${z.kjRedtwo }">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>第三个红球：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" class="input-text" autocomplete="off"  placeholder="第三个红球" id="threeRed" name="threeRed" value="${z.kjRedthree }">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>第四个红球：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" class="input-text" autocomplete="off"  placeholder="第四个红球" id="fourRed" name="fourRed" value="${z.kjRedfour }">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>第五个红球：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" class="input-text" autocomplete="off"  placeholder="第五个红球" id="fiveRed" name="fiveRed" value="${z.kjRedfive }">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>第六个红球：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" class="input-text" autocomplete="off" placeholder="第六个红球" id="sixRed" name="sixRed" value="${z.kjRedsix }">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-4"><span class="c-red">*</span>蓝球：</label>
		<div class="formControls col-xs-4 col-sm-4">
			<input type="text" class="input-text" autocomplete="off"  placeholder="蓝球球号" id="Blue" name="Blue"  value="${z.kjBlue }">
		</div>
	</div>
	</c:forEach>
	<div class="row cl">
		<div class="col-xs-4 col-sm-4 col-xs-offset-4 col-sm-offset-5">
			<input class="btn btn-primary radius" type="submit" id="add" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
	</form>			
	
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
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-qiuhao-add").validate({
		rules:{
			commentdatemin:{
				required:true,
			},
			Qishu:{
				required:true,
			},
			oneRed:{
				required:true,
				min:1,
				max:33,
			},
			twoRed:{
				required:true,
				min:1,
				max:33,
			},
			threeRed:{
				required:true,
				min:1,
				max:33,
			},
			fourRed:{
				required:true,
				min:1,
				max:33,
			},
			fiveRed:{
				required:true,
				min:1,
				max:33,
			},
			sixRed:{
				required:true,
				min:1,
				max:33,
			},
			Blue:{
				required:true,
				min:1,
				max:16,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "${pageContext.request.contextPath}/kaijiang.do?p=updatekaijiang" ,
				success: function(data){
					layer.msg('修改成功!',{icon:6,time:1000});
					setTimeout(function(){window.parent.location.reload();},1000);

				},
                error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('error!',{icon:2,time:1000});
				}
			});
		}
	
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
