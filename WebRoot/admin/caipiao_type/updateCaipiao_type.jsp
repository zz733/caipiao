<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="${path }/admin/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<div class="page-container">
 <div class="form form-horizontal" id="form-article-add">
  <div id="tab-system" class="HuiTab">
     <input type="hidden" value="${ps.id }" id="id" name="id"/>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>类别名称:</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" id="name"
				name="name" value="${ps.name }">
		</div>
	</div>
	
	<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>预测价格:
				</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" id="price" name="price" value="${ps.price }">
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>预测返价格:
				</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" id="price_return" name="price_return" value="${ps.price_return }">
				</div>
			</div>
	
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>类别状态:</label>
		<div class="formControls col-xs-8 col-sm-9">
		<span class="select-box inline">
		<select class="select" id="status" name="status" style="width:150px">
			<option value="1"  ${ps.status==1?'selected':''}>启用</option>
			<option value="0"  ${ps.status==0?'selected':''}>禁用</option>
		</select>
		</span>
		</div>
	</div>

  </div>
<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button  id="addCorp" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>修改</button>
			</div>
</div>
 </div>
</div>
	
<script type="text/javascript" src="${path }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${path }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${path }/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${path }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>

<script type="text/javascript" src="${path }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${path }/admin/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="${path }/admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${path }/admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${path }/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>

<script>


	

$("#addCorp").click(function(){
        var id = $("#id").val();
		var name = $("#name").val();
		var price = $("#price").val();
		var price_return = $("#price_return").val();
		var status = $("#status").val(); //得到选中的值
		$.ajax({
				url:"${path }/caipiaoTypeManager.do?p=updateCaipiaoType",
				data:{id:id,name:name,status:status,price:price,price_return:price_return},
				type:"post",
				success: function(data){
				layer.msg('修改成功！',{icon:6,time:1000});
				setTimeout(function(){window.parent.location.reload();},1000);
				},
				error:function(data,status,e){
				layer.msg('error!',{icon:1,time:1000});
				}
			});
		});
		



</script>