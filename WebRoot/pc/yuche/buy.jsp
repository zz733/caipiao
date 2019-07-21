<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.pojo.Userinfo"%>
<%@page import="weixin.popular.util.JSSDKUtil"%>
<%@page import="weixin.popular.api.QrcodeAPI"%>
<%@page import="weixin.popular.bean.QrcodeTicket"%>
<%@page import="com.listener.WeixinGetAccessTokenListen"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.service.admin.UserService"%>
<%@page import="com.service.pc.UserinfoService"%>
<%@page import="weixin.popular.api.ShorturlAPI"%>

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
		

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
           ApplicationContext  applicationContext  = WebApplicationContextUtils.getWebApplicationContext(application);
           UserinfoService  userService = applicationContext.getBean(UserinfoService.class);
           Userinfo userinfo = (Userinfo)session.getAttribute("userinfo");
		    if (userinfo==null)
		    {
		       out.println("请登录");
		       return;
		    }
		    
		    int id = userinfo.getUsersId();
		    userinfo = userService.findById(id);
		    JSSDKUtil.setJsSdkParam(request);
		
		    QrcodeAPI qrcodeAPI = new QrcodeAPI();
		    //qrcodeAPI.qrcodeCreateTemp(WeixinGetAccessTokenListen.access_token,1800, userinfo.getUsersId().intValue());
		    QrcodeTicket qrcodeTicket = qrcodeAPI.qrcodeCreateFinal(WeixinGetAccessTokenListen.access_token,id);
		    String ticket = qrcodeTicket.getTicket();
		    String url = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket="+ticket;
		    String show_url = new ShorturlAPI().shorturl(WeixinGetAccessTokenListen.access_token,url).getShort_url();
		    

 %>
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
					<p class="te_retit"><img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/coin.png" alt="" />鬼谷子-预测支付</p>
				</div>
				<form target="_blank" onsubmit="toPay()"  action="${pageContext.request.contextPath}/yuche.do?p=saveOrder" method="post"  class="am-form" id="doc-vld-msg">
					<div class="tr_rechbox">
						<div class="tr_rechli am-form-group" style="display: none;">
							<ul class="ui-choose am-form-group" id="uc_01">
								<li>
									<label class="am-radio-inline">
								        		<p class="taocan">获取预测结果，完成支付</p>
								        		<input type="hidden" name="yid" value="${param.yid }" />
								        </label>
								</li>
								
			
							</ul>
							
						</div>
						<div class="tr_rechoth am-form-group">
							<span>其他金额：</span>
							<input type="number" min="10" max="10000" value="10.00" class="othbox" data-validation-message="充值金额范围：10-10000元" />
							<!--<p>充值金额范围：10-10000元</p>-->
						</div>
						<div class="tr_rechcho am-form-group">
							<span>支付方式：</span>
							<label class="am-radio">
							        <input type="radio" name="radio1" value="2" data-am-ucheck required data-validation-message="请选择一种支付方式"><img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/wechatpay.png"/>
							    </label>
							<label class="am-radio" style="margin-right:30px;">
							        <input type="radio" name="radio1" value="1" data-am-ucheck data-validation-message="请选择一种支付方式"><img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/zfbpay.png"/>
							    </label>
						</div>
						<div class="tr_rechnum">
							<span>应付金额：</span>
							<p class="rechnum">${yuchejiage }元</p>
						</div>
					</div>
					<div class="tr_paybox" style="height: 200px;">
						<input type="submit"  value="确认支付" class="tr_pay am-btn"  />
						<span>温馨提示：预测不中，则返回${yucehfanxian}元</span>
						<span id="msg" style="color: red;"></span>
						 <div style="float: right;">
				              <div id="code" style="width: 100%;height: 100%;margin-top: -10px;margin-right: -10px;">
				              </div>
			             </div>
					</div>
				</form>
			</div>
		</div>

		<script
			src="${pageContext.request.contextPath}/weixin/js/jquery-2.1.3.min.js"></script>
		<script 
			src="${pageContext.request.contextPath}/weixin/js/jquery.qrcode.min.js"></script>
			
		<script type="text/javascript" src="${pageContext.request.contextPath}/pc/fubeichongzhi/js/amazeui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/pc/fubeichongzhi/js/ui-choose.js"></script>

		<script type="text/javascript">
		     var bindWX = '<%=userinfo.getUsersBdwx()%>';
		     $(function(){
		          if (bindWX=='1')
		          {
		              $("#msg").html("您已绑定微信");
		          }
		          else
		          {
		              $("#msg").html("微信扫一扫二维码才能返款");
		              $('#code').qrcode({
		                  width: 150,
                          height: 150,
                          text:'<%=show_url%>'
		              }); //二维码链接
		          }
		     
		     });
		
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
			
			function toPay()
			{
			
			   var mylay = parent.layer.getFrameIndex(window.name);
               window.setTimeout(function(){
                 parent.layer.close(mylay);
               },2000);
			  
			}
			
			
		</script>
	</body>

</html>