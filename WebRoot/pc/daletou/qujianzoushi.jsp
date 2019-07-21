<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>前三尾数</title>
</head>
<script src="../js/jquery-3.2.1.js" type="text/javascript"
	charset="utf-8"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="../css/qsws.css" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script type="text/javascript" src="../js/combineData.js"></script>
<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="../js/accordion-single.js"></script>
<script type="text/javascript" src="qujianzoushi.js"></script>
<body>
	<style>
.active {
	background-color: #990000;
	color: white;
}

.active2 {
	background-color: #990000;
	color: white;
}
.wrap ul li{
height:23px !important;
}
.wrap li.active{
background:#990000 !important;
font-weight:bolder;
font-size:13px;
}

.moni_xh2 {
	text-align: center;
	background-color: #EAEEEE;
	font-weight: 400;
	line-height: 24px;
	float: left;
	height: 23px;
	width: 119px;
	font-size: 14px;
	/*margin-left: 28px;*/
}
</style>
	<div style="width: 80%; margin: 0 auto;">
		<!--
            	作者：280191146@qq.com
            	时间：2017-12-02
            	描述：走势图区
            -->
		<div class="" style="padding: 5px; width: 100%;">

			<table class="tabl" border="0" id="qswsTu">
				<thead>
					<tr>
						<th rowspan="2" id="yincang">期号</th>
						<th colspan="15">区间走势</th>
					</tr>
					<tr>
						<th class="num">a</th>
						<th class="num">b</th>
						<th class="num">c</th>
						<th class="num">d</th>
						<th class="num">e</th>
						<th class="num">f</th>
						<th class="num">g</th>
						<th class="num">a</th>
						<th class="num">b</th>
						<th class="num">c</th>
						<th class="num">d</th>
					</tr>

				</thead>
			</table>
			<!--模拟选号  -->
			<!--  <div class="btn btn-group btn_qs" style="margin-top: -57px;margin-left: 820px;">
					<button type="button" class="left btn btn-success btn-sm">◀</button>
					<button type="button" class="right btn btn-success btn-sm">▶</button>
					<button type="button" class="qingkong btn btn-danger btn-sm">清</button>
			        </div> -->


			<!--模拟选号-->
			<div class="mn_xuanhou" style="width: 395px;">
				<div class="wrap" style="padding-top: 10px;">
					<div class="moni_xh2" style="background-color:#F1F1D6;">模拟选号</div>
					<ul id="ul" style="height: 25px;">
					</ul>
				</div>

				<!-- 模拟选号两行 -->
				<div class="konghang" style="padding-top: 10px;margin-top: -21px;">
					<div class="moni_xh2" style="color:#EAEEEE; background-color:#F1F1D6;">空行</div>
					<ul class="ul1" style="height: 25px;">
					</ul>
				</div>
				<div class="konghang" style="padding-top: 10px;margin-top:-21px;">
					<div class="moni_xh2" style="color:#EAEEEE; background-color:#F1F1D6;"">空行</div>
					<ul class="ul1" style="height: 25px;">
					</ul>
				</div>

				<div class="btn btn-group btn_zh" style="margin-top: -80px;margin-left: 420px;width: 200px;">
					<button type="button" class="left btn btn-success btn-sm">◀</button>
					<button type="button" class="right btn btn-success btn-sm">▶</button>
					<button type="button" class="qingkong btn btn-danger btn-sm">清</button>
				</div>
				
				
			</div>
		</div>
		
		<div style="height: 150px;">
		    </div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
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
		//  vip_mokuai = $("#vipxh").addClass("jinyong");
		if (${sessionScope.userinfo.usersType!=1}) {
			vip_mokuai = $("#vipxh").addClass("jinyong");
		}

		$("#vipxh").click(function() {
			// if('${sessionScope.userinfo.usersType}'!=1){
			//   vipchongzhi('会员充值','${pageContext.request.contextPath}/chongzhi.do?p=vipchongzhi','765','490');     
			//}else{
			//   vip_mokuai = $("#vipxh").removeClass("jinyong");
			//    $(".l_f").attr("disabled",false);
			//    $(".btt").attr("disabled",false);  
			// }

			/*       
			      $.ajax({
					url:"${pageContext.request.contextPath}/userinfo.do?p=panduan",
					type:"post",
					data:{x:Math.random()},
					success:function(data){
						if(data=="vip"){
							 vip_mokuai = $("#vipxh").removeClass("jinyong");
						    
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
				}); */
		});

	});
	function vipchongzhi(title, url, w, h) {
		layer_show(title, url, w, h);
	}
</script>

</html>