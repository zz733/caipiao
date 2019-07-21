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
<script type="text/javascript" src="../js/qsws.js"></script>

<body>
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
						<th colspan="15">0-9尾数</th>
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
					</tr>

				</thead>
			</table>

			<!--
                	作者：280191146@qq.com
                	时间：2017-12-02
                	描述：选号区
                -->
			<!--模拟选号-->
			<div class="mn_xuanhou">
				<div style="width: 100%;margin: 0 auto;">

					<div class="wrap" style="padding-top: 10px;">

						<div class="moni_xh">模拟选号</div>

						<ul id="ul" style="height: 25px;">

						</ul>
					</div>

					<!-- 模拟选号两行 -->
					<div class="konghang" style="padding-top: 10px;margin-top: -20px;">

						<div class="moni_xh" style="color:#EAEEEE"></div>

						<ul class="ul1" style="height: 25px;">

						</ul>
					</div>
					<div class="konghang" style="padding-top: 10px;margin-top: -21px;">

						<div class="moni_xh" style="color:#EAEEEE"></div>

						<ul class="ul1" style="height: 25px;">

						</ul>
					</div>

				</div>
				
			</div>
			
			<!--vip选号 -->
			<!--<div style="background-color: #CFDFF3;height: 40px;" id="xh">
				VIP选号
			</div>-->

			<!--vip选号 -->
			<div>
				<div id="vipxh" style="margin-top:20px;height:50px;">
					<div class="vipxh_tx">
						<p>VIP选号区</p>
					</div>
					
				
					<!--自选框-->
					<style>
.vipxh_tx {
	margin: 0px 0px 0px 50px;
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
</style>
					<div class="wrapper">
						<div class="input-group input_group" onload="vip_zx()">
					
						</div>
					</div>
					<!--选二选三-->
					<div class="two_three">
						<div class="btn-group">
							<button type="button" class="btn btn-primary" onclick="_xuanN(2)" ${sessionScope.userinfo.usersType==1?'':'disabled'}>选二</button>
							<button type="button" class="btn btn-primary" onclick="_xuanN(3)" ${sessionScope.userinfo.usersType==1?'':'disabled'}>选三</button>
						</div>
					</div>
					<!--左右移-->
					<div class="left_right" style="padding-top: 15px;">
					<button id="btnLeft" type="button" class="left_index l_f btn btn-primary btn-sm" ${sessionScope.userinfo.usersType==1?'':'disabled'}> ◀</button>
						
						<ul class="ul_xh">
							<!--<li class="li_lf">1</li>
											<li class="li_lf">2</li>-->
						</ul>
						<button  id="btnRight" type="button"  class="right_index l_f btn btn-primary btn-sm"
							style="margin-top: -12px;" ${sessionScope.userinfo.usersType==1?'':'disabled'}>▶</button>
					</div>
                    
                    <div class="btn btn-group btn_qs" style="margin-top:-55px;margin-left:900px;">
					<button type="button" class="left btn btn-success btn-sm">◀</button>
					<button type="button" class="right btn btn-success btn-sm">▶</button>
					<button type="button" class="qingkong btn btn-danger btn-sm">清</button>
			        </div>
                    
                    
				</div>

			</div>
		</div>
		
		 	<div style="height: 150px;">
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
        // if('${sessionScope.userinfo.usersType}'!=1){
        //   vipchongzhi('会员充值','${pageContext.request.contextPath}/chongzhi.do?p=vipchongzhi','765','490');     
        //}else{
        //   vip_mokuai = $("#vipxh").removeClass("jinyong");
        //    $(".l_f").attr("disabled",false);
        //    $(".btt").attr("disabled",false);  
       // }
         
         
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
 		});
    });

});
function vipchongzhi(title,url,w,h){
	layer_show(title,url,w,h);
}
</script>

</html>