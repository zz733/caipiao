<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录-易乐智能选号系统</title>

		<c:set var="path" value="${pageContext.request.contextPath }"></c:set>


		<!--  <link rel="stylesheet" type="text/css" href="../css/denglu.css" /> -->
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css"
			type="text/css">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/pc/css/login.css" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/admin/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/pc/Hui-iconfont/1.0.8/iconfont.css">

		<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
		<head>
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
		</head>


		<!--登录和注册-->
		<body>
			<div id="main">

				<div>
					<div class="ln_gzform" style="float: left; margin-left: 220px;">
						<form class="f" id="f">
							<div class="login_info">
								<div class="text" style="margin-top: 20px;">
									<span class="sp1"> <i class="icon Hui-iconfont">&#xe696;</i>
									</span>

									<input type="text" maxlength="50" id=username name="username"
										class="text_name" placeholder="手机号码" style="border: 0px;" />

								</div>
								<div class="text">
									<span class="sp2"> <i class="icon Hui-iconfont">&#xe63f;</i>
									</span>
									<input type="password" maxlength="50" id="uPass"
										name="password" class="text_password" placeholder="密码"
										style="border: 0px;" />
								</div>

								<div class="text">
									<input type="tel" maxlength="50" id="udh" name="yzm"
										class="text_password1" placeholder="&nbsp;&nbsp;验证码"
										style="border: 0px;" />
									<img id="imgyzm" name="imgyzm"
										src="${pageContext.request.contextPath}/yanzhen.do?p=getCode"
										style="margin-top: -40px; margin-left: 160px; height: 40px; width: 100px">
								</div>
								<div class="tj">
									<!-- <input type="button" id="login_a" maxlength="50"  class="text-dl" value="登录"/> -->
									<button id="login_a" class="text-dl" type="submit">
										立 &nbsp; 即 &nbsp; 登 &nbsp;录
									</button>
								</div>
								<a target="_blank" href="zhuce.jsp" id="zhuce"><span
									id="span" style="margin-left: 40px; right: 30px;">注册账号</span> </a>
								<a target="_blank" href="forgetmima.jsp" id="forget"><span
									id="span" style="top: 280px; margin-left: 130px;">忘记密码</span> </a>
							</div>
						</form>

					</div>
				</div>
			</div>

		</body>
		<script type="text/javascript">
	//验证码看不清
	$(function() {
		$("#imgyzm")
				.click(
						function() {

							var timestamp = new Date().getTime();
							document.getElementById("imgyzm").src = "${pageContext.request.contextPath}/yanzhen.do?p=getCode&x="
									+ timestamp;
						});

	});

	$(function() {

		$("#f")
				.validate(
						{
							submitHandler : function(form) {
								document.getElementById("login_a").innerHTML = "正在登录...";
								$(form)
										.ajaxSubmit(
												{
													type : 'post',
													url : "${pageContext.request.contextPath}/yonghuLogin.do?p=login2&yid=${param.yid}",
													success : function(data) {
                                                       
														switch (data) {

														case "0":
															//登录成功，没有购买
															location = "${pageContext.request.contextPath}/yuche.do?p=toPayView&yid=${param.yid}";
															break;
														case "-1":
															document
																	.getElementById("login_a").innerHTML = "立 &nbsp; 即  &nbsp;   登  &nbsp;录";
															document
																	.getElementById("udh").value = "";
															document
																	.getElementById("imgyzm").src = "${pageContext.request.contextPath}/yanzhen.do?p=getCode&x="
																	+ timestamp;
															//alert("验证码错误");
															layer
																	.msg(
																			'验证码错误!',
																			{
																				icon : 5,
																				time : 1000
																			});
															break;
														case "-2":
															document
																	.getElementById("login_a").innerHTML = "立 &nbsp; 即  &nbsp;   登  &nbsp;录·";
															var timestamp = new Date()
																	.getTime();
															document
																	.getElementById("imgyzm").src = "${pageContext.request.contextPath}/yanzhen.do?p=getCode&x="
																	+ timestamp;
															//alert("用户名或密码错误");
															layer
																	.msg(
																			'用户名或密码错误!',
																			{
																				icon : 5,
																				time : 1000
																			});
															break;
														default: //正常
														    
														    var json = eval("("+data+")");
															layer
																	.open( {
																		title : json.caipiaoType.name
																				+ "第"
																				+ json.caipiaoQishu
																				+ "期预测",
																		//skin : 'layui-layer-rim', //加上边框
																		area : [
																				'900px',
																				'600px' ], //宽高
																		content : json.neirong,
																		type : 1
																	});

															break;

														}
													},
													error : function(
															XmlHttpRequest,
															textStatus,
															errorThrown) {
														alert("请求对象XMLHttpRequest: "
																+ XMLHttpRequest);
														alert("错误类型textStatus: "
																+ textStatus);
														alert("异常对象errorThrown: "
																+ errorThrown);
													}
												});

							}
						});
	});
</script>
</html>