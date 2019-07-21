<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title></title>
<!--标准mui.css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/pc/css/mui.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/pc/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pc/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/pc/css/gongyijingcai.css" />
<script src="${pageContext.request.contextPath }/pc/js/mui.min.js"></script>
</head>
<style>
/*#bh_aaa{width:800%;background: yellow;}*/
</style>
<body>
	<form id="f" name="f" method="post">
		<!--
      	作者：563581459@qq.com
      	时间：2017-11-09
      	描述：标签
      -->

		<div class="main">
			<div class="gyjc_head">
				<div class="two_biaoqian">
					<li>公益竞猜&nbsp;第<c:if test="${not empty maxqishulist}" var="f">
							<c:forEach items="${maxqishulist}" var="qs" varStatus="status">
								<label>${qs+1}</label>
								<input type="text" value="${qs+1}" hidden="hidden" name="qishu" />
							</c:forEach>
						</c:if> <c:if test="${not f}">
			  2018012
			</c:if>期
					</li>
				</div>
				<div class="one_biaoqian">
					<ul class="hjfb">
						<li>合计福贝：<input type="text" class="form-control" id="total" name="total" readonly="readonly"></li>
						<li>福贝余额：<input type="text" disabled="true"
							class="form-control" value="${sessionScope.userinfo.usersFubei}"></li>
						<li><a title="福贝充值"
							onclick="fbchongzhi('福贝充值','${pageContext.request.contextPath}/userinfo.do?p=gerenxinxitochongzhi','800','600')"
							class="ml-5" style="text-decoration:none"> 福贝充值 </a>
						<li>
					</ul>
				</div>
			</div>
			<!--
    	作者：563581459@qq.com
    	时间：2017-11-09
    	描述：表
    -->

			<div class="table_clq">
				<table class="table table-border table-bordered table-striped">
					<tbody>
						<!--
      	作者：563581459@qq.com
      	时间：2017-11-06
      	描述：标签-猜篮球
      -->

						<input class="btn disabled radius" type="button" value="猜蓝球">
						<input class="btn disabled radius" type="button" value="赔率：${csmap.qiuhao}">
						<!--<thead>
           <tr>
              <th class="text-head"><input class="btn disabled radius" type="button" value="猜篮球"></th>
		   </tr>
        </thead> -->
						<tr class="text-c">
							<!--
        	作者：563581459@qq.com
        	时间：2017-11-06
        	描述：篮球号
        -->
							<td class="zi" style="background-color:cornflowerblue;">1</td>
							<td class="zi" style="background-color:cornflowerblue;">2</td>
							<td class="zi" style="background-color:cornflowerblue;">3</td>
							<td class="zi" style="background-color:cornflowerblue;">4</td>
						</tr>


						<tr class="text-c div_aaa">
							<td>
								<div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Blueone" name="blueone" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div>
							</td>
							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Bluetwo" name="bluetwo" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>

									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Bluesan" name="bluesan" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Bluesi" name="bluesi">
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
						</tr>
						<tr class="text-c">
							<td class="zi" style="background-color:cornflowerblue;">5</td>
							<td class="zi" style="background-color:cornflowerblue;">6</td>
							<td class="zi" style="background-color:cornflowerblue;">7</td>
							<td class="zi" style="background-color:cornflowerblue;">8</td>
						</tr>

						<tr class="text-c div_aaa">

							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Bluewu" name="bluewu" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Blueliu" name="blueliu" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Blueqi" name="blueqi" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Blueba" name="blueba" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
						</tr>

						<tr>
							<td height="5"></td>
						</tr>

						<tr class="text-c">
							<td class="zi" style="background-color:cornflowerblue;">9</td>
							<td class="zi" style="background-color:cornflowerblue;">10</td>
							<td class="zi" style="background-color:cornflowerblue;">11</td>
							<td class="zi" style="background-color:cornflowerblue;">12</td>
						</tr>
						<tr class="text-c">
							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Bluejiu" name="bluejiu" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td>
								<div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Blueshi" name="blueshi" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div>
							</td>
							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Blueshiyi" name="blueshiyi" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>

							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Blueshier" name="blueshier" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
						</tr>
						<tr class="text-c">
							<td class="zi" style="background-color:cornflowerblue;">13</td>
							<td class="zi" style="background-color:cornflowerblue;">14</td>
							<td class="zi" style="background-color:cornflowerblue;">15</td>
							<td class="zi" style="background-color:cornflowerblue;">16</td>
						</tr>
						<tr class="text-c">

							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Blueshisan" name="blueshisan" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Blueshisi" name="blueshisi" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Blueshiwu" name="blueshiwu" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td><div class="mui-numbox div_aaa" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number"
										id="Blueshiliu" name="blueshiliu" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
						</tr>

					</tbody>
				</table>
			</div>
			<!--
   	作者：563581459@qq.com
   	时间：2017-11-09
   	描述：大小单双
   -->
			<div class="table_caidxds">
				<table class="table table-border table-bordered table-striped">
					<tbody>
						<input class="btn disabled radius" type="button" value="猜单双大小">
						
						<input class="btn disabled radius" type="button" value="赔率：${csmap.daxiao}">
						<!--<thead>
           <tr>
              <th class="text-head"><input class="btn disabled radius" type="button" value="猜单双大小"></th>
		   </tr>
        </thead> -->
						<tr class="text-c div_bbb">
							<!--
        	作者：563581459@qq.com
        	时间：2017-11-06
        	描述：单双大小
        -->
							<td style="background-color:cornflowerblue;"><input
								class="btn disabled radius" type="button" value="单小"></td>
							<td style="background-color:cornflowerblue;"><input
								class="btn disabled radius" type="button" value="单大"></td>
							<td style="background-color:cornflowerblue;"><input
								class="btn disabled radius" type="button" value="双小"></td>
							<td style="background-color:cornflowerblue;"><input
								class="btn disabled radius" type="button" value="双大"></td>
						</tr>
						<tr class="text-c">
							<td>
								<!--
          	作者：563581459@qq.com
          	时间：2017-11-06
          	描述：按钮加减
          -->
								<div class="mui-numbox div_bbb" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number" id="Danxiao"
										name="danxiao" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div>
							</td>
							<td><div class="mui-numbox div_bbb" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number" id="Danda"
										name="danda" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td><div class="mui-numbox div_bbb" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number" id="Shuangxiao"
										name="shuangxiao" /> 
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td><div class="mui-numbox div_bbb" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number" id="Shuangda"
										name="shuangda" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
					</tbody>
				</table>
			</div>
			<!--
   	作者：563581459@qq.com
   	时间：2017-11-09
   	描述：0,1,2
   -->
			<div class="table_cai012 tab">
				<table class="table table-border table-bordered table-striped">
					<tbody>
						<input class="btn disabled radius" type="button" value="猜余数">
						<input class="btn disabled radius" type="button" value="赔率：${csmap.yusan}">
						<!--<thead>
           <tr>
              <th class="text-head"><input class="btn disabled radius" type="button" value="猜单双大小"></th>
		   </tr>
        </thead> -->
						<tr class="text-c div_ccc">
							<!--
        	作者：563581459@qq.com 
        	时间：2017-11-06
        	描述：0,1,2按钮
        -->
							<td style="background-color:#FF6666;"><input
								class="btn disabled radius" type="button" value="0"></td>
							<td style="background-color:#02AAE9;"><input
								class="btn disabled radius" type="button" value="1"></td>
							<td style="background-color:#339933;"><input
								class="btn disabled radius" type="button" value="2"></td>
						</tr>
						<tr class="text-c">
							<td>
								<!--
          	作者：563581459@qq.com
          	时间：2017-11-06
          	描述：按钮加减
          -->
								<div class="mui-numbox div_ccc" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number" id="Yuling"
										name="yuling" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div>
							</td>
							<td><div class="mui-numbox div_ccc" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number" id="Yuyi"
										name="yuyi" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>
							<td><div class="mui-numbox div_ccc" data-numbox-min='0'
									data-numbox-max='999' data-numbox-step='10'>
									<button class="mui-btn mui-btn-numbox-minus min" type="button">-</button>
									<input class="mui-input-numbox text_box" type="number" id="Yuer"
										name="yuer" />
									<button class="mui-btn mui-btn-numbox-plus add" type="button">+</button>
								</div></td>

							</div>
					</tbody>
				</table>
				<div>

					<input class="fu" id="zi_2" style="float: right;" type="button"
						value="提&nbsp;&nbsp;交" />

				</div>
			</div>
	</form>

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		$(function() {

			$("#zi_2").click(function() {
			
			            layer.confirm("确定要购买吗？",function(index){
							$.ajax({
									url : "${pageContext.request.contextPath}/bluejingcai.do?p=blueqiujingcai",
									data : $("#f").serialize(),
									type : "post",
									success : function(data) {
										    if (data=="/pc/yonghudenglu/denglu.jsp")
										    {
										        layer.alert("您没有登录!");
										        
										    }
										    else if (data=="true")
										    {
										        layer.msg("购买成功!",{icon:6,time:1000});
										       top.location  = "${pageContext.request.contextPath}/";
										    }
										    else
										    {
										       layer.msg("购买失败,可能余额不足",{icon:6,time:1000});
										    }
										},
									error : function(xhr, type,errorThrown) { //请求失败的异常处理
									if (type == 'timeout') {
											layer.alert("服务器开了小差，请求超时了");
											return;
										}
										if (type == 'abort') {
											layer.alert("亲，您的网络有点问题哦!");
											return;
										} else {
											layer.alert("服务器拒绝了连接，稍后再试吧！");
											return;
												}
										}

									});
									})

							});
		});

		/*查看详情*/
		function fbchongzhi(title, url, w, h) {
			layer_show(title, url, w, h);
		}

		$(function() {
			//获得文本框对象
			var t = $(".text_box");
			//数量增加操作
			$(".add").click(function() {
				
				setTotal();
			});
			//数量减少操作
			$(".min").click(function() {
				setTotal();
			});
			//计算操作
			function setTotal() {
			var s = 0 ;
				$(".table td").each(function() {  
	                    var t = $(this).find('input[class*=text_box]').val();  
	                    if(parseInt(t)==""||undefined||null || isNaN(t) || isNaN(parseInt(t))){  
	                        t=0;  
	                    }  
	                    s += parseInt(t);  
	                });  
	                $("#total").val(s.toFixed(2));  
			}
			//初始化
			setTotal();
		});
	</script>
</body>
</html>









