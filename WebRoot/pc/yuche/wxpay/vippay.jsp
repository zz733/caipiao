<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 导入外部JQuery -->
<%-- <script src="${pageContext.request.contextPath}/newpc/js/jquery-1.2.6.pack.js" type="text/javascript" language="javascript"></script>
	 --%>
	 
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/zhuce.css"  type="text/css">
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" />
 <script type="text/javascript" src="${pageContext.request.contextPath}/pc/lib/jquery/1.9.1/jquery.min.js"></script> 
	 
	 	<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript"
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/static/h-ui/js/H-ui.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/static/h-ui.admin/js/H-ui.admin.js"></script>
       		<link rel="stylesheet"
				href="${pageContext.request.contextPath }/pc/css/mui.min.css" />
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/pc/js/jquery.min.js"></script>
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/pc/css/bootstrap.min.css" />
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/pc/css/gongyijingcai.css" />
			<script src="${pageContext.request.contextPath }/pc/js/mui.min.js"></script>

			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/admin/static/h-ui/css/H-ui.min.css" />
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/H-ui.admin.css" />
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/admin/static/h-ui.admin/skin/default/skin.css"
				id="skin" />
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/style.css" />


			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>

			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/laypage/1.2/laypage.js"></script>
		
<script>

   function checkPay()
   {
      var orderId = "${orderId}";
      var money = "${money}";
      //alert("qubuqu");
       	$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/yuche.do?p=payCheck&money="+money+"&id="+orderId+"&yid=${param.yid}",
			success:function(data){
			     
			    if(data!="error")
                {
           		 //alert("支付成功！！！！");	
           		 $("#main").css("display","none");
                 window.clearInterval(x);
                 document.getElementById("icon60").visibility = "visible";
                
                
                 window.setTimeout(function(){
                      var json = eval("("+data+")");
					  layer.open( 
					    {
							title : json.caipiaoType.name+ "第"+ json.caipiaoQishu+ "期预测",
																		//skin : 'layui-layer-rim', //加上边框
							area : [
									'900px',
									'600px' ], //宽高
							content : json.neirong,
							type : 1
								});
					  
                 },1000);
               }
			}
		});  
   }
   x= window.setInterval("checkPay()",1000);
   
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
			width:200px;
			height: 90px;
		}
		.foot_1_word{
			padding-left: 5px;
		}
		.foot_1_word{
			padding-left: 5px;
		}	
		#foot{
		  width:993px;
		  font-size:14px
		  margin:auto;
		}
		</style>
	</head>

	<body>
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
 <script type="text/javascript" src="${pageContext.request.contextPath}/pc/lib/jquery/1.9.1/jquery.min.js"></script> 
         
         <section class="w12 login">
          </section>
 
          <section class="main w12" id="main">
			   <div class="title"><a class="title1 db fl">微信支付</a></div>
			   <div class="fr tit2"><span class="arr"></span></div>
			   
			   
			   <div id="f1">
			   <form class="form-horizontal">
				  <div class="form-group">
				   <div class="weixin">
				<div class="wx_box_fix"
					style="background-image: ../ images/ wxbg_mail_box.png; bottom: -10px; overflow: hidden; padding: 60px 170px 100px; position: relative;">
					<div class="wx_box_area" align="center">

								<div class="wx_img_wrapper">

									<img id="payQRImg" class="code"  style="border: 0px solid blue; text-align: center;width: 200px;height: 200px;"
										
										src="${pageContext.request.contextPath }/tempImages/${weixinpay }"/>
								</div>
								<div class="msg_default">
									<i id="icon60" class="icon60" style="visibility:hidden;text-align: center;">
									   支付成功
									</i>
									<p id="wx_saomiao" style="text-align: center;">
										请使用微信扫描		
									</p>
								</div>
					<div class="wx_money" style="margin-top: 20px;">
						<span>支付金额:￥</span>${money}
					</div>
					
		</div>

				  </div>
			  </form>
        </div>	  
		 </section>	   
         
         <div class="head_border"></div>
         
         
         
  
		





		
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
