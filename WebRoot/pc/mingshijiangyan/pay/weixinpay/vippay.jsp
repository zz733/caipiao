<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("--------------------path------------------------");
	System.out.println(path);
	System.out.println("--------------------basePath------------------------");
	System.out.println(basePath);
%>

<!-- 导入外部JQuery -->
<%-- <script src="${pageContext.request.contextPath}/newpc/js/jquery-1.2.6.pack.js" type="text/javascript" language="javascript"></script>
	 --%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/pc/css/zhuce.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/lib/jquery/1.9.1/jquery.min.js"></script>

<%--
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/lib/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/lib/static/h-ui.admin/js/H-ui.admin.js"></script>
 --%>
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
	function checkPay() {
		var orderId = "${orderId}";
		var money = "${money}";
		//alert("qubuqu");
		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/dailichongzhi.do?p=chongzhiSearch2&money="
							+ money + "&orderId=" + orderId,
					success : function(data) {
						if (data == "czsuccess") {
							alert("支付成功！！！！");
							window.clearInterval(x);
							//document.getElementById("icon60").visibility = "visible";
							window.setTimeout("go()", 3000);
						}
					}
				});
	}
	//x= window.setInterval("checkPay()",4000);
	function go() {
		alert("guolail");
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
body {
	margin: 0 auto;
}

.msg_default {
	width: 200px;
	height: 90px;
}

.foot_1_word {
	padding-left: 5px;
}

.foot_1_word {
	padding-left: 5px;
}

#foot {
	width: 993px;
	font-size: 14px margin:auto;
}
</style>
</head>

<body>
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/pc/lib/jquery/1.9.1/jquery.min.js"></script>

	<section class="w12 login"> </section>

	<section class="main w12">
	<div class="title">
		<a class="title1 db fl">微信支付</a>
	</div>
	<div class="fr tit2">
		<span class="arr"></span>
	</div>


	<div id="f1">
		<form class="form-horizontal">
			<div class="form-group">
				<div class="weixin">
					<div class="wx_box_fix"
						style="background-image: ../ images/ wxbg_mail_box.png; bottom: -10px; overflow: hidden; padding: 60px 170px 100px; position: relative;">
						<div class="wx_box_area">

							<div class="wx_img_wrapper">

								<img id="payQRImg" class="code" style="border: 1px solid blue; "
									src="${pageContext.request.contextPath }/tempImages/${weixinpay }" />
							</div>
							<div class="msg_default">
								<i class="icon60" style="visibility: hidden"> 支付成功 </i>
								<p id="wx_saomiao">请使用微信扫描</p>
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
