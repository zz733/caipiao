<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>后三尾数</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/pc/3d/hswh.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/combineData.js"></script>
<script type="text/javascript"
	<script type="text/javascript" 
    src="${pageContext.request.contextPath}/pc/js/layer/layer.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/accordion-single.js"></script>
	
	
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60502",secure:"60507"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1153" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/3d/hsws.jsp">
<div style="width:1200px;margin:auto;" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1153" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/3d/hsws.jsp">
	 <div style="width: 100%; margin: auto;">
		<!--
            	作者：280191146@qq.com
            	时间：2017-12-02
            	描述：走势图区
            -->
		<div class="" style="padding: 5px; width: 100%;border: 0px solid red;">
			<table class="tabl" border="1" style="width:1160px;"
				id="hswsTu">
				<thead>
					<tr>
						<th rowspan="2" id="yincang">期号</th>
						<th colspan="15">0-9尾数</th>
						<th colspan="10">跨度</th>
						<th colspan="10">和尾</th>
						<th colspan="2">
								和值
							</th>
							<th colspan="3" >
								和值除3
							</th>
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
						<th class="num">5</th>
						<th class="num">6</th>
						<th class="num">7</th>
						<th class="num">8</th>
						<th class="num">9</th>
						<th class="num">
								单
							</th>
							<th class="num">
								双
							</th>

							<th class="num">
								0
							</th>
							<th class="num">
								1
							</th>
							<th class="num">
								2
							</th>
					</tr>
				</thead>
			</table>
			
			<!--
                	作者：280191146@qq.com
                	时间：2017-12-02
                	描述：选号区
                -->
			<!--模拟选号-->
			 <style>
			#center{
			width: 100%;
			height: 110px;
			margin:0px auto;
			}
			</style>
	
</div> 
<div id="Move">
 <div class="btn btn-group btn_hs" style="float:right;">
						<button type="button" class="left btn btn-success btn-sm">◀</button>
						<button type="button" class="right btn btn-success btn-sm">▶</button>
						<button type="button" class="qingkong btn btn-danger btn-sm">清</button>
</div>

  <div style="height: 200px;">
  </div>
</div>
<style>
.vipxh_tx {
	margin: 0px 0px 0px 50px;
}

.input_group .in {
	width: 35px;
}

.input_group {
	margin: -46px 0px 0px 270px;
}

.two_three {
	margin: -55px 0px 0px 480px;
}

.left_right {
	margin: -46px 0px 0px 710px;
}
.container{
padding:0px;
margin:0px;
}
.xx{
width:20px;
heigth:20px;
margin-left:-25px;
margin-top:3px;
color:white;
}
</style>

			<!--vip选号 -->
		<div style="margin:0px auto;width:100%;">	
			<div class="container" style="width:1200px;">
		<div style="display: block;">
				<div id="vipxh" style="height:50px;">
					<div class="vipxh_tx">
						<p>VIP选号区</p>
					</div>
					<!--自选框-->
					<!--选组-->
						<div class="Select">
						<select style="text-align:center;color: black;width: auto;
						padding: 0 10%;
							margin: 0;" class="Selectbig" id="group">
							<option value="0" selected="selected" style="text-align: center;color: black;">组三</option>
							<option value="1" style="text-align: center;color: black;">组六</option>
						</select>
						<span class="xx">▼</span>
					</div>
					<div class="btnleft">
						<button type="button" class="btn btn-primary left2">◀</button>
						<ul class="btnul" id="btnul">
						</ul>
						<button type="button"  class="btn btn-primary right2">▶</button>
					</div>
					<div class="numright">
						<span style="position:relative;top:9px;">跨度：</span>
						<ul class="btnul2" id="btnul2">
						</ul>
					</div> 
				</div>
			</div>
		</div>
			</div>
			
		</div>
	</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    
	$(function() {
	   
		// vip_mokuai = $("#vipxh").addClass("jinyong");
		if (${sessionScope.userinfo.usersType!=1}) {
			 vip_mokuai = $("#vipxh").addClass("jinyong");
		}
		$("#vipxh")
				.click(
						function() {
							//    if('${sessionScope.userinfo.usersType}'!=1){
							//      vipchongzhi('会员充值','${pageContext.request.contextPath}/chongzhi.do?p=vipchongzhi','765','490');     
							//   }else{
							//      vip_mokuai = $("#vipxh").removeClass("jinyong");
							//       $(".l_f").attr("disabled",false);
							//       $(".btt").attr("disabled",false);  
							//   }

							$
									.ajax({
										url : "${pageContext.request.contextPath}/userinfo.do?p=panduan",
										type : "post",
										data : {
											x : Math.random()
										},
										success : function(data) {
											if (data == "vip") {
												vip_mokuai = $("#vipxh")
														.removeClass("jinyong");
												$(".l_f").attr("disabled",
														false);
												$(".btt").attr("disabled",
														false);
											} else if (data == "novip") {
												vipchongzhi(
														'会员充值',
														'${pageContext.request.contextPath}/chongzhi.do?p=vipchongzhi',
														'765', '490');
											} else {
												vipchongzhi(
														'会员登录',
														'${pageContext.request.contextPath}/pc/yonghudenglu/denglu_3d.jsp',
														'765', '490');
											}

										},
										error : function(data, status, e) {
											alert(e);
										}
									});
						}); 

	});
	function vipchongzhi(title, url, w, h) {
		layer_show(title, url, w, h);
	}
</script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/jquery.actual.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/raphael/v2.1.0/raphael.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/draw2d/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/draw2d/Class.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/draw2d/draw2d.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/3d/hsws2.js?1234567"></script>

</html>


