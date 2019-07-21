<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>各位尾数</title>
		<link rel="stylesheet" href="../css/gwwh.css" />
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<script type="text/javascript" src="../js/jquery-3.2.1.js" ></script>
		<script type="text/javascript" src="../js/layer/layer.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js" ></script>
	
	</head>
	<style>
	.active1{
	background-color:#FE0000 !important;
	color:#FFFFFF;
	}
	.active2{
	background-color:#333300 !important;
	color:#FFFFFF;
	}
	.active3{
	background-color:#FF6600 !important;
	color:#FFFFFF;
	}
	.active4{
	background-color:#81007F !important;
	color:#FFFFFF;
	}
	.active5{
	background-color:#008001 !important;
	color:#FFFFFF;
	}
	.table_gw .num{
	width:18px !important;
	}
	</style>
	<body>
		<div id="main">
			<!-- 走势图  -->
			<div id="top">
				<!--<div id="title">
					<h3>易乐智能选号系统尾号走势图</h3>
				</div>-->
				<div id="head" _style="display: none;">
					<span id="headt">标注形式选择：</span>
					<span><input type="checkbox" checked="checked" id="zhexian"><label>带折线</label></span>
				</div>
		    </div>
		 
		    <table class="table_gw" id="gwsTu" onselectstart="javascript:/*IE8 hack*/return false" style="width:1000px">
               <thead>
							<td rowspan="2" style="font-weight: 900;" id="yincang">期号</td>
							<th colspan="10">第一个数</th>
							<th colspan="10">第二个数</th>
							<th colspan="10">第三个数</th>
							<th colspan="10">第四个数</th>
							<th colspan="10">第五个数</th>
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
               		</tr>
               </thead>
		    </table>
		<div  class="mn_xuange" style="width:882px;">
	        <div class="btn btn-group btn_gw">
			        <button type="button" class="left btn btn-success btn-sm">◀</button>
					<button type="button" class="right btn btn-success btn-sm">▶</button>
					<button type="button" class="qingkong btn btn-danger btn-sm">清</button>
	                      
             </div>
             
             
             <div style="height: 150px;">
		    </div>
	    </div>
	</body>
	<script type="text/javascript"
		src="../js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.actual.js" ></script>
    <script type="text/javascript" src="../js/raphael/v2.1.0/raphael.js"></script>
	<script type="text/javascript" src="../js/draw2d/jquery-ui-1.8.23.custom.min.js"></script>
	<script type="text/javascript" src="../js/draw2d/Class.js"></script>
	<script type="text/javascript" src="../js/draw2d/draw2d.js"></script>
	<script src="weizhizoushi.js?ver=1" ></script>
	
</html>
