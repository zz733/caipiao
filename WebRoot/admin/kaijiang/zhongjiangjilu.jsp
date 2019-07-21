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
<title>竞猜记录</title>
</head>
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 开奖管理 <span class="c-gray en">&gt;</span> 竞猜记录 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<form action="${pageContext.request.contextPath}/kaijiang.do?p=zhongjiangjilu" method="post" name="f" id="f" autocomplete="off">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" name="mintime" value="${param.mintime}" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" name="maxtime" value="${param.maxtime}" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入用户名称"  name="usersName" value="${param.usersName}" />
		<button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"></span> <span class="r">共有数据：<strong>
		<c:choose>
			<c:when test="${empty zhongjiangmap.sum}">
				0
			</c:when>
			<c:when test="${not empty zhongjiangmap.sum}">
				${zhongjiangmap.sum}
			</c:when>
		</c:choose>
	</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="8">竞猜记录</th>
			</tr>
			<tr class="text-c">
			
				<th width="40">序号</th>
				<th width="100">用户名称</th>
				<th width="90">用户账号</th>
				<th width="80">竞猜期数</th>
				<th width="130">竞猜时间</th>
				<th width="130">竞猜订单号</th>
				<th width="80">竞猜福贝</th>
				<th width="80">操作</th>
				
				
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${zhongjiangmap.list}" var="cz" varStatus="i" >
			<tr class="text-c">
				<td>${i.index+1}</td>
				<td>${cz.userinfo.usersName}</td>
				<td>${cz.userinfo.usersPhone}</td>
				<td>${cz.jcQishu}</td>
				<td><fmt:formatDate value="${cz.jcTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${cz.jcNumber}</td>
				<td>${cz.jcFubei}</td>
				<td class="td-manage">
				<a title="详情" href="javascript:;" onclick="ckxiangqing('中奖详情','${pageContext.request.contextPath}/kaijiang.do?p=zhongjiangxiangqing&id='+'${cz.jcId}','${cz.jcId}','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">查看详情</i></a> 
				</td>
			</tr>
		</c:forEach>
		</tbody>
		
		
	</table>
	</div>
	
	</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

/* JQuery自带的分页查询*/
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 4, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[2,5,6,7]}// 制定列不参与排序
		]
	});
});


/*查看详情*/
function ckxiangqing(title,url,id,w,h){
		layer_show(title,url,w,h);
}


</script>
</body>
</html>

