<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/admin/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/admin/static/h-ui.admin/skin/default/skin.css"
			id="skin" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/style.css" />
		<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
		<title>新增预测</title>
	</head>
	<style>
input.valid {
	background-color: #fff;
	border-color: #32bc61;
	color: black;
}

label.valid {
	width: 16px;
	height: 16px;
	background: url(../img/sucess.png) no-repeat;
	margin-top: 2px;
}
</style>
	<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
	<body>
		<article class="page-container">
		<form action="/" method="post" class="form form-horizontal"
			id="form">


			<div class="row cl">
				<label style="width: 9%"
					class="form-label col-xs-5 col-sm-1 col-xs-offset-5 col-sm-offset-1">
					<span class="c-red"></span>彩票类型：
				</label>
				<div class="formControls col-xs-9 col-sm-3">
					<span class="select-box"> <select class="select"  id="type"
							name="type" size="1">
							<c:forEach items="${list}" var="t">
								<option ${t.id==yuche.id?"selected":"" }  value="${t.id}">
									${t.name }
								</option>
							</c:forEach>
						</select> </span>
				</div>
				
			</div>

			<div class="row cl">
				<label style="width: 9%"
					class="form-label col-xs-5 col-sm-1 col-xs-offset-5 col-sm-offset-1">
					<span class="c-red">*</span>期号：
				</label>
				<div class="formControls col-xs-8 col-sm-3">
					<input type="text" class="input-text" autocomplete="off"
						placeholder="" name="qihao" id="qihao" value="${yuche.caipiaoQishu}">
				</div>
				<label class="formControls col-xs-4 col-sm-4">
					<span id="msg"></span>
				</label>
			</div>
			
			<div class="row cl">
				<label style="width: 9%"
					class="form-label col-xs-5 col-sm-1 col-xs-offset-5 col-sm-offset-1">
					<span class="c-red">*</span>标题：
				</label>
				<div class="formControls col-xs-8 col-sm-3">
					<input type="text" class="input-text" autocomplete="off"
						placeholder="" name="title" id="title">
				</div>
				<label class="formControls col-xs-4 col-sm-4">
					<span id="msg"></span>
				</label>
			</div>
			

			<div class="row cl">
				<label
					class="form-label col-xs-5 col-sm-1 col-xs-offset-5 col-sm-offset-1"
					style="width: 9%">
					<span class="c-red">*</span>开奖时间:
				</label>
				<div class="formControls col-xs-4 col-sm-4">
					<input type="text"
					    readonly="readonly"
					    value="${yuche.kaijiangTime}"
						onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss'})"
						id="kaijiangtime" name="kaijiangtime" class="input-text Wdate" />


				</div>
			</div>


			<div class="row cl">
				<label
					class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1"
					style="width: 9%">
					<span class="c-red">*</span>预测详情:
				</label>
				<div class="formControls col-xs-8 col-sm-9">
					<script id="editor" name="detail" type="text/plain"
						style="width:100%;height:400px;">
						   ${yuche.neirong}
						</script>
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-5 col-sm-offset-5">
					<input class="btn btn-primary radius" type="button" id="button"
						value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				</div>
			</div>
		</form>
		</article>






		<!--_footer 作为公共模版分离出去-->
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
		<!--/_footer /作为公共模版分离出去-->

		<!--请在下方写此页面业务相关的脚本-->
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
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


$(function(){

	 ue = UE.getEditor("editor", {
		autoHeightEnabled : false,
		scaleEnabled:false,
	});
});	



$("#button").click(function(){
    // var formData = $("#form").serialize();
    var qihao = $("#qihao").val();
     if (qihao=="")
     {
         layer.msg("请输入 期号!",{icon:6,time:1000});
         return false;
     }
     
      var title = $("#title").val();
      if (title=="")
     {
         layer.msg("请输入标题!",{icon:6,time:1000});
         return false;
     }
     
     var kaijiangtime = $("#kaijiangtime").val();
      if (kaijiangtime=="")
     {
         layer.msg("请输入开奖时间!",{icon:6,time:1000});
         return false;
     }
     
     var content = ue.getContent();
     if (content=="")
     {
         layer.msg("请输入内容",{icon:6,time:1000});
         return false;
     }
     
     var url = "${pageContext.request.contextPath}/yucheBack.do?p=update";
     var data = {qihao:qihao,content:content,kaijiangtime:kaijiangtime,type:$("#type").val(),id:${yuche.id},title:title};
     var callback = function(data)
     {
        if (data=="success")
        {
            layer.msg("修改成功",{icon:6,time:1000});
        }
        else
        {
            layer.msg("期号已存在",{icon:6,time:1000});
        }
     }
     $.post(url,data,callback);
});

		
</script>
	</body>
</html>