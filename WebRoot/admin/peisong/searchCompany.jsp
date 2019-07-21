<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css"
	href="${path }/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${path }/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${path }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${path }/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="${path }/admin/static/h-ui.admin/css/style.css" />
<title>配送公司</title>
</head>
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<body>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页<span class="c-gray en">&gt;</span>配送公司中心<span class="c-gray en">&gt;</span>配送公司列表<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<form action="${path }/peisong.do?p=fenye" method="post" id="f" name="f">
	<div class="text-c">
	        <input type="hidden" id="page" name="page" value="1"/>
			<input type="text" name="sosuo" id="sosuo" style="width:250px" class="input-text" value="${param.sosuo }" placeholder="输入配送公司名称">
			<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i>搜索配送公司</button>
	</div>
</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"></span> <span class="r">共有数据：<strong>
		<c:choose>
			<c:when test="${empty map.sum}">
				0
			</c:when>
			<c:when test="${not empty map.sum}">
				${map.sum}
			</c:when>
		</c:choose>
	</strong> 条</span> </div>
		<div class="mt-20">
	<table class="table table-border table-bordered table-bg table-sort">
			<thead>
			<tr>
				<th scope="col" colspan="7"></th>
			</tr>
				<tr class="text-c">
					<th width="30px">序号</th>
					<th width="100px">公司中文名</th>
					<th width="100px">公司英文名</th>
					<th width="100px">公司网址</th>
					<th width="180px">公司简介</th>
					<th width="20px">状态</th>
					<th width="100px">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${not empty map.list}" var="pp">
			<c:forEach items="${map.list }" var="p"  varStatus="i" >
				<tr class="text-c">
					<td>${p.pscId}</td>
					<td>${p.pscChinesename }</td>
					<td>${p.pscEnglishname }</td>
					<td>${p.pscUrl }</td>
					<td>${p.pscDetail }</td>
					<td class="td-status">
						<c:choose>
							<c:when test="${p.pscStatus==0}">
								<span class="label label-defaunt radius">禁用</span>
							</c:when>
							<c:when test="${p.pscStatus==1}">
								<span class="label label-success radius">启用</span>
							</c:when>
						</c:choose>
					</td>
					<td class="td-manage">
						<c:choose>
							<c:when test="${p.pscStatus==1}">
				     			 <a style="text-decoration: none" onclick="member_stop(this,'${p.pscId}')"	href="javascript:void(0)" title="禁用"><i class="Hui-iconfont">&#xe631;</i></a>
							</c:when>
							<c:otherwise>
								 <a style="text-decoration: none" onclick="member_start(this,'${p.pscId}')"	href="javascript:void(0)" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>
							</c:otherwise>
						</c:choose>
					<a title="编辑" href="javascript:;" onclick="system_category_edit('编辑','${path}/peisong.do?p=getAllById&id=${p.pscId}')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
					</td>
				</tr>
	</c:forEach>
	</c:if>
		<c:if test="${not pp}">
			<tr class="text-c">
				<th scope="col" colspan="7">暂无提现申请</th> 
			</tr>
   		</c:if>
			</tbody>
	</table>
</div>
<!-- 
<c:if test="${not empty map.list}" var="f">
<div class="fenye1">第${map.page }页|共${map.count }页</div>
<div class="fenye2">
    <c:if test="${map.page>1}">
                 <a href="javascript:fenye(${map.page-1})">上一页</a>
    </c:if>
     <c:set var="left" value="${map.page-5<1 ? 1 : map.page-5}"></c:set>
     <c:set var="right" value="${left+9>map.count? map.count : left+9}"></c:set>
               
     <c:forEach begin="${left}" end="${right}" var="x">
           <c:if test="${x==map.page }" var="no">${x }</c:if>
           <c:if test="${not no }"><a href="javascript:fenye(${x})">${x}&nbsp;</a></c:if>
     </c:forEach>
     <c:if test="${map.page<map.count}">
                  <a href="javascript:fenye(${map.page+1})">下一页</a>
     </c:if>
</div>
</c:if>
 -->

</div>


<script type="text/javascript" src="${path }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${path }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${path }/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${path }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>

<script type="text/javascript" src="${path }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${path }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${path }/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

 
/* JQuery自带的分页查询*/
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[3,4,6]}// 制定列不参与排序
		]
	});
});


/*系统-栏目-添加*/
function system_category_edit(title,url,w,h)
{
     layer_show(title,url,w,h);
}

/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要禁用吗？',function(index) {
	$.ajax({
	     url:"${path}/peisong.do?p=updatestatus",
	     type:"post",
	     data:{id:id},
	     success:function(data)
	     {
	         $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onclick="member_start(this,${p.pscId})" href="javascript:void(0)" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
		     $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">禁用</span>');
		     $(obj).remove();
		     layer.msg('已禁用!',{icon : 5,time : 1000},function(){
		      window.location.href="${path}/peisong.do?p=fenye&page=${map.page}";
		     });
	     },
	     error:function()
	     {
	     }
	   });
	});
		
}

/*用户-启用*/
function member_start(obj,id) {

	    layer.confirm('确认要启用吗？',function(index) {
	     
	     $.ajax({
	     url:"${path}/peisong.do?p=updatestatus",
	     type:"post",
	     data:{id:id},
	     success:function(data)
	     {
		 $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onclick="member_stop(this,${p.pscId})" href="javascript:void(0)" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
		 $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">启用</span>');
		 $(obj).remove();
		 layer.msg('已启用!',{icon : 6,time : 1000},function(){
		  window.location.href="${path}/peisong.do?p=fenye&page=${map.page}";
		 });
	    },
	   error:function()
	   {
	   }
	
	});
});
}

</script>
</body>
</html>