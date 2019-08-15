<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<script src="../js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="../css/zhws.css" />
	<link rel="stylesheet" type="text/css" href="../css/demo.css" />
	<link rel="stylesheet" type="text/css" href="../css/easydropdown.css" />
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../js/layer/layer.js"></script>
    <script type="text/javascript" src="../js/jquery.easydropdown.js" ></script>
	<script type="text/javascript" src="../js/combineData.js" ></script>
	<script type="text/javascript" src="../js/accordion-single.js" ></script>
	
	<script src="../js/vue.min.js"></script>
	<script type="text/javascript" src="../js/zhws.js" ></script>
	<body>
		<style>
		
		.table_zh {
	margin: auto;
	text-align: center;
	font-size: 13px;
	border-collapse: collapse;
	border-spacing: 0px;
	border: 0px solid #FFF;
}

.table_zh>thead>tr>th {
	border: 1px solid #FFF;
}

.table_zh>tbody>tr>td {
	border: 1px solid #FFF;
}
		
		
		
		.ul1 li:first-child{
		margin-left:2px !important;
		}
		.btnRight{
		float:right;}
		.Select{
	margin-left:260px;
	margin-top: -47px;
	    background: #428BCB;
    padding: 4px 0px 8px;
    width: 200px;
    border-radius: 5px;
}
.Selectbig2{
	border: none;	
	height: 35px;
	padding: 0 20%;
	background-color: #A3C5E1;
	border-radius:5px;
	color: white;
}
.Select2{
	margin-left: 785px;
	margin-top: -34px;
}
.Selectbig option{
	text-align: center;
	color: white;

}
select{
 
border: solid 1px #000;
appearance:none;
-moz-appearance:none;
-webkit-appearance:none;
padding-right: 14px; 
}
  select::-ms-expand { display: none; }
.c{
	width:121px;
}
.mn_xuanhou{
width:868px;
}
#ul li:nth-child(+n+16){
	background:rgb(199, 231, 230) !important;
	color:rgb(199, 231, 230) !important;
}
.ul1 li:nth-child(+n+16){
	background:rgb(199, 231, 230) !important;
	color:rgb(199, 231, 230) !important;
}

#table {
				margin: auto;
				text-align: center;
				font-size: 13px;
				border-collapse: collapse;
				border-spacing: 0px;
				border: 0px solid #FFF;
			}
			
			#table>thead>tr>th {
				border: 1px solid #FFF;
			}
			
			#table td {
				border: 1px solid #FFF;
				height: 28px;
			}
			
			.classGreen {
				background-color: #B6FBBB;
				color: #B6FBBB;
			}
			
			.classRed {
				background-color: #AE0000;
				color: white;
			}
			
			.classFenhong {
				background-color: #EAC4CF;
				color: #EAC4CF;
			}
		</style>
		<div style="width: 80%; margin:  0 auto;">
		<!--走势图-->
		<div class="" style="padding: 5px; "  id="app">
		<table class="table_zh" id="table"border="0"  cellspacing="1px">
					<thead>
						<tr>
							<th rowspan="2" id="yincang" style="font-weight: 900;">期号</th>
							<th colspan="15" style="font-weight: 900;">综合尾号走势</th>
							
							<th colspan="10">跨度</th>
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
							<th class="num_other">0</th>
							<th class="num_other">1</th>
							<th class="num_other">2</th>
						</tr>

					</thead>
					
					<tbody id="t">
					<tr style="color: white;background-color: #EAEEEE;" align="center" v-for="(row,index) in arry">

						<td style="background-color:#F3F3F3;color: gray;" v-if="index2==0" v-for="(col,index2) in arry[index]">
							{{col}}
						</td>

                        <!-- 0--9和0-4 -->
					    <td    @click="switchCheck(index,index2,$event)" :class="col!=' ' ? 'classRed':'classGreen'" v-if="index2>=1 && index2<=15" v-for="(col,index2) in arry[index]">
							{{col}}
						</td>

						<!--跨度-->
						<td   :class="col>='0' && col<='9'?'classRed zhexian':'classFenhong'" v-if="index2>=16 && index2<=25" v-for="(col,index2) in arry[index]">
							{{col}}
						</td>

						<!-- 012路-->
						<td  style="background-color: #FF9999;" v-if="index2==26" v-for="(col,index2) in arry[index]">
							{{col}}
						</td>

						<td style="background-color:#99CCCC ;" v-if="index2==27" v-for="(col,index2) in arry[index]">
							{{col}}
						</td>

						<td style="background-color:#CCFF66 ;" v-if="index2==28" v-for="(col,index2) in arry[index]">
							{{col}}
						</td>
						
						

					</tr>
					
					
				</tbody>
				
				

			</table>
			
			   <div class="btn btn-group btn_zh" style="margin-top: -50px;margin-right: 50px;">
			        <button onclick="onLeft()"type="button" class="left btn btn-success btn-sm">◀</button>
					<button onclick="onRight()" type="button" class="right btn btn-success btn-sm">▶</button>
					<button onclick="_clear()" type="button" class="qingkong btn btn-danger btn-sm">清</button>
	                      
                </div>
				</table>
		</div>
		
		<!--模拟选号-->
		<div class="mn_xuanhou" style="display: none;">
	
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
			<div id="vipxh" style="margin-top: 70px;margin-bottom: 10px;height: 50px;">
				<div class="vipxh_tx" >
					<p>VIP选号区</p>
			    </div>
				<!-- <div class="wrapper" id="xiaLa" style="margin: -46px 0px 0px 250px;">
					<select class="dropdown" id="sel" data-settings='{"wrapperClass":"flat"}'>
							<select   ${sessionScope.userinfo.usersType==1?'':'disabled'}   class="dropdown" id="sel" data-settings='{"wrapperClass":"flat"}' onchange="vip_ds()" onchange="vip_ds()">
						<option value="0" selected="selected">选四</option>
						<option value="1">选五</option>
						<option value="2">选六</option>
					</select>
				 </div> -->
				 <div class="Select">
						<select  class="Selectbig" onchange="change()" id="group" style="text-align:center;color: black;width: auto;padding: 0 10%;margin:0;padding:0 10%;margin: 0;width: 175px;border: none;  background: #428BCB;">
							<option value="0" selected="selected" style="text-align: center;color: black;">选四</option>
							<option value="1" style="text-align: center;color: black;">选五</option>
							<option value="2" style="text-align: center;color: black;">选六</option>
						</select>
						<span class="xx">▼</span>
					</div>
						<div class="left_right" style="margin: -30px 0px 0px 450px;">
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
						<div style="width:100%;height:250px;"></div>
	</div>
	</body>
	
	   <script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.actual.js"></script>
<script type="text/javascript" src="../js/raphael/v2.1.0/raphael.js"></script>
<script type="text/javascript"
	src="../js/draw2d/jquery-ui-1.8.23.custom.min.js"></script>
	
<script type="text/javascript" src="../js/draw2d/Class.js"></script>
<script type="text/javascript" src="../js/draw2d/draw2d.js"></script>
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


<script>
			
			var _index = -1;
			var app = new Vue({
				el: '#app',
				data: {
					arry: [],
					moni: []
				},
				methods:
				  {
				  	switchCheck:function(index,index2,obj)
				  	{
				  		var td = obj.target;
				  		 _switchCheck(index,index2,td);
				  	}
				  }

			});

			var url = "${pageContext.request.contextPath}/red.do?p=getRed";
			var callback = function(result) {
				//1.除了期数外，其他的取尾数 %10
				var arry_old = eval(result); //原始数据
				var arry_new = []; //新数组
				for(var i in arry_old) {
					var han_old = arry_old[i]; //旧的一行
					var han_new = []; //新的一行
					var han_new2 = [];
					for(var j in han_old) {
						if(j == 0) {

							han_new.push(han_old[0]);
						} else {
							han_new.push(han_old[j] % 10);
						}
					}
					//2.处理数组0-9
					han_new2.push(han_new[0]); //期数
					for(var k = 0; k < 10; k++) {
						if(han_new.indexOf(k) > -1) {
							han_new2.push(k);
						} else {
							han_new2.push(" ");
						}
					}
					//3.处理0-4
					for(var m = 0; m < 5; m++) {
						han_new2.push(han_new2[m + 1]);
					}
					//4.跨度
					var max = -1;
					var min = 10;
					var x = 0,
						y = 0,
						z = 0;
					for(var n = 1; n <= 10; n++) {
						if(max < han_new[n])
							max = han_new[n];
						if(min > han_new[n])
							min = han_new[n];

						if(han_new[n] % 3 == 0)
							x++;
						else if(han_new[n] % 3 == 1)
							y++;
						else if(han_new[n] % 3 == 2)
							z++;

					}
					var kuadu = max - min;

					for(var ii = 0; ii <= 9; ii++) {
						if(ii == kuadu)
							han_new2.push(ii)
						else
							han_new2.push(' ');
					}

					//0,1,2
					han_new2.push(x);
					han_new2.push(y);
					han_new2.push(z);

					arry_new.push(han_new2);

				}
				
				//三行模拟选号
				
				for (var k=0;k<3;k++)
				{
					var moni = [];
					for (var j=0;j<26;j++)
					{
						if (k==0 && j==0)
						{
							moni.push("模拟选号");
						}
						else
						{
							moni.push(" ");
						}
					}
					arry_new.push(moni);
				}

				//输出 
				//display(arry_new);
				app.arry = arry_new;
				
				_index = arry_old.length;
                
                //折线
				setTimeout(function() {
					drawLqzs();
				}, 10);
			}
			$.get(url,callback);

			//遍历
			function display(arry) {
				for(var i in arry) {
					var han = arry[i];
					var str = '';
					for(var j in han) {
						str = str + han[j] + " ";
					}
					console.log(str);
				}

			}
		</script>
	</body>

</html>


<script>
	        /* ----------------------点击选中---------------------------*/
	        function _switchCheck(index,index2,td)
	        {
	        	if ( app.arry[index][0]!="模拟选号")
	        	{
	        		return false;
	        	}
	        	
	        	_index = index;
	        	if (index2>0 && index2<=15)
	        	{
	        		
	        		
	        		
	        		//$(td).toggleClass("classRed"); 
				  		
	        	    var value = app.arry[index][index2];
	        	    var index3 = -1;
	        	    if (index2>=1 && index2<=5)   //选 了前面0-4
	        	    {
	        	       index3 = index2 + 10;		
	        	    }
	        	    else if (1*index2>10 && 1*index2<=15) //选了后面0-4
	        	    {
	        	    	index3 = index2-10;
	        	    	
	        	    }
	        	     
	        	    if (value==' ')
	        	    {
	        	    	
	        	    	//td.innerHTML = index2-1;
	        	    	if (index2<=10)
	        	    	{
	        	    		
		        	    	app.arry[index][index2] =index2-1+"";
		        	    	if (index3!=-1)
		        	    	{
		        	    		app.arry[index][index3] =index2-1+"";
		        	    		
	        	    	    }
	        	    	}
	        	    	else
	        	    	{
	        	    		app.arry[index][index2] =index2%10-1+"";
		        	    	if (index3!=-1)
		        	    	{
		        	    		app.arry[index][index3] =index2%10-1+"";
		        	    		
	        	    	    }
	        	    	}
	        	    	
	        	    }
	        	    else
	        	    {
	        	    	//td.innerHTML = ' ';
	        	    	app.arry[index][index2] = ' ';
	        	        if (index3!=-1)
		        	    	    {
		        	    		   app.arry[index][index3] =' ';
		        	    		
		        	    	    }
	        	    	
	        	    }
	        	   
	        	    app.$forceUpdate(); //强制更新
	        	   
	        	    
	        	}
	        	
	        }
	
	        /* --------------------------- 折线       ---------------------*/
			var table_canvas;
			isInitOk = false;
			y_head = -1;

			function drawLqzs() {
				//	table_canvas = new draw2d.Canvas("zhwsTu");
				isInitOk = true;

				// 得到圆的圆点X+圆点Y+圆半径 并画图
				table_canvas = new draw2d.Canvas("t"); // if(!table_canvas)
				$("svg").css("top", "45px");
				$("svg").css("left", "0px"); // 由于自带样式中绝对定位有偏移
				$("svg").css("width", "80%");
				var tableHeight = $("#table")[0].offsetHeight - 24*3-60;
				//	console.log("sdsds:"+tableHeight)

				$("svg").css("height", tableHeight);
				var lastPoints = new Array();
				var linePositons = new Array();
				var lastAngles = new Array();
				$(".zhexian").each(
					function(index, ele) {
						var ceilWidth = $(this).width() / 2;
						var ceilHeight = $(this).height() / 2;
						var X = $(this).position().left + ceilWidth;
						var Y = $(this).position().top + ceilHeight;
						if(y_head == -1) {
							y_head = $(this).position().top;
							Y = Y - y_head;
						} else {
							Y = Y - y_head;
						}
						var lastPoint = lastPoints[index - 1];
						if(lastPoint) {
							var lastPointArr = lastPoint.split("-");
							var preX = parseFloat(lastPointArr[0]);
							var preY = parseFloat(lastPointArr[1]);
							var lineX = X;
							var lineY = Y;
							var angle = (X - preX) / (Y - preY);
							var lastAngle = lastAngles[index - 1];
							lastAngles[index] = angle;
							if(angle == 0) {
								preY = preY + ceilHeight;
								lineY -= ceilHeight;
							} else if(angle > 0) { // 顺梯
								if(Math.abs(lineX - preX) < (ceilWidth * 3)) { // 角对角
									lineY = lineY - ceilHeight;
									preX = preX + ceilWidth;
								} else { // 分离
									preX += ceilWidth;
									lineX -= ceilWidth;
								}
							} else if(angle < 0) { // 逆梯
								if(Math.abs(lineX - preX) < (ceilWidth * 3)) { // 角对角
									lineY -= ceilHeight;
									preX -= ceilWidth;
								} else { // 分离
									preX -= ceilWidth;
									lineX += ceilWidth;
								}
							}
							// alert(preX+"--"+preY+"--"+lineX+"--"+lineY);
							table_canvas.addFigure(new draw2d.shape.basic.Line(preX,
								preY, lineX, lineY, null));
						}
						lastPoints[index] = X + "-" + Y;
					})
			};
			
			//清空
			function _clear()
			{
			  
			    for (var i in app.arry[_index])
			    {
			    	if (i==0) continue;
			    	app.arry[_index][i] = ' ';
			    	
			    }
			    
				app.$forceUpdate();
			}
			
			//左移  1,2,3,4
			function onLeft()
			{
				if (_index==-1) return false;
				 var arry = ['模拟选号'];
				 for (var i=2;i<16;i++)
			    {
			    	
			    	
			    	arry.push(app.arry[_index][i]);
			    }
			    
			    arry.push(app.arry[_index][1]);
			    
			    for (var i=0;i<10;i++)
			    {
			      arry.push(' ');
			    }
			    app.arry[_index] = arry;
				app.$forceUpdate();
				
			}
			
			//右移
			function onRight()
			{
				if (_index==-1) return false;
				 var arry =['模拟选号'];
				 arry.push(app.arry[_index][15]);;
				 for (var i=1;i<15;i++)
			    {
			    	
			    	
			    	arry.push(app.arry[_index][i]);
			    }
			    
			   
			    
			    for (var i=0;i<10;i++)
			    {
			      arry.push(' ');
			    }
			    app.arry[_index] = arry;
				app.$forceUpdate();
			}
			
			
//VIP号 显示在模拟区
function showVIP(param,n)
{         
   if (_index==-1)
   {
     return false;
   }
   
	//$("#ul li").removeClass("active");//原来选中的红色格子
	_clear();
	var array = ['模拟选号'];
	for (var j=0;j<15;j++)
   {
        var f = false;
		for (var i=0;i<param.length;i++)
		{
			if (param[i]==j)
			{
				f = true;
				break;	
			}
			
			
		}
		if (f)
			{
				array.push(j+"");	
			}
			else
			{
				array.push(' ');	
			}
   }
   for (var k=0;k<10;k++)
	{
	   array.push(' ');	
	}
  
     
      app.arry[_index] = array;
	  app.$forceUpdate();
	  
}
		</script>
	
</html>
