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
<script src="../js/vue.min.js"></script>

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

#qswsTu {
				margin: auto;
				text-align: center;
				font-size: 13px;
				border-collapse: collapse;
				border-spacing: 0px;
				border: 0px solid #FFF;
			}
			
			#qswsTu>thead>tr>th {
				border: 1px solid #FFF;
			}
			
			#qswsTu td {
				border: 1px solid #FFF;
				height: 28px;
			}
			
			.classGreen {
				background-color: #EAEEEE;
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
<body>
	<div style="width: 80%; margin: 0 auto;">
		<!--
            	作者：280191146@qq.com
            	时间：2017-12-02
            	描述：走势图区
            -->
		<div class="" style="padding: 5px; width: 100%;" id="app">

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
				
				<tr style="color: white;background-color: #EAEEEE;" align="center" v-for="(row,index) in arry">

						<td style="background-color:#F3F3F3;color: gray;" v-if="index2==0" v-for="(col,index2) in arry[index]">
							{{col}}
						</td>

                        <!-- 0--9和0-4 -->
					    <td    @click="switchCheck(index,index2)" :class="col!==' ' ? 'classRed':'classGreen'" v-if="index2>=1" v-for="(col,index2) in arry[index]">
							{{col}}
						</td>
						
				</tr>
				
				
				
			</table>
			
			 <div class="btn btn-group btn_qs" style="margin-top:-55px;margin-left:1000px;">
					<button onclick="onLeft()" type="button" class="left btn btn-success btn-sm">◀</button>
					<button onclick="onRight()" type="button" class="right btn btn-success btn-sm">▶</button>
					<button onclick="_clear()" type="button" class="qingkong btn btn-danger btn-sm">清</button>
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


            var _index = -1;
			var app = new Vue({
				el: '#app',
				data: {
					arry: [],
					moni: []
				},
				methods:
				  {
				  	switchCheck:function(index,index2)
				  	{
				  		 _switchCheck(index,index2);
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
					for(var j=0;j<4;j++) {
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

					arry_new.push(han_new2);

				}
				
				//三行模拟选号
				
				for (var k=0;k<3;k++)
				{
					var moni = [];
					for (var j=0;j<16;j++)
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
                
			}
			$.get(url,callback);
			
			
			 /* ----------------------点击选中---------------------------*/
	        function _switchCheck(index,index2)
	        {
	        	if ( app.arry[index][0]!="模拟选号")
	        	{
	        		return false;
	        	}
	        	
	        	_index = index;
	        	if (index2>0)
	        	{
	        		
	        		
	        		
	        		//$(td).toggleClass("classRed"); 
				  		
	        	    var value = app.arry[index][index2];
	        	    var index3 = -1;
	        	    if (index2>=1 && index2<=5)   //选 了前面0-4
	        	    {
	        	       index3 = index2 + 10;		
	        	    }
	        	    else if (1*index2>10) //选了后面0-4
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
				 for (var i=2;i<=10;i++)
			    {
			    	if (app.arry[_index][i]!==' ')
					{
                        arry.push(app.arry[_index][i]-1);
					}
					else
					{
                        arry.push(' ');
					}
			    	
			    	
			    }
			    if (app.arry[_index][1]!==' ')
			    {
					arry.push(9);
			    }
				else
				{
					arry.push(' ');
				}

				for (i=1;i<=5 ;i++ )
				{
					arry.push(arry[i]);
				}

			    
			    
			    app.arry[_index] = arry;
				app.$forceUpdate();
				
			}
			
			//右移
			function onRight()
			{
				if (_index==-1) return false;
				 var arry =['模拟选号'];

				 if (app.arry[_index][10]!==' ')
				 {
					 arry.push(0);
				 }
				 else
				 {
					 arry.push(' ');
				 }
				 
				 for (var i=1;i<15;i++)
			    {
			    	
			    	if (app.arry[_index][i]!==' ')
					{
						if (1*app.arry[_index][i]+1>=10)
						{
                           arry.push(0);
						}
						else
						{					     
						   arry.push(1*app.arry[_index][i]+1);
						}
					}
					else
					{
						arry.push(' ');
					}
			    	
			    }
			    
			   
			    
			    app.arry[_index] = arry;
				app.$forceUpdate();
			}
			
			

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




<script type="text/javascript" src="../js/qsws.js"></script>

</html>