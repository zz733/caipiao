<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
<style>
	.ptext{
		width:15em;
		display: block;
		white-space: nowrap;
		overflow: hidden;
		text-overflow:ellipsis;
		margin-left: 16%;
	}
</style>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户管理</title>
</head>
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<body>
<form  action="${pageContext.request.contextPath}/order.do?p=finOrder" method="post" autocomplete="off"  >
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span> 所有订单 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;" 
		name="beginDate" value="${param.beginDate}"  placeholder="  年-月-日">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;" 
		name="endDate" value="${param.endDate}" placeholder="  年-月-日">
		<input type="text" class="input-text" style="width:250px" placeholder="输入用户名称" id="" name="usersName" value="${param.usersName }">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
</form>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="8">所有订单</th>
			</tr>
			<tr class="text-c">
				<th width="160">订单编号</th>
				<th width="110">用户账号</th>
				<th width="50">总福贝</th>
				<th width="50">总数量</th>
				<th width="220">收货地址</th>
				<th width="130">下单时间</th>
				<th width="50">订单状态</th>
				<th width="40">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${map.list}" var="m">
			<tr class="text-c">
				<td>${m.orOrdernumber }</td>
				<td>${m.userinfo.usersName }</td>
				<td>${m.orFubei }</td>
				<td>${m.orTotalnum }</td>
				<td><p class="ptext">${m.address.adDetail }</p></td>
				<td><fmt:formatDate value="${m.orTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td class="td-status">
					<c:choose>
						<c:when test="${m.orStatus==0}">
							<span class="label label-success radius">未付款</span>
						</c:when>
						<c:when test="${m.orStatus==1}">
							<span class="label label-success radius">已付款</span>
						</c:when>
						<c:when test="${m.orStatus==2}">
							<span class="label label-success radius">待发货</span>
						</c:when>
						<c:when test="${m.orStatus==3}">
							<span class="label label-success radius">已发货</span>
						</c:when>
						<c:when test="${m.orStatus==4}">
							<span class="label label-success radius">已完成</span>
						</c:when>
					</c:choose>
				</td>
				<td class="td-manage">
				<a title="详情" href="${pageContext.request.contextPath }/Orderdetail.do?p=getOrderdetailByorId&orId=${m.orId}" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a>
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
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 5, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
	});
});
/*订单状态-启用 */
function orders_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="${pageContext.request.contextPath}/order.do?p=updateStatus&id=${m.orId}" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}
/*订单状态-停用*/
function orders_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.post({
			
		})
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="${pageContext.request.contextPath}/order.do?p=updateStatus&id=${m.orId}" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!', {icon: 6,time:1000});
	});
}

</script> 
</body>
</html>