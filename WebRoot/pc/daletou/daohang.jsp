<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>易乐智能选号系统导航栏</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/daohang.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/justified-nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" />
</head>
<style type="text/css">
li{
		background-color: #1692DC;
	}
	a{
		color: white;
		outline: none;
	}
	
	.nav > li > a:hover, .nav > li > a:focus{
	background-color:#1682CA ;
	}
	a:hover, a:focus{
	color:white;
	}
</style>
<body>
	<div id="main">
        <div class="container">
        <ul class="nav nav-justified">
                         <li><a href="${pageContext.request.contextPath}/main.jsp" target="top">首页</a></li>
                         <li><a href="${pageContext.request.contextPath}/pc/daletou/daletou.jsp" target="zh">前区走势</a></li>
                         <li><a href="${pageContext.request.contextPath}/pc/daletou/wszs.jsp" target="zh">尾数走势</a></li>
						 <li><a href="${pageContext.request.contextPath}/pc/daletou/qujianzoushi.jsp" target="zh">区间走势</a></li>
						 <li><a href="${pageContext.request.contextPath}/pc/daletou/weizhizoushi.jsp"  target="zh">位置走势</a></li>
						 <li><a href="${pageContext.request.contextPath}/pc/daletou/houquzoushi.jsp"  target="zh">后区走势</a></li>
						 <li><a href="${pageContext.request.contextPath}/pc/yonghudenglu/denglu.jsp"  target="_top">个人中心</a></li> 
				</ul>  
      </div>
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/flexible.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/iscroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/navbarscroll.js"></script>
<script type="text/javascript">
window.onload = function(){ 
	var name = "${sessionScope.userinfo.usersName}" ;
	if (name!=null & name.length>0) {
	　  $("#denglu").attr("href","${pageContext.request.contextPath}/userinfo.do?p=zhuxiao")
	   $("#denglu").text("注销")
	}
	else{
		  $("#denglu").attr("href","${pageContext.request.contextPath}/pc/yonghudenglu/denglu.jsp")
		  $("#denglu").text("立即登录")
	}
	
	} 
</script>
<script type="text/javascript">
$(function(){
	
	//demo示例一到四 通过lass调取，一句可以搞定，用于页面中可能有多个导航的情况
	$('.wrapper').navbarscroll();
	//demo示例六 通过id调取
	$('#demo06').navbarscroll({
		defaultSelect:3,
		scrollerWidth:6,
		fingerClick:1,
		endClickScroll:function(obj){
			console.log(obj.text())
		}
	});
});


</script>


</body>
</html>