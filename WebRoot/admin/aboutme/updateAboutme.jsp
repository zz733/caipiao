<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark"
	href="${pageContext.request.contextPath }/admin/favicon.ico">
<link rel="Shortcut Icon"
	href="${pageContext.request.contextPath }/admin/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

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
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<link
	href="${pageContext.request.contextPath}/admin/lib/webuploader/0.1.5/webuploader.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/admin/js/jquery-3.2.1.js"></script>


<body>
	<div class="page-container">
		<div class="row cl">
			<label
				class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1"
				style="width: 9%">
				<span class="c-red">*</span>关于我们:
			</label>
			<div class="formControls col-xs-8 col-sm-9">
				<script id="editor" name="gooddetail" type="text/plain"
					style="width:100%;height:400px;">${content }</script>
			</div>
		</div>


		<div class="row cl" style="margin-top: 10px">
			<div class="col-xs-8 col-sm-9 col-xs-offset-6 col-sm-offset-9">
				<button id="AddBtn" class="btn btn-primary radius">
					<i class="Hui-iconfont">&#xe632;</i> 确定
				</button>

			</div>
		</div>
	</div>
</body>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/js/ajaxfileupload.js"></script>


<script>
	 
	    $(function(){

	var ue = UE.getEditor("editor", {
		autoHeightEnabled : false,
		scaleEnabled:false,
	});
	
	$("#AddBtn").click(function(){
	 	
		var content = ue.getContent();//encodeURIComponent(ue.getContent());// UE.getEditor("editor").getContent();
		
		var url = "${pageContext.request.contextPath}/aboutme.do?p=save";
		var data = {content:content};
		var callback = function()
		{ 
		    layer.msg("编辑成功",{icon:6,time:1000});
		}
		$.post(url,data,callback);
		
	});
	});
	 </script>
