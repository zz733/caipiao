<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/pc/css/bootstrap.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/pc/js/jquery-1.9.1.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/layer/layer.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/pc/js/bootstrap.min.js" ></script>
	<style>
		#main{
			width: 480px;
			height: 180px;
		}
		#yh{
			width: 80px;
			margin:65px 0px 0px 60px;
		}
		#nicheng{
			height: 35px;
			width: 250px;
			margin: -26px 0px 0px 150px;
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
			<p id="yh">用户称呼：</p>
			<input type="text"  id="nicheng" class="form-control" placeholder="请输入您的昵称" aria-describedby="basic-addon2" value="${userinfo.usersName}" />
		
		    <button class="btn btn-primary btn_qr" onclick="xiugai()">保存</button>
		     <button class="btn btn-danger btn_qx" onclick="quxiao()">取消</button>
		</div>
		
		
	</body>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
    
	<script>
	function xiugai(){
		var name = $("#nicheng").val();
		if(name==null || name==undefined || name==""){
		   layer.msg("内容不能为空！");
		   return false;
		}
		$.ajax({
			url :"${pageContext.request.contextPath}/userinfo.do?p=userxiugainame",
			type : "post",
			data : {"name":name},
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
		//layer.confirm("退出修改",{btn:["确定"]},function(){
			 window.parent.location.reload();
	//}); 
	}
	</script>
</html>
