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
  .table_hq td{
  width:0px;
  }
  .active{
  background-color:rgb(174, 0, 0) !important;
  color:#FFF !important;
  }
    .active2{
  background-color:rgb(174, 0, 0) !important;
  color:#FFF !important;
  }
    .active3{
  background-color:rgb(174, 0, 0) !important;
  color:#FFF !important;
  }
  #vipxh {
    background-color: #CFDFF3;
    border: 1px solid lightgray;
}
.jinyong {
    width: 80%;
    position: absolute;
    z-index: 100;
    background: #CDC9C9;
    filter: alpha(Opacity=70);
    -moz-opacity: 0.2;
    opacity: 0.5;
}
.vipxh_tx p {
    font-weight: 600;
    font-size: 26px;
    margin-left: 30px;
    margin-top: 7px;
    color: red;
}
.Select {
    margin-left:230px;
    margin-top: -45px;
    background: #428BCB;
    padding: 4px 0px 8px;
    width: 200px;
    border-radius: 5px;
}
.left_right {
    padding-left: 100px;
}
select {   
      /*Chrome和Firefox里面的边框是不一样的，所以复写了一下*/  
      border: solid 1px #000;   
      /*很关键：将默认的select选择框样式清除*/  
      appearance:none;   
      -moz-appearance:none;   
      -webkit-appearance:none;   
      /*在选择框的最右侧中间显示小箭头图片*/  
      background: url("http://ourjs.github.io/static/2015/arrow.png") no-repeat scroll rightright center transparent;   
      /*为下拉小箭头留出一点位置，避免被文字覆盖*/  
      padding-right: 14px;   
    }   
    /*清除ie的默认选择框样式清除，隐藏下拉箭头*/  
    select::-ms-expand { display: none;
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
					<th rowspan="2" style="width: 55px;">一区</th>
					<th rowspan="2" style="width: 55px;">二区</th>
					<th rowspan="2" style="width: 55px;">三区</th>
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
			<!--模拟选号-->
		 <div class="btn btn-group btn_zh" style="margin-top: -50px;float: right;">
			        <button type="button" class="left btn btn-success btn-sm">◀</button>
					<button type="button" class="right btn btn-success btn-sm">▶</button>
					<button type="button" class="qingkong btn btn-danger btn-sm">清</button>
	     </div>
	     <!--vip选号-->
		<div class="container-fluid">
			<div id="vipxh" style="margin-top: 80px;margin-bottom: 10px;height: 50px;">
				<div class="vipxh_tx" >
					<p>VIP选号区</p>
			    </div>
				 <div class="Select">
						<select  class="Selectbig" onchange="change()" id="group" style="color: black;width: auto;padding: 0 10%;margin:0;padding:0 10%;margin: 0;width: 175px;border: none;  background: #428BCB;">
							<option value="0" selected="selected" color: black;">固定二档</option>
							<option value="1" style="color: black;">固定三档</option>
							<option value="2" style="color: black;">一区二档</option>
							<option value="2" style="color: black;">一区三档</option>
							<option value="2" style="color: black;">二区二档</option>
							<option value="2" style="color: black;">二区三档</option>
							<option value="2" style="color: black;">三区二档</option>
							<option value="2" style="color: black;">三区三档</option>
						</select>
						<span class="xx">▼</span>
					</div>
						<div class="left_right" style="margin:-30px 0px 0px 416px;">
						<button id="btnLeft" class="left_index l_f btn btn-primary btn-sm" ${sessionScope.userinfo.usersType==1?'':''}>◀</button>
						<ul class="btnul" id="btnul">
						</ul>
						<!-- <span style="position:relative;top:9px;">跨度：</span> ${sessionScope.userinfo.usersType==1?'':''}-->
						<!-- <button  id="btnRight" type="button"  class="right_index btn-primary btn-sm" >▶</button> -->	
						
						</div>
						<ul class="btnul2" id="btnul2" style="margin-top: -45px;float:right;">
						</ul>
						<div style="margin-left:80%;margin-top:-40px;width:180px;">
								<div class="btn-group btn_group" role="group" style="display: block;margin-top: 5px;">
									    <!--<button type="button" class="btn btn-primary btn-sm">01</button>-->
								</div>
						</div>
			</div>	
						</div>
			<div style="width:100%;height:230px;"></div>
	     
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