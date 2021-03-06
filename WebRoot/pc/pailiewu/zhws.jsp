<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60502",secure:"60507"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
	<script src="../js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="../css/zhws.css" />
	<link rel="stylesheet" type="text/css" href="../css/demo.css" />
	<link rel="stylesheet" type="text/css" href="../css/easydropdown.css" />
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../js/layer/layer.js"></script>
    <script type="text/javascript" src="../js/zhws.js" ></script>
    <script type="text/javascript" src="../js/jquery.easydropdown.js" ></script>
	<script type="text/javascript" src="../js/combineData.js" ></script>
	<script type="text/javascript" src="../js/accordion-single.js" ></script>
	<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1308" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/pailiewu/zhws.jsp">
		
		<div style="width: 80%; margin:  0 auto;" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1308" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/pailiewu/zhws.jsp">
		<!--走势图-->
		<div class="" style="padding: 5px; ">
		<table class="table_zh" border="0" id="zhwsTu" cellspacing="1px">
					<thead>
						<tr>
							<th rowspan="2" id="yincang" style="font-weight: 900;">期号</th>
							<th colspan="15" style="font-weight: 900;">综合尾号走势</th>
							<th colspan="3">012路</th>
						</tr>
						<tr>
							<th class="num">0</th>
							<th class="num">1</th>
							<th class="num">2</th>
							<th class="num">3</th>
							<th class="num">4</th>
							<th class="num">5</th>
							<th class="num">6</th>
							<th class="num">7</th>
							<th class="num">8</th>
							<th class="num">9</th>
							<th class="num">0</th>
							<th class="num">1</th>
							<th class="num">2</th>
							<th class="num">3</th>
							<th class="num">4</th>
							<th class="num_other">0</th>
							<th class="num_other">1</th>
							<th class="num_other">2</th>
						</tr>

					</thead>
				</table>
		</div>
		
		<!--模拟选号-->
		<div class="mn_xuanhou">
	
			<div class="wrap" style="padding-top: 10px;">

				<div class="moni_xh">模拟选号</div>

				<ul id="ul" style="height: 25px;">

				</ul>
		   </div>
			
			<!-- 模拟选号两行 -->
			<div class="konghang" style="padding-top: 10px;margin-top: -21px;">

				<div class="moni_xh" style="color:#EAEEEE">空行</div>

				<ul class="ul1" style="height: 25px;">

				</ul>
			</div>
			<div class="konghang" style="padding-top: 10px;margin-top: -21px;">

				<div class="moni_xh" style="color:#EAEEEE">空行</div>

				<ul class="ul1" style="height: 25px;">

				</ul>
			</div>

		<div class="btn btn-group btn_zh" style="margin-top: -50px;">
			        <button type="button" class="left btn btn-success btn-sm">◀</button>
					<button type="button" class="right btn btn-success btn-sm">▶</button>
					<button type="button" class="qingkong btn btn-danger btn-sm">清</button>
	                      
        </div>
	</div>
		
		<!--vip选号-->
		<div class="container-fluid">
			<div id="vipxh" style="margin-top: 10px;margin-bottom: 10px;height: 50px;">
				<div class="vipxh_tx" >
					<p>VIP选号区</p>
			    </div>
				<div class="wrapper" id="xiaLa" style="margin: -46px 0px 0px 250px;">
						<select  ${sessionScope.userinfo.usersType==1?'':'disabled'} class="dropdown" id="sel" data-settings='{"wrapperClass":"flat"}' onchange="vip_ds()">
							<option value="0" selected="selected">选四</option>
							<option value="1">选五</option>
							<option value="2">选六</option>
						</select>
				 </div>
						<div class="left_right" style="margin: -40px 0px 0px 450px;">
						<button id="btnLeft" type="button" class="left_index l_f btn btn-primary btn-sm" ${sessionScope.userinfo.usersType==1?'':'disabled'}>◀</button>
								<ul class="ul_xh">
											<!--<li class="num">01</li>
											<li class="num">02</li>-->
								</ul>
								<button  id="btnRight" type="button"  class="right_index l_f btn btn-primary btn-sm" ${sessionScope.userinfo.usersType==1?'':'disabled'}>▶</button>
							
									
						</div>
						<div style="margin-left:80%;margin-top:-40px;width:180px;">
								<div class="btn-group btn_group" role="group" style="display: block;margin-top: 5px;">
									    <!--<button type="button" class="btn btn-primary btn-sm">01</button>-->
									    
									    
								</div>
						</div>
								
			</div>
							
							
						</div>
	
		
		
		</div>

	</body>
	
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

	$(function(){
		 //  vip_mokuai = $("#vipxh").addClass("jinyong");
		  if (${sessionScope.userinfo.usersType!=1})
	     {  vip_mokuai = $("#vipxh").addClass("jinyong");} 
		
	    $("#vipxh").click( function(){
	       //  if('${sessionScope.userinfo.usersType}'!=1){
	       //    vipchongzhi('会员充值','${pageContext.request.contextPath}/chongzhi.do?p=vipchongzhi','765','490');     
	       // }else{
	       //    vip_mokuai = $("#vipxh").removeClass("jinyong");
	  //
	        //    $("select").attr("disabled",false);
	       //     $(".l_f").attr("disabled",false);
	        //    $(".btt").attr("disabled",false);  
	        //}
	         
	         $.ajax({
	 			url:"${pageContext.request.contextPath}/userinfo.do?p=panduan",
	 			type:"post",
			    sdata:{x:Math.random()},
	 			
	 			success:function(data){
	 				if(data=="vip"){
	 					 vip_mokuai = $("#vipxh").removeClass("jinyong");
	 				     $("select").attr("disabled",false);
	 				     $(".l_f").attr("disabled",false);
	 				     $(".btt").attr("disabled",false); 
	 				}
	 				else if(data=="novip"){
	 					vipchongzhi('会员充值','${pageContext.request.contextPath}/chongzhi.do?p=vipchongzhi','765','490');     
	 				}
	 				else{
	 					vipchongzhi('会员登录','${pageContext.request.contextPath}/pc/yonghudenglu/denglu_sm.jsp','765','490');
	 				}
	 			  
	 			},
	 			error:function(data,status,e){
	 				alert(e);
	 			}
	 		});
	    });
	
	});
	function vipchongzhi(title,url,w,h){
		layer_show(title,url,w,h);
	}
</script>
</html>
