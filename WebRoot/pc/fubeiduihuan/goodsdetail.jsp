<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/pc/css/goodsdetail.css" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/pc/lib/jquery/1.9.1/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/pc/js/layer/1.9.3/layer.js"></script>
	</head>
	<body>

		<c:forEach items="${map.list}" var="g">

			<div id="main">
				<div class="d_tu">
					<img src="${pageContext.request.contextPath}/${g.gimages}"
						class="zhutu" id="img">
					<div>
						<ul id="xiaotu">
							<c:if test="${not empty g.gimages2}">
								<li>
									<img src="${pageContext.request.contextPath}/${g.gimages2}"
										id="img1" />
								</li>
							</c:if>

							<c:if test="${not empty g.gimages3}">
								<li>
									<img src="${pageContext.request.contextPath}/${g.gimages3}"
										id="img2" />
								</li>
							</c:if>

							<c:if test="${not empty g.gimages4}">
								<li>
									<img src="${pageContext.request.contextPath}/${g.gimages4}"
										id="img3" />
								</li>
							</c:if>

							<c:if test="${not empty g.gimages5}">
								<li>
									<img src="${pageContext.request.contextPath}/${g.gimages5}"
										id="img4" />
								</li>
							</c:if>


						</ul>
						
					</div>
                     
                     
                     

					<div class="xiangqing" style="margin-top: 5px;">

							${g.gdetail}
						
					</div>
				</div>


				<div class="d_word">
					<div class="t1">
						<h3>
							${g.gname}
						</h3>
					</div>
					<div class="jiage">
						<div class="j2">
							<span class="world">价格&nbsp;&nbsp;</span>
							<strong class="td-price"> <em>${g.gprice}</em> </strong>
							<span class="world">福贝</span>
						</div>
						<div class="detail">
							<dl>
								<dt class="world">
									商品描述
								</dt>
								<dd class="neirong">
									${g.gmiaoshu}
								</dd>
							</dl>
						</div>

						<button type="button" class="btn btn-warning btn-lg" id="buy"
							onclick="goods_order('立即兑换','${pageContext.request.contextPath}/getgoods.do?p=getGoodsdetailandRess&id=${g.gid}','800','500')">
							立即兑换
						</button>

					</div>
				</div>
			</div>


		</c:forEach>
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
	<script>
	var img = document.getElementById("img");
	var img1 = document.getElementById("img1").src;
	var img2 = document.getElementById("img2").src;
	var img3 = document.getElementById("img3").src;
	var img4 = document.getElementById("img4").src;

	$("#img1").click(function() {
		img.src = img1;
	});
	$("#img2").click(function() {
		img.src = img2;
	});
	$("#img3").click(function() {
		img.src = img3;
	});
	$("#img4").click(function() {
		img.src = img4;
	});

	function goods_order(title, url, w, h) {
		layer_show(title, url, w, h);
	}
</script>

</html>
