<%@page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@page import="com.util.SmsUtil"%>
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
<title>我的桌面</title>
</head>
<% if (session.getAttribute("admin")==null) response.sendRedirect("login.jsp");%>
<body>
<div class="page-container">
	<p class="f-20 text-success">欢迎使用易乐智能彩票选号系统<span class="f-14">v1.0</span>后台管理</p>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th colspan="6" scope="col">信息统计</th>
			</tr>
			<tr class="text-c">
				<th>统计</th>
				<th>普通用户</th>
				<th>会员</th>
				<th>待发货数量</th>
				<th>福贝兑换数量</th>                            
				<th>提现申请</th>
			</tr>
		</thead>
		<tbody>
			
			<tr class="text-c">
				<td>今日</td>
				<td>${tjmap.udsum}</td>
				<td>${tjmap.vipudsum}</td>
				<td>${tjmap.odsum}</td>
				<td>${tjmap.daiodsum}</td>
				<td>${tjmap.daytxapplysum}</td>
			</tr>
			<tr class="text-c">
				<td>昨日</td>
				<td>${tjmap.useryestersum}</td>
				<td>${tjmap.vipuseryestersum}</td>
				<td>${tjmap.orderyestersum}</td>
				<td>${tjmap.daioyestersum}</td>
				<td>${tjmap.yesterdaytxapplysum}</td>
			</tr>
			<tr class="text-c">
				<td>本月</td>
				<td>${tjmap.usermonthsum}</td>
				<td>${tjmap.vipusermonthsum}</td>
				<td>${tjmap.ordermonthsum}</td>
				<td>${tjmap.daiomsum}</td>
				<td>${tjmap.monthtxapplysum}</td>
			</tr>
			<tr class="text-c">
				<td>总数</td>
				<td>${tjmap.usersum}</td>
				<td>${tjmap.vipusersum}</td>
				<td>${tjmap.daiordersum}</td>
				<td>${tjmap.ordersum}</td>
				<td>${tjmap.txapplysum}</td>
			</tr>
		</tbody>
	</table>
	<table class="table table-border table-bordered table-bg mt-20">
		<thead>
			<tr>
				<th colspan="2" scope="col">短信通知信息</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">短信通知剩余条数</th>
				<td><span id="lbServerName">${tjmap.msg}</span></td>
			</tr>
			<tr>
				<td>购买地址</td>
				<td><a herf="http://253.com">http://253.com</a></td>
			</tr>
			<tr>
				<td>账号</td>
				<td><%=SmsUtil.account %></td>
			</tr>

		</tbody>
	</table>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script> 
<!--此乃百度统计代码，请自行删除-->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<!--/此乃百度统计代码，请自行删除-->
</body>
</html>