<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="../lib/webuploader/0.1.5/webuploader.css" rel="stylesheet"
	type="text/css" />
<%  if (session.getAttribute("admin")==null) response.sendRedirect("../login.jsp");%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<div class="page-container">
	<div class="form form-horizontal" id="form-article-add">
		<div id="tab-system" class="HuiTab">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>类别名称:
				</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" id="name" name="name">
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>预测价格:
				</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" id="price" name="price">
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>预测返价格:
				</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" id="price_return" name="price_return">
				</div>
			</div>
			

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">
					<span class="c-red">*</span>类型状态:
				</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box inline"> <select class="select"
							id="status" name="status" style="width: 150px">
							<option value="1">
								启用
							</option>
							<option value="0">
								禁用
							</option>
						</select> </span>
				</div>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_save_submit();"
					class="btn btn-primary radius" type="submit" id="addCorp">
					<i class="Hui-iconfont">&#xe632;</i>添加
				</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript"
	src="../static/h-ui.admin/js/H-ui.admin.js"></script>

<script type="text/javascript"
	src="../lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
	src="../lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript"
	src="../lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript"
	src="../lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript"
	src="../lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript"
	src="../lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript"
	src="../lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript"
	src="../lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>

<script>



$("#addCorp").click(function(){
		var name = $("#name").val();
		var status = $("#status").val(); //得到选中的值
		var price = $("#price").val();
		var price_return = $("#price_return").val();
		
		if(name==null || ""==name){
			layer.msg("请输入类别名称!",{icon:6,time:1000});
			return false;
		}
		
		if (price=="")
		{
		    layer.msg("请输入价格!",{icon:6,time:1000});
			return false;
		}
		
		if (isNaN(price))
		{
		    layer.msg("只能是数字!",{icon:6,time:1000});
			return false;
		}
		
		if (price*1<0)
		{
		    layer.msg("不能是负数!",{icon:6,time:1000});
			return false;
		}
		
		
		if (price_return=="")
		{
		    layer.msg("请输入预测返额!",{icon:6,time:1000});
			return false;
		}
		
		if (isNaN(price_return))
		{
		    layer.msg("预测返额只能是数字!",{icon:6,time:1000});
			return false;
		}
		
		if (price_return*1<0)
		{
		    layer.msg("预测返额不能是负数!",{icon:6,time:1000});
			return false;
		}
		
		layer.confirm("确认添加吗？",function(index){
		 $.ajax({
				url:"${pageContext.request.contextPath}/caipiaoTypeManager.do?p=add",
				data:{name:name,status:status,price:price,price_return:price_return},
				type:"post",
				success:function(data){
				if (data=="true")
				{
					layer.msg('添加成功！',{icon:6,time:1000},function(){
					location.replace(location.href);
					});
				}
				else
				{
				   layer.msg('类别名称已存在！',{icon:6,time:1000});
				}
				},
				error:function(){
				layer.msg('error!',{icon:1,time:1000});
				}
			});
		});
		
		});
		
		

</script>