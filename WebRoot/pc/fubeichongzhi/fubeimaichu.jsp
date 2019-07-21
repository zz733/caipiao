<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>福贝卖出</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/fubeichongzhi/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/fubeichongzhi/css/main.css" />
		
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/bootstrap.min.js"></script>
	
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
            #maichujine{
                width: 250px;
				height:35px;
				margin:-30px 0px 0px 80px;
				border-radius:6px; 
            }
            .tr_maichu{
               margin-top:15px;
            }
            .kemaichu_txt{
             width: 80px;
			 height:35px;
			 color:gray;
			 margin:0px 0px 0px 400px;
            }
            .kemaichu{
                width: 30px;
				height:35px;
				font-weight:600;
				color:red;
            }
            .mcjl{
                cursor:pointer;
            }
	    </style>
	</head>

	<body>
		<div class="pay">
			<!--主内容开始编辑-->
			<div class="tr_recharge">
				<div class="tr_rechtext">
					<p class="te_retit"><img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/coin.png" alt="" />福呗卖出</p>
				</div>
				<form  class="am-form" id="doc-vld-msg">
					<div class="tr_rechbox">
						<div class="tr_maichu am-form-group">
						  <span>卖出金额：</span>
						  <input type="text"  id="maichujine" name="docVlGender" class="form-control" placeholder="请输入您要卖出的金额" value="" oninput="myMaichu()" onBlur="panduan()"/>
						  <span class="kemaichu_txt">可卖出金额：
						  <c:forEach items="${xinximap.list}" var="xx" varStatus="i" >
						  <span class="kemaichu" id="yuer" value="${xx.usersFubei}">${xx.usersFubei}</span>
						  </c:forEach>
						 元</span>
						</div>
						<div class="tr_rechcho am-form-group">
							<span>卖出到：</span>
							<label class="am-radio">
							        <input type="radio" name="radio1" value="1" data-am-ucheck required data-validation-message="请选择一种充值方式"><img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/wechatpay.png"/>
							    </label>
							<label class="am-radio" style="margin-right:30px;">
							        <input type="radio" name="radio1" value="2" data-am-ucheck data-validation-message="请选择一种充值方式"><img src="${pageContext.request.contextPath}/pc/fubeichongzhi/images/zfbpay.png"/>
							    </label>
						</div>
						<div class="tr_rechnum">
							<span>卖出金额：</span>
							<p class="rechnum" id="jine_red" >0.00元</p>
						</div>
					</div>
					<div class="tr_paybox">
						<input type="button" value="确认卖出" id="maichubtn"  onclick="tijiao()" class="tr_pay am-btn" />
						<span><a class="mcjl" href="${pageContext.request.contextPath }/tixian.do?p=Alltixianrecord"  target="zh">查看卖出记录>></a></span>
					</div>
				</form>
			</div>
		</div>

		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/pc/fubeichongzhi/js/amazeui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/pc/fubeichongzhi/js/ui-choose.js"></script>
		<!--/返回顶部--> 
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->
	
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/laypage/1.2/laypage.js"></script>
		<script type="text/javascript">
		   
			function panduan(){
				var yuer = $("#yuer").text();
				var x = $("#maichujine").val();
				
				if(parseInt(x)>parseInt(yuer)){
					$("#maichubtn").attr("disabled",true);  
					layer.msg('余额不足!',{icon:2,time:1000});			
				}
				else
					{
					$("#maichubtn").attr("disabled",false);  
					}
			}
		   function myMaichu() {  
			   
		       var x = $("#maichujine").val();
		       $("#maichujine").val(x);
		       $("#jine_red").html(x+".00元");
		       
		       /*
                var x = document.getElementById("maichujine").value;  
                document.getElementById("jine_red").innerHTML = x;  
                */
           }
		   
		   
			
			
			
			$(function() {
			
			   // 将所有.ui-choose实例化
			/*   
			$('.ui-choose').ui_choose();
			// uc_01 ul 单选
			var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
			uc_01.click = function(index, item) {
				console.log('click', index, item.text())
			}
			uc_01.change = function(index, item) {
				console.log('change', index, item.text())
			} */s
			
			
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
			
			function tijiao() {
				   var qian = $("#maichujine").val();
				   var type = $("input[type='radio']:checked").val();
					
					$.ajax({
						url :"${pageContext.request.contextPath}/tixian.do?p=addtixianrecord",
						type : "post",
						data : {"docVlGender":qian,"radio1":type},
						success : function(data) {
						    
							if(data=="true"){
								alert("OK")
								layer.msg('申请提现成功!',{icon:6,time:1000});
								parent.location.reload();
							}
							else if(data=="false"){
								alert("NO OK")
								layer.msg('申请提现失败!',{icon:2,time:1000});	
								parent.location.reload();
							}
							else if(data=="bdwx"){
								alert("绑定微信")
								layer.msg('请绑定微信!',{icon:2,time:1000});	
								window.location.href="${pageContext.request.contextPath}/weixinguanzhu.do?w=idandUrltoT2D";
							}
							else{
								alert("绑定支付宝")
								layer.msg('改商家暂未开通支付宝提现!',{icon:2,time:3000});	
								parent.location.reload();
							}
							
							
						},
						error:function(xhr,msg,obj){
						    alert("error:"+msg);
							layer.msg('申请提现失败!',{icon:2,time:1000});	
							location.reload();
							}
						});
				}
		</script>
	</body>

</html>