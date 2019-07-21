<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="../static/h-ui.admin/css/style.css" />
<link href="../lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<div class="page-container">
 <div class="form form-horizontal" id="form-article-add">
  <div id="tab-system" class="HuiTab">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>公司中文名:</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" id="cName"
				name="cName">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>公司英文名:</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" id="eName"
				name="eName">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>公司状态:</label>
		<div class="formControls col-xs-8 col-sm-9">
		<span class="select-box inline">
		<select class="select" id="status" name="status" style="width:150px">
			<option value="1">启用</option>
			<option value="0">禁用</option>
		</select>
		</span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>公司网址:</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  id="url"
				name="url">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span
			class="c-red">*</span>公司简介:</label>
		<div class="formControls col-xs-8 col-sm-9"> 
				<script id="editor" name="detail" type="text/plain" style="width:100%;height:400px;"></script> 
		</div>
	</div>
  </div>
  <div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_save_submit();" class="btn btn-primary radius" type="submit" id="addCorp"><i class="Hui-iconfont">&#xe632;</i>添加</button>
			</div>
 </div>
 </div>
</div>
	
<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script>

<script type="text/javascript" src="../lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="../lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="../lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="../lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="../lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="../lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="../lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="../lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>

<script>

$(function(){
	var ue = UE.getEditor("editor", {
		autoHeightEnabled : false,
		scaleEnabled:false,
	});


$("#addCorp").click(function(){
		var cname = $("#cName").val();
		var ename = $("#eName").val();
		var status = $("#status").children("option:selected").val(); //得到选中的值
		var url = $("#url").val();
		var detail=encodeURIComponent(encodeURIComponent(ue.getContent()));
		if(cname==null || ""==cname){
			layer.msg("请输入公司中文名称!",{icon:6,time:1000});
			return false;
		}
		var chinese= /^[\u4e00-\u9fa5]{1,}$/
	    if(!chinese.test(cname))
	    {
		layer.msg("公司中文名只能输入中文!",{icon:6,time:1000});
		$("#cname").val("");
		return false;
	    }
	    
		if(ename==null || ""==ename){
			layer.msg("请输入公司英文名称!",{icon:6,time:1000});
			return false;
		}
		var english= /^[A-Za-z]{1,}$/
	    if(!english.test(ename))
	    {
		layer.msg("公司英文名只能输入英文!",{icon:6,time:1000});
		$("#ename").val("");
		return false;
	    }
	    
		if(url==null || ""==url){
			layer.msg("请输入公司网址!",{icon:6,time:1000});
			return false;
		}
		
		if(detail==null || ""==detail)
	    {
		layer.msg("请输入公司简介!",{icon:6,time:1000});
		return false;
	    }
		
		layer.confirm("确认添加吗？",function(index){
		 $.ajax({
				url:"${path}/peisong.do?p=addCompany",
				data:"&cName="+cname+"&eName="+ename+"&status="+status+"&url="+url+"&detail="+detail,
				type:"post",
				success:function(data){
				layer.msg('添加成功！',{icon:6,time:1000},function(){
				location.replace(location.href);
				});
				},
				error:function(){
				layer.msg('error!',{icon:1,time:1000});
				}
			});
		});
		
		});
		
		
});
</script>