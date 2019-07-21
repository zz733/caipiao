<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>福贝充值</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/fubeichongzhi/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/fubeichongzhi/css/main.css" />
	
	    <style>
	    	.pay{
	    	  width:85%;
	    	}
	    	
			ul.ui-choose>li {
				width: 150px;
				height: 70px;
				display: block;
				margin: 0;
				padding: 0;
				font-size: 16px;
				line-height: 48px;
				color: #999;
				background: #fff;
				-webkit-border-radius: 3px;
				-moz-border-radius: 3px;
				border-radius: 3px;
				cursor: pointer;
				margin-left: 30px;
				text-align: center;
				border: 2px solid #CCCCCC;
			}
           .taocan{
           	color: black;
           	font-weight: 500;
           	font-size: 16px;
           	margin-top: 21px;
           }
           .money{
           	color: red;
           	font-weight: 900;
           	font-size: 20px;
           }
	    </style>
	</head>

	<body>
		<div class="pay">
			<!--主内容开始编辑-->
			<div class="tr_recharge">
				<div class="tr_rechtext">
					<p class="te_retit"><img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/coin.png" alt="" />立即开通VIP</p>
				</div>
				<form target="_blank"  action="${pageContext.request.contextPath}/dailichongzhi.do?p=vipchongzhi" method="post"  class="am-form" id="doc-vld-msg">
					<div class="tr_rechbox">
						<div class="tr_rechli am-form-group">
							<ul class="ui-choose am-form-group" id="uc_01">
								<li>
									<label class="am-radio-inline">
								        	<input type="radio"  value="${csmap.sanyue}" name="docVlGender" required data-validation-message="请选择一项充值额度">
								        		<p class="taocan">三个月<span class="money">&nbsp;${csmap.sanyue}&nbsp;</span>元</p>
								        </label>
								</li>
								<li>
									<label class="am-radio-inline">
									        <input type="radio" name="docVlGender" value="${csmap.yinian}" data-validation-message="请选择一项充值额度">
									        	<p class="taocan">一年<span class="money">&nbsp;${csmap.yinian}&nbsp;</span>元</p>
									        
								      	</label>
								</li>

								<li>
									<label class="am-radio-inline">
									        <input type="radio" name="docVlGender" value="${csmap.twonian}" data-validation-message="请选择一项充值额度">
									        	<p class="taocan">两年<span class="money">&nbsp;${csmap.twonian}&nbsp;</span>元</p>
									       
								        </label>
								</li>
			
							</ul>
							
						</div>
						<div class="tr_rechoth am-form-group">
							<span>其他金额：</span>
							<input type="number" min="10" max="10000" value="10.00元" class="othbox" data-validation-message="充值金额范围：10-10000元" />
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
						<input type="submit" value="确认支付" class="tr_pay am-btn"  />
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
			}
			uc_01.change = function(index, item) {
				console.log('change', index, item.text())
			}
			$(function() {
				var sanyue = ${csmap.sanyue}+".00元";
				var yinian = ${csmap.yinian}+".00元";
				var twonian = ${csmap.twonian}+".00元";
				$('#uc_01 li:eq(3)').click(function() {
					$('.tr_rechoth').show();
					$('.tr_rechoth').find("input").attr('required', 'true')
					$('.rechnum').text(sanyue);
				})
				$('#uc_01 li:eq(0)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text(sanyue);
					$('.othbox').val('');
				})
				$('#uc_01 li:eq(1)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text(yinian);
					$('.othbox').val('');
				})
				$('#uc_01 li:eq(2)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text(twonian);
					$('.othbox').val('');
				})
				$(document).ready(function() {
					$('.othbox').on('input propertychange', function() {
						var num = $(this).val();
						//$('.rechnum').html(num + ".00元");
					});
				});
			})

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
			
			
		</script>
	</body>

</html>