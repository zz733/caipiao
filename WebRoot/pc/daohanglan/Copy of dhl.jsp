<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易乐智能选号系统导航栏</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/daohang.css" />
</head>
<body>
	<div id="main">
		<div class="wrapper wrapper02" id="wrapper02" style="height: 40px;">
	        <div class="scroller">
				<ul class="clearfix">
					    <li><a href="${pageContext.request.contextPath}/pc/hongqiuzoushi/hongqiuzoushitu.jsp" target="zh">红球走势</a></li>
						<li><a href="${pageContext.request.contextPath}/pc/zongheweishu/zhws.jsp"  target="zh">综合尾数</a></li>
						<li><a href="${pageContext.request.contextPath}/pc/qiansanweishu/qsws.jsp" target="zh">前三尾数</a></li>
						<li><a href="${pageContext.request.contextPath}/pc/housanweishu/hsws.jsp" target="zh">后三尾数</a></li>
						<li><a href="${pageContext.request.contextPath}/pc/geweiweishu/gwws.html" target="zh">各位尾数</a></li>
						<li><a href="${pageContext.request.contextPath}/pc/lanqiuzoushi/lqzs.html" target="zh">蓝球走势</a></li>
						<li><a href="${pageContext.request.contextPath}/getgoods.do?p=getAllGoods" target="zh">福贝购物</a></li>
						<li><a href="${pageContext.request.contextPath}/userinfo.do?p=gerenxinxi"  target="zh">个人中心</a></li>
						<li><a id="denglu" href="${pageContext.request.contextPath}/pc/yonghudenglu/denglu.jsp"  target="_top">用户登录</a></li>
						<li><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				</ul>
			</div>
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