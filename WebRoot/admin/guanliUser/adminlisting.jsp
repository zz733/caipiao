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
		<title>管理员管理</title>
	</head>
	<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
	<body>
	 <nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 管理员中心
		<span class="c-gray en">&gt;</span> 管理员列表
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
	 </nav>
<div class="page-container">	 
	 <form action="${pageContext.request.contextPath}/admin.do?p=adminlisting"  method="post" name="f" id="f" autocomplete="off">
	  <div class="text-c">账号:
			<input type="text" class="input-text" style="width:250px" placeholder="输入管理员账号" name="adminName" id="adminName" value="${adminmap.adminName}" >
		<input type="hidden" name="page" id="page" value="1"/>
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
     </div>
	</form>
	 
	 
	 <div class="pd-20">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<a href="javascript:;" onclick="stop_admin()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量停用 </a>	
				<span class="r">共有数据：<strong>
					<c:choose> 
						<c:when test="${empty adminmap.sum}">
							0
						</c:when>
						<c:when test="${not empty adminmap.sum}">
							${adminmap.sum}
						</c:when>
					</c:choose>
				</strong> 条</span>
	 		</div>
	 <div class="mt-20">
			<table id="tab" class="table  table-sort table-border table-bordered table-hover table-bg ">
					<thead>
						<tr class="text-c">
						<th width="25"><input type="checkbox"  ></th>
							<th width="40">
								序号
							</th>
							<th width="40">
								昵称
							</th>
							<th width="40">
								管理员账号
							</th>
							<th width="40">
							  管理员状态
							</th>
							<th width="40">
								操作
							</th>
						</tr>
					</thead>
	                <tbody>
						<c:forEach items="${adminmap.list}" var="a" varStatus="i">
							<tr class="text-c">
								<td><input type="checkbox"  name="adminCheck" value="${a.adminId}"></td>
								<td>
									${a.adminId}
								</td>
								<td>
									${a.adminName}
								</td>
								<td>
									${a.adminUsername}
								</td>
								<td>
								    <c:choose>
			                        	<c:when test="${a.adminPower==0}">
			                          	<span class="label label-inverse radius">已注销</span>
			                         	</c:when>
			                         	<c:when test="${a.adminPower==1}">
			                          	<span class="label label-danger radius">超级管理员</span>
			                         	</c:when>
			                         	<c:otherwise>
			                         	<span class="label label-primary radius">普通管理员</span>
				                        </c:otherwise>
				                    </c:choose>
								
								</td>
								<td class="td-manage">
									<a title="编辑"  onclick="admin_edit('管理员编辑','${pageContext.request.contextPath}/admin.do?p=editAdmin&adminId='+${a.adminId},'800','350')"   class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> 
								    <a title="重置密码"  id="admin_reset"  onclick="admin_reset('重置密码','${pageContext.request.contextPath}/admin.do?p=reset_Password&adminId='+${a.adminId})"   class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe66c;</i></a> 
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
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 


<script type="text/javascript">

 $(function (){
    $('.table-sort').dataTable({
        ".aaSorting":[[1,"desc"]],
        "bStateSave":true,
        "aoColumnDefs": [
        {"orderable":false,"aTargets":[0,2,4,5]}// 制定列不参与排序
        ]
    });
 
 });

 
 
function admin_reset(title,url){ 
     var adminPower="${sessionScope.admin.adminPower}";
     if(adminPower!=1){
     layer.open({
              title: '重置密码',
              content: '抱歉，你没有权限操作此功能'
              }); 
	       return false; 
	     }
	     
      layer.confirm('确定重置密码？',function(index){
              $.ajax({
                      url:url,
                      type:'post',
                      success:function(){
                      layer.msg("重置密码成功!",{icon:6,time:1000});
                      setTimeout(function(){location.replace(location.href)}, 1000) ;
                               },
                      error:function(data){
			         	           layer.msg("系统异常",{icon:2,time:1000});
			                       }
               });
          
      });   
  }
	
	
	
function admin_edit(title,url,w,h){ 
     var adminPower="${sessionScope.admin.adminPower}";
     if(adminPower!=1){
            layer.open({
              title: '管理员编辑',
              content: '抱歉，你没有权限操作此功能'
            });
	     //  layer.confirm('抱歉，权限不够!!!');
	       return false; 
	   }   
       layer.confirm('确定编辑？',function(index){
           layer_show(title, url, w, h);
        });
      }
      
		
		
/******批量停用*****/	
function stop_admin(){
      var adminPower="${sessionScope.admin.adminPower}";   
      var text="";
	  var sum="${adminmap.sum}";   
	  var checkedNum = $("input[name='adminCheck']:checked").length; 
	  if(adminPower!=1){
	             layer.open({
                      title: '停用',
                      content: '抱歉，你没有权限操作此功能'
                  });
	            return false;
	  }    
	  if(checkedNum==0){
	            layer.open({
                      title: '提醒',
                      content: '请选择要停用的项'
                      });
				event.preventDefault(); // 兼容标准浏览器
                window.event.returnValue = false; // 兼容IE6~8
               return false;
	  }
	  if(checkedNum==sum){  
	              layer.open({
                      title: '警告',
                      content: '至少需要留一个管理员',
            /*          yes: function(index, layero){            点击确认之后刷新当前页面
                               window.location.reload() 
                           }        */
                  });
                  return false;
		        
      } else{ 
        
             var checkboxList=new Array();
             $("input[name='adminCheck']:checked").each(function(){
		      var i= checkboxList.push($(this).val());	//往数组里添加当前checked属性的值
	         
	         });
	         layer.confirm('确定要停用？',function(index){
                    $.ajax({
                           url:"${pageContext.request.contextPath}/admin.do?p=stop_admin",
                           type:"post",
                           data:{'adminId':checkboxList.toString()},
                           success:function(data){
		                      	layer.msg("批量停用成功!",{icon:6,time:1000});
		                        setTimeout(function(){location.replace(location.href)}, 1000) ;
		                       //setTimeout(function(){window.location.href="${pageContext.request.contextPath}/admin.do?p=adminlisting";},1000);
				           },
				           error:function(data){
			         	        layer.msg("系统异常",{icon:6,time:1000});
			               }    
                     });
              });
           } 
}  


/*  批量删除
function delete_admin(){
        var text="";
	    var sum="${adminmap.sum}";   
	    var checkedNum = $("input[name='adminCheck']:checked").length;     
		if(checkedNum==0){
				      alert("请选择要删除的项!");
				      event.preventDefault(); // 兼容标准浏览器
                      window.event.returnValue = false; // 兼容IE6~8
                    return false;
		 }
		if(checkedNum==sum){  
		          alert("至少需要留一个管理员");
		          return false;
        } else{ 
        
              var checkboxList=new Array();
             $("input[name='adminCheck']:checked").each(function(){
		      var i= checkboxList.push($(this).val());	//往数组里添加当前checked属性的值
	         
	         });
	         layer.confirm('确认要删除吗？',function(index){
                    $.ajax({
                           url:"${pageContext.request.contextPath}/admin.do?p=delete_admin",
                           type:"post",
                          // async:false,
                           data:{'adminId':checkboxList.toString()},
                           success:function(){
		                      	layer.msg("批量删除成功!",{icon:6,time:1000});
		                      //	setTimeout(function(){window.location.href="${pageContext.request.contextPath}/admin.do?p=adminlisting";},1000);
				               $("input[name='adminCheck']:checked").parents('tr').remove();
				               }
                     });
              });
           } 
}  
*/
        



</script>
</body>
</html>			 	
