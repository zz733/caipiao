<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<title>中奖详情</title>
</head>
  <%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
  <body>
  <div class="page-container">
  	
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="7">中奖详情</th>
			</tr>
			<tr class="text-c">
			
				<th width="130">竞猜详情订单号</th>
				<th width="80">竞猜类型</th>
				<th width="80">竞猜值</th>
				<th width="80">竞猜数量</th>
				<th width="80">赔率</th>
				<th width="80">是否中奖</th>
				<th width="80">中奖福贝</th>
				
			</tr>
		</thead>
		<tbody>
		<tbody>
		<c:forEach items="${xiangqingmap.list}" var="cz" varStatus="i" >
			<tr class="text-c">
				<td>${cz.jcodId}</td>				
				<td class="td-status">
					<c:choose>
						<c:when test="${cz.jcodType==1}">
							<span class="label label-success radius">单双大小</span>
						</c:when>
						<c:when test="${cz.jcodType==2}">
							<span class="label label-success radius">单双大小</span>
						</c:when>
						<c:when test="${cz.jcodType==3}">
							<span class="label label-success radius">余数</span>
						</c:when>
						<c:when test="${cz.jcodType==4}">
							<span class="label label-success radius">球号</span>
						</c:when>
					</c:choose>
				</td>
				<td>${cz.jcodValue}</td>
				<td>${cz.jcodNum}</td>
				<td>${cz.jcodCost}</td>
				<td class="td-status">
					<c:choose>
						<c:when test="${cz.jcodWinning==0}">
							<span class="label label-danger radius">未中奖</span>
						</c:when>
						<c:when test="${cz.jcodWinning==1}">
							<span class="label label-success radius">中奖</span>
						</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${cz.jcodWinning==1}">
							${cz.jcodCost*1*cz.jcodNum*1}
						</c:when>
						<c:when test="${cz.jcodWinning==0}">
							未中奖
						</c:when>
					</c:choose>
				</td>
			</tr>
		</c:forEach>

		
		</tbody>
	</table>
	
	
	</div>
	
  </body>
</html>
