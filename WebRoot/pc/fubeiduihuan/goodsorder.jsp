<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/goodsorder.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/pc/lib/jquery/1.9.1/jquery.min.js"></script> 
        	<script src="${pageContext.request.contextPath}/pc/js/layer/1.9.3/layer.js"></script>
	</head>

	<body>
		<div id="goodsorder">
			<div class="d1">
			<c:forEach items="${goodmap.list}" var="g">
				<img src="${pageContext.request.contextPath}/${g.gimages}" class="tu" />
				<div class="world">
					<dl class="dl-horizontal">
						<dt>商品名称:</dt>
						<dd>${g.gname}</dd>
						<input hidden="hidden"  id="gid" type="text" value="${g.gid}"/>
					</dl>
					<dl class="dl-horizontal">
						<dt>商品价格:</dt>
						<dd>${g.gprice}</dd>
						<input hidden="hidden"  id="gprice" type="text" value="${g.gprice}"/>
					</dl>
					<dl class="dl-horizontal">
						<dt>商品数量:</dt>
						<dd>1</dd>
					</dl>
				</div>
			</c:forEach>
			</div>

			<div class="d2">
				<table class="table">

					<tr>
						<td colspan="3">
							确认收货地址
						</td>
						<td class="text-right">
							<a href="${pageContext.request.contextPath}/pc/fubeiduihuan/shouhuoxinxi.jsp">添加收货地址</a>
						</td>
					</tr>
					<tr>
						<td width="30px"></td>
						<td width="320px">收货地址</td>
						<td width="	">收货人电话</td>
						<td>收货人姓名</td>
					</tr>
					<c:forEach items="${resslist}" var="r">
					<tr class="message">
						<td class="check-box">
							<input type="checkbox" value="${r.adId}" class="checkbox" name="box">
						</td>
						<td>${r.areas.citys.provinces.proName}${r.areas.areaName}${r.adDetail}</td>
						<td>${r.adphone}</td>
						<td>${r.adName}</td>
					</tr>
					</c:forEach>
				</table>

			</div>
			<div>
				<button type="button" class="btn btn-warning btn-lg" id="buy" >立即兑换</button>
			</div>
		</div>
	</body>

<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script>
	var SelectFalse = false; //用于判断是否被选择条件
	var adid;
	$("#buy").click(function(){
		var gid=$("#gid").value;
		location="${pageContext.request.contextPath }/";
		/**
		var chboxValue = [];
		var CheckBox = $('input[name = box]');//得到所的复选框
		
			for(var i = 0; i < CheckBox.length; i++)
			{
				//jquery1.6以上可以if(CheckBox[i].prop('checked') == true)去判断checkbox是否被选中
				if(CheckBox[i].checked)//如果有1个被选中时
				{
				SelectFalse = true;
				chboxValue.push(CheckBox[i].value)//将被选择的值追加到
				}
			}
		
			if(!SelectFalse)
			{
				layer.msg("请选择收货地址", {time:1500 }); 
				return false
			}
			 var gid = $("#gid").val();
			 var gprice=$("#g.gprice").val();
			 var mymoney=${sessionScope.userinfo.usersFubei};
			 if(mymoney<gprice){
				layer.msg('余额不足,请前往充值!',{icon:2,time:1000});
				setTimeout(function(){window.parent.location.reload();},1000);
			  }
			 else
				 {
					$.ajax({
						url :"${pageContext.request.contextPath}/getgoods.do?p=Goodduihuan",
						type : "post",
						data : {"adid":adid,"gid":gid},
						success : function(data) {
							if(data=="true"){
								layer.msg('兑换成功!',{icon:6,time:1000});
								setTimeout(function(){window.parent.location.reload();},1000);
							}
							else{
								layer.msg('余额不足,请前往充值!',{icon:2,time:1000});
								setTimeout(function(){window.parent.location.reload();},1000);
							}
						},
						error:function(data){
							layer.msg('兑换失败!',{icon:2,time:1000});
							setTimeout(function(){window.parent.location.reload();},1000);
							},
						});
				 }
			 */
			
	});
	 /*  layer.msg("请选择收货地址", {time:1500 }); */
	 
	 
	$(function () {
            var fanxiBox = $(".message input:checkbox");
           
            fanxiBox.click(function () {
               if(this.checked || this.checked=='checked'){
                   fanxiBox.removeAttr("checked");
                   //这里需注意jquery1.6以后必须用prop()方法
                   //$(this).attr("checked",true);
                   $(this).prop("checked", true);
                   adid=this.value;
                 }
            });
            	
         });   


</script>
</html>