<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/pc/css/bootstrap.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/pc/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/pc/js/bootstrap.min.js" ></script>
	<style>
		#main{
			width: 380px;
			height: 180px;
		}
		#yh{
			width: 100px;
			margin:65px 0px 0px 60px;
		}
		#zhifubao{
			height: 35px;
			width: 250px;
			margin: -26px 0px 0px 160px;
		}
		.btn_qr{
			margin: 55px 0px 0px 140px;
		}
		.btn_qx{
			margin: 55px 0px 0px 90px;
		}
	</style>
	</head>
	<body>
		
		<div id="main">
			<p id="yh">支付宝账号：</p>
			<input type="text"  id="zhifubao" class="form-control" placeholder="请输入您的支付宝账号" aria-describedby="basic-addon2" value="" />
		
		    <button class="btn btn-primary btn_qr" onclick="xiugai()">保存</button>
		     <button class="btn btn-danger btn_qx" onclick="quxiao()">取消</button>
		</div>
		
		
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
	<script>
	function xiugai(){
		var zhifubao = $("#zhifubao").val();
		if(zhifubao==null || zhifubao!=undefined || zhifubao==""){
		alert("内容不能为空！");
		//layer.msg("内容不能为空！");
		}
		$.ajax({
			url :"${pageContext.request.contextPath}/userinfo.do?p=userxiugaizfb",
			type : "post",
			data : {"zhifubao":zhifubao},
			success : function(data) {
				if (data=="false") {
					var a=layer.confirm("修改失败",{btn:["确定"]},function(){
						layer.close(a);
					});
				}else{
					 layer.confirm("修改成功",{btn:["确定"]},function(){
						 window.parent.location.reload();
				}); 
				}
			},
			error:function(data){
				 layer.confirm("修改失败",{btn:["确定"]},function(){
					 window.parent.location.reload();
				});
				},
			});
	}
	function quxiao(){
		layer.confirm("退出修改",{btn:["确定"]},function(){
			 window.parent.location.reload();
	}); 
	}
	</script>
</html>
