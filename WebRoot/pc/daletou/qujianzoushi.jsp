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
<script src="../js/vue.min.js"></script>
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


<style type="text/css">
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
				background-color: #F1F1D6;
				color: #F1F1D6;
			}
			
			.classRed {
				background-color: #AE0000;
				color: white;
			}
			
</style>


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
					
					
					<tr style="color: white;background-color: #EAEEEE;" align="center" v-for="(row,index) in arry">
					   <td style="background-color:#F3F3F3;color: gray;" v-if="index2==0" v-for="(col,index2) in arry[index]">
							{{col}}
						</td>
					
					    <!-- a--g和a-d -->
					    <td  v-if="index2>0"  @click="switchCheck(index,index2)" :class="col!==' ' ? 'classRed':'classGreen'"  v-for="(col,index2) in arry[index]">
							{{col}}
						</td>
					</tr>

				</thead>
			</table>
			
			 <div class="btn btn-group btn_qs" style="margin-top: -57px;margin-left: 820px;">
					<button type="button" onclick="onLeft()" class="left btn btn-success btn-sm">◀</button>
					<button type="button" onclick="onRight()" class="right btn btn-success btn-sm">▶</button>
					<button type="button" onclick="_clear()" class="qingkong btn btn-danger btn-sm">清</button>
			 </div> 


				
				
		</div>
		
		<div style="height: 150px;">
		    </div>
	</div>
</body>

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
			
			
			 /* ----------------------点击选中---------------------------*/
	        function _switchCheck(index,index2)
	        {
	            var arry = ['a','b','c','d','e','f','g'];
	        	if ( app.arry[index][0]!="模拟选号")
	        	{
	        		return false;
	        	}
	        	
	        	if (index2>0)
	        	{
	        	    var value = app.arry[index][index2];
	        	    var index3 = -1;
	        	    if (index2>=1 && index2<=4)   //选 了前面0-4
	        	    {
	        	       index3 = index2 + 7;		
	        	    }
	        	    else if (1*index2>=8) //选了后面0-4
	        	    {
	        	    	index3 = index2-7;
	        	    	
	        	    }
	        	     
	        	    if (value==' ')
	        	    {
	        	    	
	        	    	//td.innerHTML = index2-1;
	        	    	if (index2<=7)
	        	    	{
	        	    		
		        	    	app.arry[index][index2] =arry[index2-1];
		        	    	if (index3!=-1)
		        	    	{
		        	    		app.arry[index][index3] =arry[index2-1];
		        	    		
	        	    	    }
	        	    	}
	        	    	else
	        	    	{
	        	    		app.arry[index][index2] =arry[index2-1-7];
		        	    	if (index3!=-1)
		        	    	{
		        	    		app.arry[index][index3] =arry[index2-1-7];
		        	    		
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
				 for (var i=2;i<=7;i++)
			    {
			    	if (app.arry[_index][i]!==' ')
					{
                        arry.push(String.fromCharCode( (app.arry[_index][i]).charCodeAt()-1));
					}
					else
					{
                        arry.push(' ');
					}
			    	
			    	
			    }
			    if (app.arry[_index][1]!==' ')
			    {
					arry.push('g');
			    }
				else
				{
					arry.push(' ');
				}


			    
			    
			    for (var i=0;i<4;i++)
			    {
			       arry.push(arry[i+1]);
			    }
			    
			    app.arry[_index] = arry;
				app.$forceUpdate();
				
			}
			
			//右移
			function onRight()
			{
				if (_index==-1) return false;
				 var arry =['模拟选号'];

				 if (app.arry[_index][7]!==' ')
				 {
					 arry.push('a');
				 }
				 else
				 {
					 arry.push(' ');
				 }
				 
				 for (var i=1;i<=6;i++)
			    {
			    	
			    	if (app.arry[_index][i]!==' ')
					{
						if ((app.arry[_index][i]).charCodeAt()>='g')
						{
                           arry.push('a');
                           
						}
						else
						{					     
						   arry.push(String.fromCharCode( (app.arry[_index][i]).charCodeAt()+1) );
						}
					}
					else
					{
						arry.push(' ');
					}
			    	
			    }
			    
			     for (var i=0;i<4;i++)
			    {
			       arry.push(arry[i+1]);
			    }
			    
			   
			    
			   
			    app.arry[_index] = arry;
				app.$forceUpdate();
			}
			

</script>
<script type="text/javascript" src="qujianzoushi.js"></script>
</html>