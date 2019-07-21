<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>

<style>
	.ptext{
		width:7em;
		white-space: nowrap;
		overflow: hidden;
		text-overflow:ellipsis;
		margin-left: 35%;
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
<title>用户管理</title>
</head>
<body>
	<form
		action="${pageContext.request.contextPath}/goods.do?p=findGoods&gstatus=1"
		method="post">
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			商品管理 <span class="c-gray en">&gt;</span>商品上架 <a
				class="btn btn-success radius r"
				style="line-height:1.6em;margin-top:3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="page-container">
			<div class="text-c">
				价格区间： <input type="text" class="input-text" style="width:120px;"
					name="begingprice" value="${param.begingprice}"  placeholder="输入福贝金额"> - <input
					type="text" class="input-text" style="width:120px;"
					name="endgprice" value="${param.endgprice}"  placeholder="输入福贝金额"> <input
					type="text" class="input-text" style="width:250px"
					placeholder="输入商品名称" id="" name="gname" value="${param.gname }">
				<button type="submit" class="btn btn-success radius" id="" name="">
					<i class="Hui-iconfont">&#xe665;</i> 搜商品
				</button>
			</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="plxiajia()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe631;</i> 批量下架</a> </div>
	<div class="mt-20">
		<table
			class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr>
					<th scope="col" colspan="9">所有订单</th>
				</tr>
				<tr class="text-c">
					<th width="25"><input type="checkbox" id="allcheck" name="" value=""></th>
					<th width="70">商品编号</th>
					<th width="100">商品名称</th>
					<th width="50">商品价格</th>
					<th width="100">商品图片</th>
					<th width="130">上架时间</th>
					<th width="50">商品状态</th>
					<th width="40">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${map.list}" var="m">
					<tr class="text-c">
						<td><input  name="check" type="checkbox" value="${m.gid}"></td>
						<td>${m.gid }</td>
						<td>${m.gname }</td>
						<td>${m.gprice }(福贝)</td>
						<td><img src="${m.gimages }" style="width:140px;height:100px"></td>
						<td><fmt:formatDate value="${m.gbegin}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td class="td-status"><c:choose>
								<c:when test="${m.gstatus==1}">
									<span class="label label-success radius">已上架</span>
								</c:when>
							</c:choose>
						<td class="td-manage"><c:choose>
								<c:when test="${m.gstatus==1}">
									<a style="text-decoration:none"
										onclick="goods_stop(this,'${m.gid }')" title="下架"><i
										class="Hui-iconfont">&#xe631;</i></a>
								</c:when>
							</c:choose> 
							<a title="商品详情" href="${pageContext.request.contextPath }/goods.do?p=getGoodsDetailById&id=${m.gid}" class="ml-5"style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a>
							<a title="编辑商品" href="${pageContext.request.contextPath }/goods.do?p=getGoodsById&id=${m.gid}&gstatus=${m.gstatus}" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a></td>
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
		$(function() {
			$('.table-sort').dataTable({
				"aaSorting" : [ [ 5, "desc" ] ],//默认第几个排序
				"bStateSave" : true,//状态保存
				"aoColumnDefs" : [
				//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
				
				]
			});

		});

		/*商品状态-下架 */
		function goods_stop(obj, id) {
				layer.confirm('确认要下架吗？',function(index) {
				layer.closeAll("dialog");
				layer.msg('该商品已下架！',{icon:5,time:1000});
				$.ajax({
				url : "${pageContext.request.contextPath}/goods.do?p=updateGsatus",
				type : "post",
				dataType : "String",
				data : {id : id},
				success : function(data) {
					},
				error:function(data){
					window.location.href="${pageContext.request.contextPath }/goods.do?p=goodsShangjia&gstatua=1";
					},
				});
			});
		}

		/* 查看订单详情 */
		function admin_uedit(title,url){
				layer_show(title,url);
		}
		
		function admin_detail(title,url,w,h){
				layer_show(title,url,w,h);
		}
		
		/* 批量下架*/
	function plxiajia()
{
	var checkboxNum=$("input[name=check]:checked").length;
	if(checkboxNum==0)
	{
		layer.msg("请勾选要下架的商品",{icon:6,time:1000});
		return false;
	}
	var checkboxList=new Array();
	$("input[name=check]:checked").each(function(){
		checkboxList.push($(this).val());	//往数组里添加当前checked属性的值
	});
	layer.confirm("确定要下架吗",function(index){
		$.ajax({
		url:"${pageContext.request.contextPath}/goods.do?p=MostupdateGsatus0",
		type:"post",
		data:{'gid':checkboxList.toString(),},
		success:function(){
			layer.msg("批量下架成功!",{icon:6,time:1000});
			location.replace(location.href);
		}
	});
	});
}
	</script>
</body>
</html>