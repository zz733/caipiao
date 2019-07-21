<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>综合尾数</title>
<title></title>
</head>
<link rel="stylesheet" href="../css/lqzs.css" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" href="houquzoushi.css" />
<body>
<style>
.jinyong{
    width: 80%;
   position: absolute; 
    z-index: 100;
    background: #CDC9C9;
    opacity: 0.5;
}
</style>

	<div id="main"  style="width: 80%; margin:  0 auto;">
		<!-- 走势图  -->
		<div id="top">
			<div id="head" >
			
			</div>
			<table id="lqzsTu" class="table_lq" border="0" cellspacing="1px">
				<thead>
					<tr>
						<td rowspan="2" width="65px" style="font-weight: 900;"
							id="yincang">期号</td>
						<th colspan="12">后区走势</th>
						<th width="20px" style="background-color:#FFFFFF;"></th>
						<th colspan="10">和尾</th>
					</tr>
					<tr>
						<th class="num">01</th>
						<th class="num">02</th>
						<th class="num">03</th>
						<th class="num">04</th>
						<th class="num">05</th>
						<th class="num">06</th>
						<th class="num">07</th>
						<th class="num">08</th>
						<th class="num">09</th>
						<th class="num">10</th>
						<th class="num">11</th>
						<th class="num">12</th>
						<th class="num" style="background-color:#FFFFFF;"></th>
						<th class="numqt">0</th>
						<th class="numqt">1</th>
						<th class="numqt">2</th>
						<th class="numqt">3</th>
						<th class="numqt">4</th>
						<th class="numqt">5</th>
						<th class="numqt">6</th>
						<th class="numqt">7</th>
						<th class="numqt">8</th>
						<th class="numqt">9</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div>
				<div id="vipxh" style="margin-top:60px;height:50px;background-color: #CFDFF3;">
					<div class="vipxh_tx">
						<p>VIP选号区</p>
					</div>
					<!--自选框-->
					<style>
.vipxh_tx {
	margin: 0px 0px 18px 80px;
}
.input_group .in {
	width: 35px;
}
.input_group {
	margin: -47px 0px 0px 280px;
}

.two_three {
	margin: -33px 0px 0px 540px;	
}

.left_right {
	margin: -46px 0px 0px 700px;
}
.Selectbig{
	height: 35px;
	width:200px;
	background-color: #A3C5E1;
	border-radius:5px;
	color: white;
	border: none;	
    /* margin-left: 20%;*/
  border: none;
  outline: none;
  /*将默认的select选择框样式清除*/
 appearance:none;
 -moz-appearance:none;
 -webkit-appearance:none;
 -ms-appearance:none;
}
 select::-ms-expand { display: none; }
.Select{
	margin-left: 310px;
	/* margin-top: -47px; */
}
.xx{
width:20px;
heigth:20px;
margin-left:-25px;
margin-top:3px;
color:white;
}
.active,.active2{
	background-color: #3370B0 !important;
	color: white;
	font-weight: bold;
}
.vipxh_tx p {
	font-weight: 600;
	font-size: 26px;
	margin-left: 30px;
	margin-top: 7px;
	color: red;
	position: relative;
    top: 1px;
    width: 150px;
}
.btnleft{
float:left;
height:40px;
margin-left: 325px;
margin-top: -27px;
}
.btnul{
float:left;
}
.left2{
position:relative;
left:-106px;
}
.right2{
position:relative;
left:-41px;
}
.numright{
margin-left:-200px;
margin-top:-27px;
}
.btnnum{
width:35px;
height:35px;
text-align:center;
border:1px solid #D4D4D4;
	border-radius:2px;
	background-color:#FFFFFF;
}
</style>
					<div class="wrapper">
						<div class="input-group input_group" onload="vip_zx()">
						</div>
					</div>
				<div class="btn btn-group btn_lq" style="margin-top: -140px;margin-left: 684px;">
					 <button type="button" class="left btn btn-success btn-sm">◀</button>
					<button type="button" class="right btn btn-success btn-sm">▶</button>
					<button type="button" class="qingkong btn btn-danger btn-sm">清</button>
				</div>
				<div class="btnleft">
						<button type="button" class="btn btn-primary left2">◀</button>
						<ul class="btnul" id="btnul">
						</ul>
						<button type="button"  class="btn btn-primary right2">▶</button>
					</div>
					<div class="numright">
						<ul class="btnul2" id="btnul2">
						</ul>
					</div> 
					
					<div style="height: 150px;">
		        </div>
		</div>
</body>
<script type="text/javascript" src="../js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.actual.js"></script>
<script type="text/javascript" src="../js/raphael/v2.1.0/raphael.js"></script>
<script type="text/javascript"
	src="../js/draw2d/jquery-ui-1.8.23.custom.min.js"></script>
	
<script type="text/javascript" src="../js/draw2d/Class.js"></script>
<script type="text/javascript" src="../js/draw2d/draw2d.js"></script>
<script type="text/javascript" src="houquzoushi.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>

<script type="text/javascript">

	$(function(){
		 vip_mokuai = $("#vipxh").addClass("jinyong");
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
	       /*   17352654532 */
	         $.ajax({
	 			url:"${pageContext.request.contextPath}/userinfo.do?p=panduan",
	 			type:"post",
			    sdata:{x:Math.random()},
	 			
	 			success:function(data){
	 				if(data=="vip"){
	 					 vip_mokuai = $("#vipxh").removeClass("jinyong");
	 				     /* $("select").attr("disabled",false);
	 				     $(".l_f").attr("disabled",false);
	 				     $(".btt").attr("disabled",false); */ 
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