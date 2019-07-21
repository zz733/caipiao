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
<title>所有提现记录</title>
</head>
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<body>

<form action="${pageContext.request.contextPath}/tixianrecord.do?p=Allshenqingrecord" method="post" name="f" id="f" autocomplete="off">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 提现管理
 <span class="c-gray en">&gt;</span> 提现申请 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
  href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin"
		 name="mintime" value="${param.mintime}" class="input-text Wdate" style="width:120px;">
		-
		<input  type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" 
		name="maxtime" value="${param.maxtime}" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入用户名称" name="usersName" value="${param.usersName}">
		<input type="hidden" name="page" id="page" value="1"/>
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
		</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="r">共有数据：<strong>
		<c:choose>
			<c:when test="${empty tixianshenqingmap.sum}">
				0
			</c:when>
			<c:when test="${not empty tixianshenqingmap.sum}">
				${tixianshenqingmap.sum}
			</c:when>
		</c:choose>
	</strong> 条</span> </div>
		<div class="mt-20">

	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="11">提现申请</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" id="allcheck" name="" value=""></th>
				<th width="40">序号</th>
				<th width="100">用户名称</th>
				<th width="90">用户账号</th>
				<th width="80">提现金额</th>
				<th width="180">提现单号</th>
				<th width="130">提现申请时间</th>
				<th width="120">提现账号</th>
				<th width="50">提现类型</th>
				<th width="50">提现状态</th>
				<th width="50">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${tixianshenqingmap.list}" var="cz" varStatus="i" >
			<tr class="text-c">
				<td><input  name="check" type="checkbox" value="${cz.wrId}"></td>
				<td>${cz.wrId}</td>
				<td>${cz.userinfo.usersName}</td>
				<td>${cz.userinfo.usersPhone}</td>
				<td><span class="label label-danger radius">
				<fmt:formatNumber value="${cz.wrMoney}" pattern="0.00"></fmt:formatNumber>元</span>
				</td>
				<td>${cz.wrDingdanhao}</td>
				<td><fmt:formatDate value="${cz.wrTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					
				<td>
					<c:choose>
						<c:when test="${not empty cz.wrZhifubao}">
							${cz.wrZhifubao}
						</c:when>
						<c:when test="${not empty cz.wrWeiXin}">
							${cz.wrWeiXin}
						</c:when>
					</c:choose>
				</td>
				<td class="td-status">
					<c:choose>
						<c:when test="${cz.wrTxtpye==0}">
							<span class="label label-success radius">支付宝</span>
						</c:when>
						<c:when test="${cz.wrTxtpye==1}">
							<span class="label label-success radius">微信</span>
						</c:when>
					</c:choose>
				</td>
				<td class="td-status" id="td-status">	
					<c:choose>
						<c:when test="${cz.wrStatus==0}">
							<span class="label label-warning radius">申请中 </span>
						</c:when>
						<c:when test="${cz.wrStatus==1}">
							<span class="label label-danger radius">失败</span>
						</c:when>
						<c:when test="${cz.wrStatus==2}">
							<span class="label label-success radius">成功</span>
						</c:when>
					</c:choose>
				</td>
			
				<td class="td-manage"><a style="text-decoration:none" onclick="dakuan('打款','${pageContext.request.contextPath}/tixianrecord.do?p=findBywrid&id='+'${cz.wrId}','${cz.wrId}','800','500')" href="javascript:;" title="审核">审核</a></td>
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
		"aaSorting": [[ 6, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable" : false,
			"aTargets" : [0,8,9,10]}// 制定列不参与排序
		]
	});
});

/*查看详情*/
function dakuan(title,url,id,w,h){
		layer_show(title,url,w,h);
}

/*审核*/
 
 /*
function tixian_start(obj,id){

	layer.confirm('是否通过审核吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/tixianrecord.do?p=UpdateTxStatus&id='+id,
			success: function(data){
				//此处请求后台程序，下方是成功后的前台处理……	
				$(obj).parents("tr").find(".td-manage").prepend('已审核');
				$(obj).parents("tr").find("#td-status").html('<span class="label label-success radius">已审核</span>');
				$(obj).remove();
				layer.msg('已审核!', {icon: 6,time:1000});
				setTimeout(function(){location.replace(location.href);},1000);
		    	 
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
		
		
	});
}
*/

/* 批量审核*/
/*
function plshenpi()
{
var checkboxNum=$("input[name=check]:checked").length;
if(checkboxNum==0)
{
	layer.msg("请勾选要审批的申请",{icon:6,time:1000});
	return false;
}
var checkboxList=new Array();
$("input[name=check]:checked").each(function(){
	checkboxList.push($(this).val());	//往数组里添加当前checked属性的值
});
layer.confirm("确定要审批吗",function(index){
	$.ajax({
	url:"${pageContext.request.contextPath}/tixianrecord.do?p=MostupdateWrStatus",
	type:"post",
	data:{'wrid':checkboxList.toString(),},
	success:function(){
		layer.msg('已审核!', {icon: 6,time:1000});
		setTimeout(function(){location.replace(location.href);},1000);
	}
});
});
}
*/
</script>
</body>
</html>
