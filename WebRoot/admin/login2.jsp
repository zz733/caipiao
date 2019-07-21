<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>易乐智能彩票选号系统后台登录</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/login2.css" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<!--[if lt IE 9]>
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/html5shiv.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/respond.min.js"></script>
		<![endif]-->
		<link href="${pageContext.request.contextPath}/admin/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
		<!--[if IE 6]>
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib//DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
<title>易乐智能彩票选号系统后台登录 - YiLeIntelligence v1.0</title>
	</head>
	<body>
		<div class="main">
			<div class="head">
				<img src="${pageContext.request.contextPath}/admin/static/h-ui/images/logo.png" />
				<span>教育管理系统</span>
			</div>
			<div class="content">
				<img src="${pageContext.request.contextPath}/admin/static/h-ui/images/stu.png" />
				<div class="right">
					<div class="info">
						<p class="tou">用户登录</p>
						  
						<div class="center">
							<form  class="f" id="f">
							<div class="input"><span>用户名:</span><input type="text" class="input-text" style="width: 170px; height: 38px;"  autocomplete="off" placeholder="请输入用户名" name="username" id="username" /></div>
							<div class="input"><span>密&nbsp;&nbsp;&nbsp;码:</span><input type="password" class="input-text" style="width: 170px;  height: 38px;" autocomplete="off" placeholder="请输入密码" name="password" id="password" /></div>
							<div class="input"><span>验证码:</span><input type="text" class="input-text" style="width: 95px; height: 38px;" autocomplete="off" placeholder="请输入验证码" name="yzm" id="yzm"/></div>
							<img id="imgyzm" name="imgyzm"  src="${pageContext.request.contextPath}/yzm.do?p=getCode">
							<button class="btn btn-warning radius" style="width: 230px;" id="btnLogin" type="submit">登录</button>
 							</form>
						</div>
				</div>
				
				</div>
			
			
		</div>

		<div class="wei">深圳光华软件有限公司提供技术支持</div>
		
		
	</body>
</html>

<!--_footer 作为公共模版分离出去-->
 <script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
 <script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/layer/2.4/layer.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/static/h-ui.admin/js/H-ui.admin.js"></script>   
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script> 

<script type="text/javascript">
//验证码看不清
	 $(function(){
         $("#imgyzm").click(function(){
 
        	var timestamp = new Date().getTime();
        	 document.getElementById("imgyzm").src="${pageContext.request.contextPath}/yzm.do?p=getCode&x="+timestamp;
         });
        
   });
   
	$(function() {
		if (window.history && window.history.pushState) {
		$(window).on('popstate', function () {
		window.history.pushState('forward', null, '#');
		window.history.forward(1);
		});
		}
 window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
		window.history.forward(1);
		});
  
</script>
<script type="text/javascript">
$(function(){
	
	$("#f").validate({
		submitHandler:function(form){
			document.getElementById("btnLogin").innerHTML="正在登录...";
			$(form).ajaxSubmit({
				type: 'post',
				url: "${pageContext.request.contextPath}/adminlogin.do?p=login",
				success: function(data){
					switch(data)
	                 { 
	                   case "1":
	                      top.location = "${pageContext.request.contextPath}/admin/index.jsp";
	                      break;
	                   case "-1":
	                	   document.getElementById("btnLogin").innerHTML="登录";
	                	   document.getElementById("yzm").value="";
	                	   document.getElementById("imgyzm").src="${pageContext.request.contextPath}/yzm.do?p=getCode&x="+timestamp;
	                      layer.alert("验证码错误");
	                      break;
	                   case "-2":
	                	   document.getElementById("btnLogin").innerHTML="登录";
	                	   var timestamp = new Date().getTime();
	                  	 document.getElementById("imgyzm").src="${pageContext.request.contextPath}/yzm.do?p=getCode&x="+timestamp;
	                      layer.alert("用户名或密码错误");
	                     break;
	                   case "0":
	                	   document.getElementById("btnLogin").innerHTML="登录";
	                	   var timestamp = new Date().getTime();
	                  	 document.getElementById("imgyzm").src="${pageContext.request.contextPath}/yzm.do?p=getCode&x="+timestamp;
	                      layer.alert("该账号已被注销请联系超级管理员");
	                     break;   
	                 }
				},
                error: function(XmlHttpRequest, textStatus, errorThrown){
					    alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
				}
			});

		}
	});
});
</script>


