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
     <input type="hidden" value="${ps.pscId }" id="pid" name="pid"/>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>公司中文名:</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" id="cName"
				name="cName" value="${ps.pscChinesename }">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>公司英文名:</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" id="eName"
				name="eName" value="${ps.pscEnglishname }">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>公司状态:</label>
		<div class="formControls col-xs-8 col-sm-9">
		<span class="select-box inline">
		<select class="select" id="status" name="status" style="width:150px">
			<option value="1"  ${ps.pscStatus==1?'selected':''}>启用</option>
			<option value="0"  ${ps.pscStatus==0?'selected':''}>禁用</option>
		</select>
		</span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>公司网址:</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  id="url"
				name="url" value="${ps.pscUrl }">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>公司简介:</label>
		<div class="formControls col-xs-8 col-sm-9"> 
				<script id="editor" name="detail" type="text/plain" style="width:100%;height:400px;">${ps.pscDetail}</script> 
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

$(function(){
	var ue = UE.getEditor("editor", {
		autoHeightEnabled : false,
		scaleEnabled:false,
});
	

$("#addCorp").click(function(){
        var pid = $("#pid").val();
		var cname = $("#cName").val();
		var ename = $("#eName").val();
		var status = $("#status").children("option:selected").val(); //得到选中的值
		var url = $("#url").val();
		var detail=encodeURIComponent(encodeURIComponent(ue.getContent()));
		$.ajax({
				url:"${path }/peisong.do?p=updateCorp",
				data:"pid="+pid+"&cName="+cname+"&eName="+ename+"&status="+status+"&url="+url+"&detail="+detail,
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
		
});


</script>