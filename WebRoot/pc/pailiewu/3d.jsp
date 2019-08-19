<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>后三尾数</title>
			<link rel="stylesheet"
			href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/pc/js/jquery-1.8.1.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/pc/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css"
			 href="${pageContext.request.contextPath}/pc/pailiewu/3d.css" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/pc/js/combineData.js"></script>
		<script type="text/javascript"
			<script type="text/javascript" 
    src="${pageContext.request.contextPath}/pc/js/layer/layer.js"></script>
			<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/accordion-single.js"></script>
	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60502",secure:"60507"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
	<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1296" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/pailiewu/3d.jsp">
			<!--
            	作者：280191146@qq.com
            	时间：2017-12-02
            	描述：走势图区
            -->
			<div class=""
				style="width: 100%;" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1296" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/pailiewu/3d.jsp">

				<table class="tabl" border="1"
					id="hswsTu">
					<thead>
						<tr>
							<th rowspan="2" id="yincang">
								期号
							</th>
							<th colspan="10">
								第一位
							</th>
							<th colspan="10">
								第二位
							</th>
							<th colspan="10">
								第三位
							</th>
							<th colspan="10">
								第四位
							</th>
							<th colspan="10">
								第五位
							</th>
						</tr>
						<!--0-9  -->
						<tr>
							<th class="num">
								0
							</th>
							<th class="num">
								1
							</th>
							<th class="num">
								2
							</th>
							<th class="num">
								3
							</th>
							<th class="num">
								4
							</th>
							<th class="num">
								5
							</th>
							<th class="num">
								6
							</th>
							<th class="num">
								7
							</th>
							<th class="num">
								8
							</th>
							<th class="num">
								9
							</th>
							<!--0-9  -->
							<th class="num">
								0
							</th>
							<th class="num">
								1
							</th>
							<th class="num">
								2
							</th>
							<th class="num">
								3
							</th>
							<th class="num">
								4
							</th>
							<th class="num">
								5
							</th>
							<th class="num">
								6
							</th>
							<th class="num">
								7
							</th>
							<th class="num">
								8
							</th>
							<th class="num">
								9
							</th>
							<!--0-9  -->
							<th class="num">
								0
							</th>
							<th class="num">
								1
							</th>
							<th class="num">
								2
							</th>
							<th class="num">
								3
							</th>
							<th class="num">
								4
							</th>
							<th class="num">
								5
							</th>
							<th class="num">
								6
							</th>
							<th class="num">
								7
							</th>
							<th class="num">
								8
							</th>
							<th class="num">
								9
							</th>
							<!--0-9  -->
							<th class="num">
								0
							</th>
							<th class="num">
								1
							</th>
							<th class="num">
								2
							</th>
							<th class="num">
								3
							</th>
							<th class="num">
								4
							</th>
							<th class="num">
								5
							</th>
							<th class="num">
								6
							</th>
							<th class="num">
								7
							</th>
							<th class="num">
								8
							</th>
							<th class="num">
								9
							</th>
							<!--0-9  -->
							<th class="num">
								0
							</th>
							<th class="num">
								1
							</th>
							<th class="num">
								2
							</th>
							<th class="num">
								3
							</th>
							<th class="num">
								4
							</th>
							<th class="num">
								5
							</th>
							<th class="num">
								6
							</th>
							<th class="num">
								7
							</th>
							<th class="num">
								8
							</th>
							<th class="num">
								9
							</th>
						</tr>
					</thead>
		</table>
		<div class="nextbig">
		<div class="btn btn-group btn_hs" style="float:right;">
						<button type="button" class="left btn btn-success btn-sm">◀</button>
						<button type="button" class="right btn btn-success btn-sm">▶</button>
						<button type="button" class="qingkong btn btn-danger btn-sm">清</button>
		</div>
		</div>
		</div>
	</body>
	
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/jquery-3.2.1.js"></script>
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
	<script>
	    $(function(){
	      // alert($);
	    });
	</script>

	
   <script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/jquery.actual.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/raphael/v2.1.0/raphael.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/draw2d/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/draw2d/Class.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pc/js/draw2d/draw2d.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/pc/pailiewu/3d.js?12345678"></script>

</html>