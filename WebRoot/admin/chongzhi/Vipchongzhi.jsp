<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>会员充值记录</title>
</head>
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 充值管理 <span class="c-gray en">&gt;</span> 会员充值记录 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<form action="${pageContext.request.contextPath}/rechargerecord.do?p=Allviprecord" method="post" name="f" id="f" autocomplete="off">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" name="mintime" value="${param.mintime}" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" name="maxtime" value="${param.maxtime}" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入用户名称"  name="usersName" value="${param.usersName}" />
		<input type="hidden" name="page" id="page" value="1"/>
		<button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"></span> <span class="r">共有数据：<strong>
		<c:choose>
			<c:when test="${empty viprecordmap.sum}">
				0
			</c:when>
			<c:when test="${not empty viprecordmap.sum}">
				${viprecordmap.sum}
			</c:when>
		</c:choose>
	</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="9">会员充值记录</th>
			</tr>
			<tr class="text-c">
			
				<th width="40">序号</th>
				<th width="120">用户名称</th>
				<th width="90">用户账号</th>
				<th width="130">会员充值时间</th>
				<th width="100">充值金额</th>
				<th width="100">会员开通时长/天</th>
				<th width="100">赠送福贝</th>
				<th width="80">充值方式</th>
				<th width="130">充值订单号</th>
				
				
				
			</tr>
		</thead>
		<tbody>

		<c:forEach items="${viprecordmap.list}" var="cz" varStatus="i" >
			<tr class="text-c">
				<td>${cz.vipId}</td>
				<td>${cz.userinfo.usersName}</td>
				<td>${cz.userinfo.usersPhone}</td>
				<td><fmt:formatDate value="${cz.vipTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><span class="label label-danger radius">
				<fmt:formatNumber value="${cz.vipCost}" pattern="0.0"></fmt:formatNumber>元</span>
				</td>
				<td><span class="label label-danger radius">
				<fmt:formatNumber value="${cz.vipDay}" pattern="0.0"></fmt:formatNumber>天</span>
				</td>
				<td><span class="label label-danger radius">
				<fmt:formatNumber value="${cz.vipFubei}" pattern="0.0"></fmt:formatNumber>福贝</span>
				</td>
				<td class="td-status">
					<c:choose>
						<c:when test="${cz.vipCztype==0}">
							<span class="label label-success radius">支付宝</span>
						</c:when>
						<c:when test="${cz.vipCztype==1}">
							<span class="label label-success radius">微信</span>
						</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${not empty cz.vipZfbdingdan}">
							${cz.vipZfbdingdan}
						</c:when>
						<c:when test="${not empty cz.vipWxdingdan}">
							${cz.vipWxdingdan}
						</c:when>
					</c:choose>
				</td>
				
			</tr>
		</c:forEach>
		
		</tbody>
	</table>
	</div>
	<!--  
	<c:if test="${not empty viprecordmap.list}" var="f">
	<td>
				当前${viprecordmap.page}/${viprecordmap.count}页,共${viprecordmap.sum}条
				<c:if test="${viprecordmap.page>1}">
					<a href="javascript:fenye(${viprecordmap.page-1})">上一页</a>
				</c:if>
				
				<c:set var="left" value="${viprecordmap.page-5<1 ? 1 : viprecordmap.page-5 }"></c:set>
				<c:set var="right" value="${left+9>viprecordmap.count ? viprecordmap.count :left+9 }"></c:set>
				
				<c:forEach begin="${left}" end="${right}" var="x">
					<a href=javascript:fenye(${x})>${x} &nbsp;</a>
				</c:forEach>
				
				<c:if test="${viprecordmap.page<viprecordmap.count }">
					<a href="javascript:fenye(${viprecordmap.page+1})">下一页</a>
				</c:if>
	</td>
	</c:if>
	-->
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
/*
function fenye(p){
	
//	location = "${pageContext.request.contextPath}/rechargerecord.do?p=Allviprecord&page="+p+"&size=1";
	document.getElementById("page").value=p;
	document.getElementById("f").submit();	
}
*/

/* JQuery自带的分页查询*/
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 3, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[6,7,8]}// 制定列不参与排序
		]
	});
	
});


</script>
</body>
</html>
