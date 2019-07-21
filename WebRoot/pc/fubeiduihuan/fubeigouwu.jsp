<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<html>
	<head>
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/pc/css/fubeigouwu.css" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/pc/js/jquery-1.9.1.js"></script>

	</head>
	<body>
		<div id="main">

			<div id="bon1">
				兑物专区
			</div>

			<div id="yi">
				<c:forEach items="${list}" var="g">
					<div class="d">
						<table cellspacing="15" class="tab">
							<tr align="center">
								<td>
									<a
										href="${pageContext.request.contextPath }/getgoods.do?p=getGoodsdetail&id=${g.gid}"><img
											src="${pageContext.request.contextPath}/${g.gimages}"
											style="width: 200px; height: 175px;" title="${g.gname}">
									</a>
								</td>
							</tr>
							<tr>
								<td style="font-family: 黑体; font-size: 14px;">
									${g.gname}
								</td>
							</tr>
							<tr style="font-size: 12px">
								<td >
									<a class="a">${g.gprice}</a>福贝
								    
								    <span style="float: right;">
									库存：<a class="a">${g.kuchun}</a>
									销量：<a class="a">${g.leijixiaoshou}</a>
									</span>
								</td>
							</tr>
							<tr align="center">
								<td>
									<button class="btn btn-danger radius" type="buttton"
										onclick="goods_order('立即兑换','${pageContext.request.contextPath}/getgoods.do?p=getGoodsdetailandRess&id=${g.gid}',${g.kuchun},'800','600')">
										立即兑换
									</button>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
	</body>

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
	function goods_order(title, url,kuchun, w, h) {
	    if (kuchun*1<=0)
	    {
	       alert("暂时缺货");
	       return false;
	    }
		layer_show(title, url, w, h);
	}
</script>
</html>
