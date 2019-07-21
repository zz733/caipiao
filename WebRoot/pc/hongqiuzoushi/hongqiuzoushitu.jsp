<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>红球走势</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/css/hongqiuzoushitu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/css/demo.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/css/easydropdown.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/layer/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/jquery.easydropdown.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/combineData.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/accordion-single.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/bootstrap.min.js"></script>
<style type="text/css">
  .table_hq {
	margin: auto;
	text-align: center;
	font-size: 13px;
	border-collapse: collapse;
	border-spacing: 0px;
	border: 0px solid #FFF;
}

.table_hq>thead>tr>th {
	border: 1px solid #FFF;
}

.table_hq>tbody>tr>td {
	border: 1px solid #FFF;
}

.table_hq .num {
	width: 25px;
}

.table_hq thead {
	display: 4;
	background-color: #CFDFF3;
	font-weight: 200;
}

.table_hq th {
	font-weight: 700;
	padding-top: 3px;
	text-align: center;
}

.table_hq tbody {
	background-color: #F7F0F0;
}
  
</style>

</head>

<body>
	<div id="main">

		<table class="table_hq" cellspacing="1" id="hqzsTu" >
			<thead>
				<tr>
					<th rowspan="2" id="yincang" style="font-weight: 900;width:100px;"><div
							id="qq">期号</div></th>
					<th colspan="33">红球走势</th>
					<th rowspan="2">一区</th>
					<th rowspan="2">二区</th>
					<th rowspan="2">三区</th>
				</tr>
				<tr>
					<th class="num" width="24px">1</th>
					<th class="num" width="24px">2</th>
					<th class="num" width="24px">3</th>
					<th class="num" width="24px">4</th>
					<th class="num" width="24px">5</th>
					<th class="num" width="24px">6</th>
					<th class="num" width="24px">7</th>
					<th class="num" width="24px">8</th>
					<th class="num" width="24px">9</th>
					<th class="num" width="24px">10</th>
					<th class="num" width="24px">11</th>
					<th class="num" width="24px">12</th>
					<th class="num" width="24px">13</th>
					<th class="num" width="24px">14</th>
					<th class="num" width="24px">15</th>
					<th class="num" width="24px">16</th>
					<th class="num" width="24px">17</th>
					<th class="num" width="24px">18</th>
					<th class="num" width="24px">19</th>
					<th class="num" width="24px">20</th>
					<th class="num" width="24px">21</th>
					<th class="num" width="24px">22</th>
					<th class="num" width="24px">23</th>
					<th class="num" width="24px">24</th>
					<th class="num" width="24px">25</th>
					<th class="num" width="24px">26</th>
					<th class="num" width="24px">27</th>
					<th class="num" width="24px">28</th>
					<th class="num" width="24px">29</th>
					<th class="num" width="24px">30</th>
					<th class="num" width="24px">31</th>
					<th class="num" width="24px">32</th>
					<th class="num" width="24px">33</th>
				</tr>
			</thead>
		</table>

		<!--
                	作者：280191146@qq.com
                	时间：2017-12-09
                	描述：选号区
               		 -->
		<div style="width: 80%;margin: 0 auto;">
		
			<div class="wrap" style="padding-top: 10px;">

				<div class="moni_xh" style="width:99px;">模拟选号</div>

				<ul id="ul" style="height: 25px;">

				</ul>
			</div>
			<!-- 模拟选号两行 -->
			<div class="konghang" style="padding-top: 10px;margin-top: -11px;">

				<div class="moni_xh" style="margin-top:-9px;width:99px;"></div>

				<ul class="ul1" style="height: 25px;">

				</ul>
			</div>
			 <div class="konghang" style="padding-top: 10px;margin-top: -20px;">

				<div class="moni_xh" style="margin-top:-9px;width:99px;"></div>

				<ul class="ul1" style="height: 25px;">

				</ul>
			</div>
			
			<div class="button_yi"  style="margin-top: -60px;margin-right: -80px;">
				<div class="btn btn-group">
					<button type="button" class="left btn btn-success btn-sm">◀</button>
					<button type="button" class="right btn btn-success btn-sm">▶</button>
					<button type="button" class="qingkong btn btn-danger btn-sm">清</button>

				</div>
			</div>

			<!--vip选号 -->
			<div class="container-fluid">
				<div id="vipxh" class="row"
					style="margin-bottom: 10px;">
					<div class="vipxh_tx col-md-3">
						<p>VIP选号区</p>
						<!--</div>-->
					</div>
					<div class="wrapper col-md-3" id="xiaLa">
						<select ${sessionScope.userinfo.usersType==1?'':'disabled'}  class="dropdown" id="sel" data-settings='{"wrapperClass":"flat"}' onchange="vip_ds()" >
							<option value="0" selected="selected">固定二档</option>
							<option value="1">固定三档</option>
							<option value="2">一区二档</option>
							<option value="3">一区三档</option>
							<option value="4">二区二档</option>
							<option value="5">二区三档</option>
							<option value="6">三区二档</option>
							<option value="7">三区三档</option>
						</select>
					</div>
					<div class="left_right col-md-3"
						style="padding-left: 80px;padding-top: 10px;" >
						<button id="btnLeft" type="button" class="left_index l_f btn btn-primary btn-sm" ${sessionScope.userinfo.usersType==1?'':'disabled'}> ◀</button>
						<ul class="ul_xh">
							<!--<li class="num">01</li>
											<li class="num">02</li>-->
						</ul>
						<button  id="btnRight" type="button"  class="right_index l_f btn btn-primary btn-sm"
							style="margin-top: -12px;" ${sessionScope.userinfo.usersType==1?'':'disabled'}>▶</button>

					</div>
					<div class="col-md-3" style="padding-top: 5px;">
						<div  class="btn-group btn_group" role="group"
							style="display: block;margin-top: 5px;" >
							<!--<button type="button" class="btn btn-primary btn-sm">01</button>-->
						</div>
					</div>
				</div>
			</div>
			
			<div style="height: 150px;">
		    </div>
		</div>
	</div>
</body>


<script type="text/javascript" src="../js/hongqiuzoushitu.js"></script>
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

$(function(){
         if (${sessionScope.userinfo.usersType!=1})
	     {  vip_mokuai = $("#vipxh").addClass("jinyong");}
	   
	
    $("#vipxh").click( function(){
        //if (${empty sessionScope.userinfo})
        //{
        //    vipchongzhi('会员登录','${pageContext.request.contextPath}/pc/yonghudenglu/denglu_sm.jsp','765','490');
        //}
        //else  if('${sessionScope.userinfo.usersType}'!=1){
        //   vipchongzhi('会员充值','${pageContext.request.contextPath}/chongzhi.do?p=vipchongzhi','765','490');     
        //}else{
        //   vip_mokuai = $("#vipxh").removeClass("jinyong");
  		//
        //    $("select").attr("disabled",false);
        //    $(".l_f").attr("disabled",false);
        //   $(".btt").attr("disabled",false);  
        //}
    	$.ajax({
			url:"${pageContext.request.contextPath}/userinfo.do?p=panduan",
			type:"post",
			data:{x:Math.random()},
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