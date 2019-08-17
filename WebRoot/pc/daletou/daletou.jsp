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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/daletou/daletou.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/layer/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/jquery.easydropdown.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/combineData.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/accordion-single.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/pc/js/bootstrap.min.js"></script>

<style type="text/css">
  #hqzsTu {
				margin: auto;
				text-align: center;
				font-size: 13px;
				border-collapse: collapse;
				border-spacing: 0px;
				border: 0px solid #FFF;
			}
			
			#hqzsTu>thead>tr>th {
				border: 1px solid #FFF;
			}
			
			#hqzsTu td {
				border: 1px solid #FFF;
				height: 28px;
			}
</style>
</head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1214" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/daletou/daletou.jsp">
	<div id="main" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1214" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/daletou/daletou.jsp">
		<table class="table_hq" cellspacing="1" id="hqzsTu" >
			<thead>
				<tr>
					<th rowspan="2" style="font-weight: 900;width:150px;"><div
							id="qq">期号</div></th>
					<th colspan="7" class="qu">一区</th>
					<th colspan="7" class="qu">二区</th>
					<th colspan="7" class="qu">三区</th>
					<th colspan="7" class="qu">四区</th>
					<th colspan="7" class="qu">五区</th>
					<th rowspan="2" width="42px">一区</th>
					<th rowspan="2" width="42px">二区</th>
					<th rowspan="2" width="42px">三区</th>
					<th rowspan="2" width="42px">四区</th>
					<th rowspan="2" width="42px">五区</th>
				</tr>
				<tr>
					<th class="num" width="26px">1</th>
					<th class="num" width="26px">2</th>
					<th class="num" width="26px">3</th>
					<th class="num" width="26px">4</th>
					<th class="num" width="26px">5</th>
					<th class="num" width="26px">6</th>
					<th class="num" width="26px">7</th>
					<th class="num" width="26px">8</th>
					<th class="num" width="26px">9</th>
					<th class="num" width="26px">10</th>
					<th class="num" width="26px">11</th>
					<th class="num" width="26px">12</th>
					<th class="num" width="26px">13</th>
					<th class="num" width="26px">14</th>
					<th class="num" width="26px">15</th>
					<th class="num" width="26px">16</th>
					<th class="num" width="26px">17</th>
					<th class="num" width="26px">18</th>
					<th class="num" width="26px">19</th>
					<th class="num" width="26px">20</th>
					<th class="num" width="26px">21</th>
					<th class="num" width="26px">22</th>
					<th class="num" width="26px">23</th>
					<th class="num" width="26px">24</th>
					<th class="num" width="26px">25</th>
					<th class="num" width="26px">26</th>
					<th class="num" width="26px">27</th>
					<th class="num" width="26px">28</th>
					<th class="num" width="26px">29</th>
					<th class="num" width="26px">30</th>
					<th class="num" width="26px">31</th>
					<th class="num" width="26px">32</th>
					<th class="num" width="26px">33</th>
					<th class="num" width="26px">34</th>
					<th class="num" width="26px">35</th>
				</tr>
			</thead>
		</table>

		<!--
                	作者：280191146@qq.com
                	时间：2017-12-09
                	描述：选号区
               		 -->
		<div style="width: 88%;margin: 0 auto;">
		
			<div class="wrap" style="padding-top: 10px;">

				<!-- <div class="moni_xh" style="width: 127px;">模拟选号</div>

				<ul id="ul" style="height: 25px;">

				</ul> -->
			</div>
			<!-- 模拟选号两行 -->
			<!-- <div class="konghang" style="padding-top: 10px;margin-top: -21px;">

				<div class="moni_xh" style=""></div>

				<ul class="ul1" style="height: 25px;">

				</ul>
			</div>
			 <div class="konghang" style="padding-top: 10px;margin-top: -21px;">

				<div class="moni_xh" style=""></div>

				<ul class="ul1" style="height: 25px;">

				</ul>
			</div> -->
			
			<div class="button_yi"  style="margin-top: -60px;">
				<div class="btn btn-group">
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

<script type="text/javascript" src="daletou.js"></script>
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
</html>