<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>购买中心</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/pc/fubeichongzhi/css/amazeui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/pc/fubeichongzhi/css/main.css" />
</head>

<body>
	<div class="pay">
		<!--主内容开始编辑-->
		<div class="tr_recharge">
			<div class="tr_rechtext">
				<p class="te_retit">
					<img
						src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/coin.png"
						alt="" />购买中心
				</p>
				<p>1.购买的视频无法进行下载，只能够进行线上观看。</p>
				<p>2.您可以选择支付宝或者是微信进行支付，服务方将会给您线上观看的权限。</p>
				<p>3.每一个视频购买的数量额度为1。</p>
			</div>
			<form action="${pageContext.request.contextPath}/dailichongzhi.do?p=alizhifu&gid=${xinximap.gid}" method="post" class="am-form" id="doc-vld-msg">
				<div class="tr_rechbox">
					<c:forEach items="${xinximap.list}" var="xx" varStatus="i">
						<div class="tr_rechhead">
							<img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/ys_head2.jpg" />
							<p>购买帐号： <a>${xx.usersName}</a></p>
						</div>
					</c:forEach>
					<div class="tr_rechcho am-form-group">
						<span>购买方式：</span> <label class="am-radio"> <input
							type="radio" name="radio1" value="1" data-am-ucheck required
							data-validation-message="请选择一种购买方式"><img
							src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/wechatpay.png" />
						</label> <label class="am-radio" style="margin-right:30px;"> <input
							type="radio" name="radio1" value="2" data-am-ucheck
							data-validation-message="请选择一种购买方式"><img
							src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/zfbpay.png" />
						</label>
					</div>
					<div class="tr_rechnum">
						<span>应付金额：</span>
						<input type="hidden" name="docVlGender" value="${xinximap.price }">
						<p class="rechnum">${xinximap.price }元</p>
					</div>
				</div>
				<div class="tr_paybox">
					<input type="submit" id="tijiao" value="确认支付" class="tr_pay am-btn" />
					<span>温馨提示：视频购买之后只限于线上观看，遇到问题请拨打联系电话。</span>
				</div>
			</form>
		</div>
	</div>

	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/pc/fubeichongzhi/js/amazeui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/pc/fubeichongzhi/js/ui-choose.js"></script>

	<script type="text/javascript">
		// 将所有.ui-choose实例化
		$('.ui-choose').ui_choose();
		// uc_01 ul 单选
		var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
		uc_01.click = function(index, item) {
			console.log('click', index, item.text());
		}
		uc_01.change = function(index, item) {
			console.log('change', index, item.text());
		}
		$(function() {
			$(document).ready(function() {
				$('.othbox').on('input propertychange', function() {
					var num = $(this).val();
					$('.rechnum').html(num + ".00元");
				});
			});
		});
		$(function() {
			$('#doc-vld-msg')
					.validator(
							{
								onValid : function(validity) {
									$(validity.field).closest('.am-form-group')
											.find('.am-alert').hide();
								},
								onInValid : function(validity) {
									var $field = $(validity.field);
									var $group = $field
											.closest('.am-form-group');
									var $alert = $group.find('.am-alert');
									// 使用自定义的提示信息 或 插件内置的提示信息
									var msg = $field.data('validationMessage')
											|| this
													.getValidationMessage(validity);

									if (!$alert.length) {
										$alert = $(
												'<div class="am-alert am-alert-danger"></div>')
												.hide().appendTo($group);
									}
									$alert.html(msg).show();
								}
							});
		});
		$("#tijiao").click(function() {
			var qitajiner = $("#qita").val();
			$("#jiner4").val(qitajiner);
		});
	</script>
</body>
</html>