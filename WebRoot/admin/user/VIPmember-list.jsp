<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
<head>
 <%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>  
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
<title>VIP用户</title>
</head>
 <%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>   
<body>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> VIP用户  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<form action="${pageContext.request.contextPath}/user.do?p=userlisting&type=${usersmap.type}" method="post" name="f" id="f" autocomplete="off">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" name="mintime" value="${param.mintime}" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" name="maxtime" value="${param.maxtime}" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入用户名称" name="usersName" value="${username}">
		<input type="hidden" name="page" id="page" value="1"/>
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
</form>

<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="r">共有数据：<strong>
		<c:choose>
			<c:when test="${empty usersmap.sum}">
				0
			</c:when>
			<c:when test="${not empty usersmap.sum}">
				${usersmap.sum}
			</c:when>
		</c:choose>
				</strong> 条</span>
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="11">用户管理</th>
			</tr>
			<tr class="text-c">
				<th width="40">序号</th>
				<th width="50">用户名称</th>
				<th width="80">手机号</th>
				<th width="55">用户类型</th>
				<th width="60">福贝</th>
				<th width="80">支付宝账号</th>
				<th width="80">微信账号</th>
				<th width="120">会员开始时间</th>
				<th width="120">会员结束时间</th>
				<th width="120">用户创建时间</th> 
			</tr>
		</thead>
		<tbody>
	
		<c:if test="${not empty usersmap.list}" var="f">
		<c:forEach items="${usersmap.list}" var="u" varStatus="i">
		<c:if test="${usersmap.list==null}">  暂无数据	</c:if>
		
		   <tr class="text-c"> 
		       <td>
		        ${i.count+(usersmap.page-1)*usersmap.size}
		       </td>
		       <td>
		        	${u.usersName}
		       </td>
		       <td>
		            ${u.usersPhone}
		       </td>
		      <td class="td-status">
				<c:choose>
				<c:when test="${u.usersType==0}">
				<span class="label label-primary radius">普通用户 </span>
				</c:when>
				<c:otherwise>
				<span class="label label-warning radius">VIP用户 </span>
				</c:otherwise>
				</c:choose>
				</td>
		       <td>
		         <span class="label label-danger radius">
		            ${u.usersFubei}
		         </span>   
		       </td>
		       <td>
		            <c:if test="${u.usersZhifubao==null}">无</c:if>
					<c:if test="${u.usersZhifubao!=null}"><span class="label label-success radius">${u.usersZhifubao}</span></c:if>
		       </td>
		       <td>
		       <c:if test="${u.usersWeixin==null}">无</c:if>
			   <c:if test="${u.usersWeixin!=null}"><span class="label label-success radius">${u.usersWeixin}</span></c:if>
		       </td>
		       <td>
		       <c:if test="${u.usersBegintime==null}">无 </c:if>
		           <c:if test="${u.usersBegintime!=null}"><span >
		                 <fmt:formatDate value="${u.usersBegintime}" pattern="yyyy-MM-dd HH:mm:ss"/> 
		           </span></c:if>
		      
		       </td>
		       <td>
		       <c:if test="${u.usersEndtime==null}">无  </c:if>
		           <c:if test="${u.usersEndtime!=null}"><span>
		                 <fmt:formatDate value="${u.usersEndtime}" pattern="yyyy-MM-dd HH:mm:ss"/> 
		           </span></c:if>
		       </td>
		        <td>
		       <c:if test="${u.usersCreatetime==null}">无  </c:if>
		           <c:if test="${u.usersCreatetime!=null}"><span>
		                 <fmt:formatDate value="${u.usersCreatetime}" pattern="yyyy-MM-dd HH:mm:ss"/> 
		           </span></c:if>
		       </td>
		<!-- 	    <td>   
		    		<a style="text-decoration: none" onclick="xiugai_type(this,'${u.usersId}')"
									href="javascript:void(0)" title="修改会员类型">
										<c:choose>
											<c:when test="${u.usersType==0}"><span class="label label-danger radius">VIP用户 </span></c:when>
											<c:otherwise><span class="label label-primary radius">普通用户 </span></c:otherwise>
										</c:choose>
		     </a>   
	    </td>                       -->
	    
	          
		</c:forEach>
       </c:if>
			 
		</tbody>
	</table>
	
<!-- 	<table width="95%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="6">
							<img src="../images/spacer.gif" width="1" height="1" />
						</td>
					</tr>
					<tr>
						<td height="33">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="right-font08">
								<tr>
									<td width="50%">
										第
										<span class="right-text09">${ usersmap.page}</span> 页 |
										共
										<span class="right-text09">${usersmap.count }</span> 页
									</td>
									<td width="32%" align="right">
										[
										<a
											href="${pageContext.request.contextPath}/user.do?p=userlisting&type=${usersmap.type}&mintime=${param.mintime}&maxtime=${param.maxtime}&usersName=${usersName}"
											class="right-font08">首页</a> |
										
										<c:if test="${usersmap.page>1}">
										<a
											href="${pageContext.request.contextPath}/user.do?p=userlisting&type=${usersmap.type}&mintime=${param.mintime}&maxtime=${param.maxtime}&usersName=${usersName}&page=${usersmap.page-1}"
											class="right-font08">上一页</a> |   </c:if>
											
										 <c:if test="${usersmap.page<usersmap.count}">
										<a
											href="${pageContext.request.contextPath}/user.do?p=userlisting&type=${usersmap.type}&mintime=${param.mintime}&maxtime=${param.maxtime}&usersName=${usersName}&page=${usersmap.page+1}"
											class="right-font08">下一页</a>   | </c:if>
										<a
											href="${pageContext.request.contextPath}/user.do?p=userlisting&type=${usersmap.type}&mintime=${param.mintime}&maxtime=${param.maxtime}&usersName=${usersName}&page=${usersmap.count}"
											class="right-font08">末页</a> ] 转至：
									</td>
									<td width="5%">
										<table width="20" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="1%">
													<input name="textfield3" type="text" id="page"
														value="${usersmap.page}" class="right-textfield03"
														size="3" />
												</td>
												<td width="87%"></td>
												<td width="87%">
													<input name="Submit23222" type="submit" value="GO"
														onclick="viewGo()" />
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table> 
 -->

</div>
</div>


<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 

<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

function  thisurl(){
    url="${pageContext.request.contextPath}/user.do?p=userlisting&type=${usersmap.type}&mintime=${param.mintime}&maxtime=${param.maxtime}&usersName=${param.usersName}&page="+page;
 }
window.onload = function(){}

//修改会员类型
function xiugai_type(a,id)
{
	var type=${usersmap.type};
	var url="${pageContext.request.contextPath}/user.do?p=xiugaitype";
	var params={id:id};
	$.post(url,params,function(data){
		var td=$(a).parent().parent().find("td").eq(3);
		if(type==0)
		{
			if(data==1)
			{
					window.location.href="${pageContext.request.contextPath}/user.do?p=userlisting&type=${usersmap.type}&mintimee=${param.mintime}&maxtime=${param.maxtime}&usersName=${usersName}&page=${usersmap.page}"
			}
		}
		if(type==1)
		{
			if(data==0)
			{
				window.location.href="${pageContext.request.contextPath}/user.do?p=userlisting&type=${usersmap.type}&mintime=${param.mintime}&maxtime=${param.maxtime}&usersName=${param.usersName}&page=${usersmap.page}"
			}
		}
		if(data==0
		){   
			td.html('<span class="label label-danger radius">VIP用户 </span>');
			$(a).innerHTML='<span class="label label-primary radius">普通用户 </span>';
		}else{
			td.html('<span class="label label-primary radius">普通用户 </span>');
			a.innerHTML='<span class="label label-danger radius">VIP用户 </span>';
		}
		layer.msg("修改成功",{icon:6,time:1000});
	});
}
function viewGo()
{
	var page=document.getElementById("page").value;
	if(page.match('^[0-9]*$'))
		{	
	window.location.href="${pageContext.request.contextPath}/user.do?p=userlisting&type=${usersmap.type}&mintime=${param.mintime}&maxtime=${param.maxtime}&usersName=${param.usersName}&page="+page;
}
}

$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[2,5,6]}// 制定列不参与排序
		]
	});
	
});






</script>
	</body>
</html>


