<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--_meta 作为公共模版分离出去-->
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
<!--/meta 作为公共模版分离出去-->

<title>修改密码</title>

</head>
<style>
.page-container{
width:460px;
height:250px;
}
input.valid{
background-color: #fff;
border-color: #32bc61;
color: black;
}
label.valid {
    width:16px;
    height:16px;
   background:url(../admin/img/sucess.png) no-repeat ;
   margin-top: 2px;
}
.maindiv{
   margin-top:30px;
}
.txt{
  margin-left:50px;
  margin-top:20px;
}
.input-text{
  margin-left:-45px;
   height: 35px;
   width: 250px;
}
.btn_bc{
   margin-top:40px;
   margin-left:-30px;
}
.btn_qx{
   margin-top:40px;
   margin-left:45px;
}

</style>
<c:if test="${sessionScope.userinfo==null }">
<c:redirect url="${pageContext.request.contextPath }"/>
</c:if>
<% if (session.getAttribute("userinfo")==null) response.sendRedirect("../yonghudenglu/denglu.jsp");%>
<body>
<article class="page-container">
	<form action="/" method="post" class="form form-horizontal" id="form-change-password">
	<div class="maindiv center">
		<div class="row cl">
			<label class="form-label col-xs-3 col-sm-4 center txt">原密码：</label>
			<div class="formControls col-xs-5 col-sm-10">
				<input type="password" class="input-text" autocomplete="off" placeholder="不修改请留空" name="oldPassword" id="oldpassword">
			</div>
			<label class="form-label col-xs-1 col-sm-1">
				<span id="msg"></span> 
			</label>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3 col-sm-4 txt">新密码：</label>
			<div class="formControls col-xs-5 col-sm-10">
				<input type="password" class="input-text" autocomplete="off" placeholder="不修改请留空" name="newpassword" id="newpassword">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-3 col-sm-4 txt">确认密码：</label>
			<div class="formControls col-xs-5 col-sm-10">
				<input type="password" class="input-text" autocomplete="off" placeholder="不修改请留空" name="newpassword2" id="new-password2">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius btn_bc" type="submit" id="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
				<input class="btn btn-danger radius btn_qx" type="submit" id="submit" value="&nbsp;&nbsp;取消&nbsp;&nbsp;">
			</div>
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

//检查原密码是否正确
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
	$("form").validate({
		rules:{
			oldPassword:{
			    required:true,
				minlength:6,
				maxlength:16,
				remote: { 
					url: path+"/yonghuLogin.do?p=Yzpwd",//后台处理程序 
					type: "post", //数据发送方式 
					data: { //要传递的数据 
						password:function() {
							return $("#oldpassword").val();
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
		},
		messages:{
		  oldPassword:"密码不正确"
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				data:{newPassword:$("#new-password2").val()},
				url: path+"/yonghuLogin.do?p=userxiugaipwd",
				success: function(data){
					if (data=="false") {
						var a=layer.confirm("修改失败，旧密码与新密码一致！",{btn:["确定"]},function(){
							layer.close(a);
						});
					}else if(data=="true"){
						 layer.confirm("修改成功，请重新登录！",{btn:["确定"]},function(){
						 window.open("${pageContext.request.contextPath}/pc/yonghudenglu/denglu.jsp","_top")
					}); 
					}else{
						var b=layer.confirm("修改失败，请重新修改！",{btn:["确定"]},function(){
							layer.close(b);
						});
					}
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