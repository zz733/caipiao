<!DOCTYPE html>
<html>

<head>
<meta charset="gbk">
<title>综合尾数</title>
</head>
<link rel="stylesheet" href="../css/lqzs.css" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<body>

	<div id="main"  style="width: 80%; margin:  0 auto;">

		<!-- 走势图  -->
		<div id="top">

			<div id="head" _style="display: 	none;">
				<span id="headt">标注形式选择：</span> <span><input id="zhexian"
					type="checkbox" checked="checked"><label>带折线</label></span>
			</div>
			<table id="lqzsTu" class="table_lq" border="0" cellspacing="1px">
				<thead>
					<tr>
						<td rowspan="2" width="65px" style="font-weight: 900;"
							id="yincang">期号</td>
						<th colspan="4">一区</th>
						<th colspan="4">二区</th>
						<th colspan="4">三区</th>
						<th colspan="4">四区</th>
						<th width="20px" style="background-color:#FFFFFF;"></th>
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
						<th class="num">10</th>
						<th class="num">11</th>
						<th class="num">12</th>
						<th class="num">13</th>
						<th class="num">14</th>
						<th class="num">15</th>
						<th class="num">16</th>
						<th class="num" style="background-color:#FFFFFF;"></th>
						<th class="numqt">0</th>
						<th class="numqt">1</th>
						<th class="numqt">2</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div class="mn_xuanlan" style="width:826px;">
				<div class="wrap" style="padding-top: 10px;margin-top:1px;">
					<!-- <div class="moni_xh">模拟选号</div>
					<ul id="ul" style="height: 25px;">
					</ul> -->
				</div>

				 <div class="btn btn-group btn_lq" style="margin-top: -75px;margin-left: 673px;">
					 <button type="button" class="left btn btn-success btn-sm">◀</button>
					<button type="button" class="right btn btn-success btn-sm">▶</button>
					<button type="button" class="qingkong btn btn-danger btn-sm">清</button>
				</div>
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
<script type="text/javascript" src="weishuzoushi.js"></script>

</html>