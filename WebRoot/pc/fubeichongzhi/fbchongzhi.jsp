<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>福贝充值</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/fubeichongzhi/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/fubeichongzhi/css/main.css" />
	</head>

	<body>
		<div class="pay">
			<!--主内容开始编辑-->
			<div class="tr_recharge">
				<div class="tr_rechtext">
					<p class="te_retit"><img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/coin.png" alt="" />充值中心</p>
					<p>1.福贝是易乐智能选号系统智慧分析系统的虚拟货币，你可以使用福贝参与站内的公益竞猜、福贝购物。</p>
					<p>2.福贝与人民币换算为1:${xinximap.fubei}，即1元=${xinximap.fubei}福贝，你可以选择支付宝或者是微信的付款方式来进行充值，福贝每次10个起充。</p>
				</div>
				<form action="${pageContext.request.contextPath}/dailichongzhi.do?p=alichongzhi" method="post"  class="am-form" id="doc-vld-msg">
					<div class="tr_rechbox">
					  <c:forEach items="${xinximap.list}" var="xx" varStatus="i" >
						<div class="tr_rechhead">
						
							<img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/ys_head2.jpg" />
							<p>充值帐号：
								<a>${xx.usersName}</a>
							</p>
							<div class="tr_rechheadcion">
								<img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/coin.png" alt="" />
								<span>当前余额：<span>${xx.usersFubei}福贝</span></span>
						
							</div>
						
						</div>
						</c:forEach>
						<div class="tr_rechli am-form-group">
							<ul class="ui-choose am-form-group" id="uc_01">
								<li>
									<label class="am-radio-inline">
								        	<input type="radio" id="jiner1" value="10" name="docVlGender" required data-validation-message="请选择一项充值额度"> 10￥
									    </label>
								</li>
								<li>
									<label class="am-radio-inline">
									        <input type="radio" id="jiner2" name="docVlGender" value="20" data-validation-message="请选择一项充值额度"> 20￥
								      	</label>
								</li>

								<li>
									<label class="am-radio-inline">
									        <input type="radio" id="jiner3" name="docVlGender" value="50" data-validation-message="请选择一项充值额度"> 50￥
								        </label>
								</li>
								<li>
									<label class="am-radio-inline">
									        <input type="radio" id="jiner4" name="docVlGender" value="" data-validation-message="请选择一项充值额度"> 其他金额
								        </label>
								</li>
							</ul>
							
						</div>
						<div class="tr_rechoth am-form-group">
							<span>其他金额：</span>
							<input type="number" min="10" max="10000" value="10" id="qita" class="othbox" data-validation-message="充值金额范围：10-10000元" />
							<!--<p>充值金额范围：10-10000元</p>-->
						</div>
						<div class="tr_rechcho am-form-group">
							<span>充值方式：</span>
							<label class="am-radio">
							        <input type="radio" name="radio1" value="1" data-am-ucheck required data-validation-message="请选择一种充值方式"><img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/wechatpay.png"/>
							    </label>
							<label class="am-radio" style="margin-right:30px;">
							        <input type="radio" name="radio1" value="2" data-am-ucheck data-validation-message="请选择一种充值方式"><img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/zfbpay.png"/>
							    </label>
						</div>
						<div class="tr_rechnum">
							<span>应付金额：</span>
							<p class="rechnum">0.00元</p>
						</div>
					</div>
					<div class="tr_paybox">
						<input type="submit"  id="tijiao" value="确认支付" class="tr_pay am-btn" />
						<span>温馨提示：福贝只限于在公益竞猜中竞猜、福贝购物，遇到问题请拨打联系电话。</span>
					</div>
				</form>
			</div>
		</div>

		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/pc/fubeichongzhi/js/amazeui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/pc/fubeichongzhi/js/ui-choose.js"></script>

		<script type="text/javascript">
			// 将所有.ui-choose实例化
			$('.ui-choose').ui_choose();
			// uc_01 ul 单选
			var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
			uc_01.click = function(index, item) {
				console.log('click', index, item.text())
			};
			uc_01.change = function(index, item) {
				console.log('change', index, item.text())
			};
			$(function() {
				$('#uc_01 li:eq(3)').click(function() {
					$('.tr_rechoth').show();
					$('.tr_rechoth').find("input").attr('required', 'true')
					$('.rechnum').text('10.00元');
				});
				$('#uc_01 li:eq(0)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text('10.00元');
					$('.othbox').val('');
				});
				$('#uc_01 li:eq(1)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text('20.00元');
					$('.othbox').val('');
				});
				$('#uc_01 li:eq(2)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text('50.00元');
					$('.othbox').val('');
				});
				$(document).ready(function() {
					$('.othbox').on('input propertychange', function() {
						var num = $(this).val();
						$('.rechnum').html(num + ".00元");
					});
				});
			});

			$(function() {
				$('#doc-vld-msg').validator({
					onValid: function(validity) {
						$(validity.field).closest('.am-form-group').find('.am-alert').hide();
					},
					onInValid: function(validity) {
						var $field = $(validity.field);
						var $group = $field.closest('.am-form-group');
						var $alert = $group.find('.am-alert');
						// 使用自定义的提示信息 或 插件内置的提示信息
						var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

						if(!$alert.length) {
							$alert = $('<div class="am-alert am-alert-danger"></div>').hide().
							appendTo($group);
						}
						$alert.html(msg).show();
					}
				});
			});
			$("#tijiao").click(function(){
				var qitajiner = $("#qita").val();
				$("#jiner4").val(qitajiner);
			});
		</script>
	</body>
</html>