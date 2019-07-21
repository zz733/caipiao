<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<style>
.ptext {
	width: 15em;
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-left: 16%;
}
</style>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>大乐透管理</title>
</head>
<%
	if (session.getAttribute("admin") == null)
		response.sendRedirect("../login.jsp");
%>
<body>
	<form id="f"
		action="${pageContext.request.contextPath}/qianquzoushi3d.do?p=fenye"
		method="post" autocomplete="off">
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			大乐透管理 <span class="c-gray en">&gt;</span> 大乐透数据 </a>
		</nav>
		<div class="page-container">
			<div class="text-c">

				<input type=hidden id="page" name="page" value="1" /> <input
					type="text" class="input-text" style="width: 250px"
					placeholder="输入期号" id="qishu" name="kjQishu"
					value="${param.qqzsQishu}">
				<button type="submit" class="btn btn-success radius" id="" name="">
					<i class="Hui-iconfont">&#xe665;</i> 搜索
				</button>
			</div>
	</form>

	<div class="cl pd-5 bg-1 bk-gray mt-20">

		<span class="l"> <a href="javascript:;"
			onclick="qiuhao_add('球号入库','${pageContext.request.contextPath}/qianquzoushi3d.do?p=getMaxQishu','800','550')"
			class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
				球号入库</a>
		</span> <span class="r">共有数据：<strong> <c:choose>
					<c:when test="${empty map.sum}">
				0
			</c:when>
					<c:when test="${not empty map.sum}">
				${map.sum}
			</c:when>
				</c:choose>
		</strong> 条
		</span>
	</div>

	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="11">大乐透数据</th>
				</tr>
				<tr class="text-c">
					<th width="30">编号</th>
					<th width="50">期数</th>
					<th width="50">开奖时间</th>
					<th width="40">红球1</th>
					<th width="40">红球2</th>
					<th width="40">红球3</th>
					<th width="40">红球4</th>
					<th width="40">红球5</th>
					<th width="40">蓝球1</th>
					<th width="40">蓝球2</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${map.list}" var="m">
					<tr class="text-c">
						<td>${m.id }</td>
						<td>${m.qishu }</td>
						<td>${m.time}</td>
						<td>${m.qiu1}</td>
						<td>${m.qiu2}</td>
						<td>${m.qiu3}</td>
						<td>${m.qiu4}</td>
						<td>${m.qiu5}</td>
						<td>${m.blue1}</td>
						<td>${m.blue2}</td>

						<td class="td-manage"><a title="编辑"
							_href="${pageContext.request.contextPath }/yucheBack.do?p=unzongjiang&id=${m.id}"
							onclick="qiuhao_update('编辑','${pageContext.request.contextPath}/qianquzoushi3d.do?p=toEdit&id=${m.id}','800','550')"
							class="ml-5" style="text-decoration: none"><i
								class="btn btn-success">编辑</i> </a> <a title="删除"
							_href="${pageContext.request.contextPath }/kaijiang3d.do?p=del&id=${m.id}"
							onclick="del(${m.id},this)" class="ml-5"
							style="text-decoration: none"><i class="btn btn-success">删除</i>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="6"><img src="../images/spacer.gif" width="1"
					height="1" /></td>
			</tr>
			<tr>
				<td height="33">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="right-font08">
						<tr>
							<td width="50%">第 <span class="right-text09">${ map.page}</span>
								页 | 共 <span class="right-text09">${map.count }</span> 页
							</td>
							<td width="32%" align="right">[ <a href="javascript:go(1)"
								class="right-font08">首页</a> | <c:if test="${map.page>1}">
									<a href="javascript:go(${map.page-1 })" class="right-font08">上一页</a> |   </c:if>

								<c:if test="${map.page<map.count}">
									<a href="javascript:go(${map.page+1})" class="right-font08">下一页</a>   | </c:if>
								<a href="javascript:go(${map.count })" class="right-font08">末页</a>
								] 转至：
							</td>
							<td width="5%">
								<table width="20" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="1%"><input name="textfield3" type="text"
											id="page2" value="${map.page}" class="right-textfield03"
											size="3" /></td>
										<td width="87%"></td>
										<td width="87%"><input name="Submit23222" type="submit"
											value="GO" onclick=go(document.getElementById('page2').value);/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
	function go(p) {
		$("#page").val(p);
		$("#f")[0].submit();
	}

	/*球号入库*/
	function qiuhao_add(title, url, w, h) {
		layer_show(title, url, w, h);
	}
	
	/*编辑*/
	function qiuhao_update(title, url, w, h) {
		layer_show(title, url, w, h);
	}
	

	function _change(a, id, status) {

		var url = "${pageContext.request.contextPath }/yucheOrder.do?p=unzongjiang";//未中奖
		if (status == true)
			url = "${pageContext.request.contextPath }/yucheOrder.do?p=zongjiang"; //中奖
		var data = {
			id : id
		};
		var callback = function(data) {
			if (data == "false") {
				layer.msg("操作失败", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			location.reload();
		};

		layer.confirm("确认操作", {
			btn : [ '确定', '取消' ],
			title : "提示"
		}, function() {
			$.post(url, data, callback);
		});
	}
	
	function del(id,a)
	{
	   var url  = '${pageContext.request.contextPath }/qianquzoushi3d.do?p=del';
	   var data = {id:id};
	   
	   var callback = function(data) {
			if (data == "false") {
				layer.msg("操作失败", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			else
			{
			   $(a).parent().parent().remove();
			   layer.closeAll('dialog');
			   return true;
			}
			
		};

		layer.confirm("确认删除吗?", {
			btn : [ '确定', '取消' ],
			title : "提示"
		}, function() {
			$.post(url, data, callback);
		});
	   
	}
</script>
</body>
</html>