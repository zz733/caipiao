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
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
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


<link href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/pc/css/htmleaf-demo.css">

<link href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/pc/css/style.css"
	type="text/css" rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/pc/css/nprogress.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/pc/css/htmleaf-demo.css">

<link href="${pageContext.request.contextPath}/pc/css/bdingwx.css">
<link href="${pageContext.request.contextPath}/pc/css/signin.css"
	rel="stylesheet">
<style>
#header {
	width: 100%;
	height: 50px;
	background: #1692DC;
	padding-top: 5px;
	padding: 10 30px;
	margin-top: -11px;
}

#header span {
	margin: 0px 200px;
	/*margin-top: 100px;*/
	font-size: 24px;
	font-family: "楷体";
	color: white;
}

.logo {
	margin-top: -10px;
}
</style>


</head>

<body style="width:100%;margin:0 auto;">

<section class="container user-select">
		<header>
			<div class="hidden-xs header">
			
				<!--超小屏幕不显示-->
				<h1 class="logo">

				<a href="#" >
					<img src="" style="width:190px;height:50px;"/>
					</a>
					
					
				</h1>
				
				<ul class="nav hidden-xs-nav">
					<li class="active"><a href="${pageContext.request.contextPath }/userinfo.do?p=gerenxinxi"><span
							class="glyphicon glyphicon-user"></span>个人信息</a></li>
					<li><a href="${pageContext.request.contextPath}/userinfo.do?p=findByUsid&id=${userinfo.usersId}"><span
							class="glyphicon glyphicon-tags"></span>绑定支付宝</a></li>
					<li><a href="${pageContext.request.contextPath}/weixinguanzhu.do?w=idandUrltoT2D"><span
							class="glyphicon glyphicon-tags"></span>绑定微信</a></li>
					<li><a href="${pageContext.request.contextPath}/address.do?p=getAll"><span
							class="glyphicon glyphicon-tags"></span>管理收获地址</a></li>
					<li><a href="${pageContext.request.contextPath }/shiyong.do?p=FindByIdduihuan"><span class="glyphicon glyphicon-tags"></span>商品兑换记录</a></li>			
					<li><a href="${pageContext.request.contextPath }/shiyong.do?p=FindByIdjcjl&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝使用记录</a></li>
					<li><a href="${pageContext.request.contextPath }/chongzhi.do?p=FindByIdchongzhirecord&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝充值记录</a></li>
					<li><a href="${pageContext.request.contextPath }/tixian.do?p=Alltixianrecord"><span class="glyphicon glyphicon-tags"></span>福贝提现记录</a></li>
				</ul>
			</div>
			<!--/超小屏幕不显示-->
			<div class="visible-xs header-xs">
				<!--超小屏幕可见-->
				<div class="navbar-header header-xs-logo">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#header-xs-menu"
						aria-expanded="false" aria-controls="navbar">
						<span class="glyphicon glyphicon-menu-hamburger"></span>
					</button>
				</div>
				<div id="header-xs-menu" class="navbar-collapse collapse">
					<ul class="nav navbar-nav header-xs-nav">
						<li class="active"><a href="${pageContext.request.contextPath }/userinfo.do?p=gerenxinxi"><span
							class="glyphicon glyphicon-user"></span>个人信息</a></li>
					<li><a href=""><span class="glyphicon glyphicon-home"></span>福贝</a></li>
					<li><a href="${pageContext.request.contextPath}/userinfo.do?p=findByUsid&id=${userinfo.usersId}"><span
							class="glyphicon glyphicon-tags"></span>绑定支付宝</a></li>
					<li><a href="${pageContext.request.contextPath}/weixinguanzhu.do?w=idandUrltoT2D"><span
							class="glyphicon glyphicon-tags"></span>绑定微信</a></li>
					<li><a href="${pageContext.request.contextPath}/address.do?p=getAll"><span
							class="glyphicon glyphicon-tags"></span>管理收获地址</a></li>
					<li><a href="${pageContext.request.contextPath }/shiyong.do?p=FindByIdduihuan"><span class="glyphicon glyphicon-tags"></span>商品兑换记录</a></li>			
					<li><a href="${pageContext.request.contextPath }/shiyong.do?p=FindByIdjcjl&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝使用记录</a></li>
					<li><a href="${pageContext.request.contextPath }/chongzhi.do?p=FindByIdchongzhirecord&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝充值记录</a></li>
					<li><a href="${pageContext.request.contextPath }/tixian.do?p=Alltixianrecord" ><span class="glyphicon glyphicon-tags"></span>福贝提现记录</a></li>
					</ul>
					<form class="navbar-form" action="search.php" method="post"
						style="padding:0 25px;">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="请输入关键字">
							<span class="input-group-btn">
								<button class="btn btn-default btn-search" type="submit">搜索</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</header>
	
	


 <div id=header><span>福贝提现记录</span></div>
<div class="page-container mt-20"  style="width:80%;margin-left:200px;">
 <div style="">
<form action="${pageContext.request.contextPath}/tixian.do?p=Alltixianrecord" method="post" name="f" id="f"  autocomplete="off">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" name="mintime" value="${param.mintime}" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" name="maxtime" value="${param.maxtime}" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入用户名称"  name="usersName" value="${param.usersName}" />
		<input type="hidden" name="page" id="page" value="1"/>
		<button type="submit" class="btn btn-primary"><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"  > <span class="l"></span> <span class="r">共有数据：<strong>
		<c:choose>
			<c:when test="${empty tixianjilumap.sum}">
				0
			</c:when>
			<c:when test="${not empty tixianjilumap.sum}">
				${tixianjilumap.sum}
			</c:when>
		</c:choose>
	</strong> 条</span> 
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="9">提现记录</th>
			</tr>
			<tr class="text-c">
			    <th width="60">序号</th>
				<th width="80">用户名称</th>
				<th width="120">用户账号</th>
				<th width="80">提现金额</th>
				<th width="140">提现单号</th>
				<th width="170">提现时间</th>
				<th width="130">提现账号</th>
				<th width="60">提现类型</th>
				<th width="80">提现状态</th>
			</tr>
		</thead>
		<tbody>

		<c:forEach items="${tixianjilumap.list}" var="cz" varStatus="i" >
			<tr class="text-c">
				<td>${i.index+1}</td>
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
				<td class="td-status">	
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
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
	</div>
	
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
		"aaSorting": [[ 5, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,1,6,7]}// 制定列不参与排序
		]
	});
	
});




</script>
</body>
</html>
