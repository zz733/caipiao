<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 导入外部JQuery -->
<%-- <script src="${pageContext.request.contextPath}/newpc/js/jquery-1.2.6.pack.js" type="text/javascript" language="javascript"></script>
	 --%>
	 	<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/layer/2.1/layer.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/static/h-ui/js/H-ui.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
/* 	window.onload = function(){
	  var orderId = "${orderId}";
      var money = "${money}";
	alert("曾儿子就是傻逼！~");
	    $.ajax({
      	type: "POST",
      	url: "${pageContext.request.contextPath}/dailichongzhi.do?p=chongzhiSearch&money="+money+"&orderId="+orderId,
      	success: function(data){
      		alert("曾儿子是傻逼！！！");
      		if (data.equals("success"))
           {
           		alert("支付成功！！！！");p1qw sdfcnm,./khgh	
               window.clearInterval(x);
               document.getElementById("icon60").visibility = "visible";
               window.setTimeout("go()",5000);
           }
      	}
      
      });
	} */
   function checkPay()
   {
      var orderId = "${orderId}";
      var money = "${money}";
      //alert("qubuqu");
       	$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/dailichongzhi.do?p=chongzhiSearch&money="+money+"&orderId="+orderId,
			success:function(data){
			 if(data=="czsuccess")
           {
           		alert("支付成功！！！！");	
               window.clearInterval(x);
               //document.getElementById("icon60").visibility = "visible";
               window.setTimeout("go()",3000);
           }
			}
		});  
   }
   x= window.setInterval("checkPay()",4000);
   function go()
   {
   	 //alert("guolail");
   	 location.replace(document.referrer);
     //location = "${pageContext.request.contextPath}/daili/back_index.jsp";
   }
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>微信支付</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<style type="text/css">
		body{
		  margin:0 auto;
		}
		.msg_default{
			width:141px;
			height: 90px;
			text-align: center;
		}
		.wx_logo img{
		   width:180px;
		   height:165px;
		}
			
		
		</style>
	</head>

	<body>
		<div class="wx_header">
			<div class="wx_logo">
				<img
					src="${pageContext.request.contextPath}/pc/images/wxlogo_pay.png" />
			</div>
		</div>

		<div class="weixin" style="margin:0 auto; width:141px; ">
				<div class="wx_box_fix"
					style="background-image: ../ images/ wxbg_mail_box.png; bottom: -10px; overflow: hidden; position: relative;">
					<div class="wx_box_area">

								<div class="wx_img_wrapper" >

									<img id="payQRImg" class="code"  style="border: 1px solid blue; "
										
										src="${pageContext.request.contextPath }/tempImages/${weixinpay }"/>
								</div>
								<div class="msg_default">
									<i class="icon60" style="visibility: hidden">
									   支付成功
									</i>
									<p id="wx_saomiao">
										请使用微信扫描		
									</p>
									二维码来完成支付
								</div>
					<div class="wx_money" style="margin-top: 20px; text-align: center; width:141px;">
						<span>￥</span>${money}
					</div>
					
		</div>






		
	</body>
<!-- 	<script type="text/javascript">
	window.onload = function(){
			$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/weixinPay.do?p=toPay&money=0.01",
			success:function(data){
			alert("assdsdsas333"+Math.random(4).toString());
			}
		});
	}
	setInterval(function(){
		alert("asas"+Math.random(4).toString());
		/* 	$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/weixinPay.do?p=toPay",
			success: function(data){
			alert("assdsdsas"+Math.random(4).toString());
			}
		}); */
		alert("sdsdsdsdsaaaaaaaaaaaaa");
	}, 5000);
	
	</script> -->
</html>
