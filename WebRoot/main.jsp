<%@page pageEncoding="utf-8"%><!DOCTYPE html>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>易乐彩票智能选号系统</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
		<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		
		<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}
			.container{
				height: 650px;
				background-image: url(img/background.png);
				background-repeat: no-repeat;
				background-size: 100% 100%;				
			}
			.row{
				padding: 0;
				margin: 0;
			}
			.daohang{
				width: 90%;
				height: 320px;
				margin-left: 5%;
				position: relative;
				top: 240px;
			}
			.r-left{
				height: 260px;
				padding: 0;
			}
			.rl-top{
				width: 100%;
				height: 50px;
				
			}
			.rl-top img{
				width: 100%;
				height: 100%;
			}
			
			.dh-zuo{
				width: 100%;
				height: 210px;
				padding: 0;
			}
			.anniu{
				height: 70px;
			}
			.anniu img{
				width: 100%;
				height: 100%;
				cursor: pointer;
			}
			.anniu .wenzi{
				/*color: #6f1800;*/
				color: white;
				letter-spacing: 8px;
				font-size: 20px;
				cursor: pointer;
				margin-left: -20%;
				position: absolute;
				top: 20px;
				left: 50%;
				/*text-shadow: -1px -1px 1px #6f1800, 1px 1px 1px gray;*/
			}
			.anniu .wenzi2{
				/*color: #6f1800;*/
				color: white;
				letter-spacing: 2px;
				font-size: 17px;
				cursor: pointer;
				margin-left: -30%;
				position: absolute;
				top: 20px;
				left: 50%;
				/*text-shadow: -1px -1px 1px #6f1800, 1px 1px 1px gray;*/
			}
			
			.r-right{
				height: 260px;				
				padding: 0;
			}
			.rr-top{
				width: 100%;
				height: 50px;
			}
			.rr-top img{
				width: 100%;
				height: 100%;
			}
			.rr-zhong{
				width: 100%;
				height: 70px;
			}
			.rr-zhong img{
				width: 100%;
				height: 100%;
			}
			.dh-you{
				width: 100%;
				height: 140px;
			}
			
			
			.person-center{
				width: 100%;
				height: 60px;
				z-index: 1000;
			}
			.anniu2{
				height: 60px;
			}
			.anniu2 img{
				width: 60%;
				margin-left: 20%;
				height: 100%;
				cursor: pointer;
			}
			.anniu2 .wenzi3{
				color: white;
				letter-spacing: 2px;
				font-size: 15px;
				font-weight: 500;
				margin-left: -11%;
				cursor: pointer;
				position: absolute;
				top: 17px;
				left: 50%;
				
			}
			
		</style>
	</head>
	<body>
		
		<div class="container" style="margin-top: 10px;">&nbsp; 
			<!--
            	作者：3207105634@qq.com
            	时间：2018-12-13
            	描述：导航
            -->
			<div class="row daohang">
				<!--
                	作者：3207105634@qq.com
                	时间：2018-12-13
                	描述：智能选号走势图
                -->
				<div class="col-md-5 col-sm-5 r-left">
					<div class="rl-top">
						<img src="img/zoushi.png" />
					</div>
					<div class="row dh-zuo">
						
					    <div class="anniu col-md-6 col-sm-6" onclick="location = 'index_shuansheqiu.jsp'">
							<span class="wenzi">双色球</span>
							<img src="img/btn.png"/>
						</div>
						<div class="anniu col-md-6 col-sm-6" onclick="location = 'pc/3d/index.jsp'">
							<span class="wenzi">福彩3D</span>
							<img src="img/btn.png"/>
						</div>
						
						<div class="anniu col-md-6 col-sm-6"  >
							<span class="wenzi" style="color:gray">七乐彩</span>
							<img src="img/btn.png"/>
						</div>
						<div class="anniu col-md-6 col-sm-6">
							<span class="wenzi" style="color:white" onclick="location ='pc/daletou/index.jsp'">大乐透</span>
							<img src="img/btn.png"/>
						</div>
						
						<div class="anniu col-md-6 col-sm-6">
							<span class="wenzi" style="color:white" onclick="location ='pc/pailiewu/index.jsp'">排列五</span>
							<img src="img/btn.png"/>
						</div>
						<div class="anniu col-md-6 col-sm-6">
							<span class="wenzi" style="color:gray">七星彩</span>
							<img src="img/btn.png"/>
						</div>
					</div>
				
				</div>
				<!--
                	作者：3207105634@qq.com
                	时间：2018-12-13
                	描述：鬼谷彩研室推荐
                -->
				<div class="col-md-7 col-sm-7 r-right">
					<div class="rr-top">
					  
						<img src="img/caiyanshi.png" />
					</div>
					<div class="rr-zhong">
						<img src="img/cwz-tuikuan.png"/>
					</div>
					<div class="row dh-you">
						 <c:forEach items="${list}" var="t">
						     <div class="anniu col-md-4 col-sm-4"  onclick="go(${t.id})">
							     <span class="wenzi2">${t.name} ¥<fmt:formatNumber pattern="#" value="${t.price }"></fmt:formatNumber></span>
							 <img src="img/btn.png"/>
						</div>
						 </c:forEach>
						
						<!--  
					    <div class="anniu col-md-4 col-sm-4"  onclick="go(1)">
							<span class="wenzi2">双色球 ¥12</span>
							<img src="img/btn.png"/>
						</div>
						
						<div class="anniu col-md-4 col-sm-4">
							<span class="wenzi2">大乐透 ¥12</span>
							<img src="img/btn.png"/>
						</div>
						<div class="anniu col-md-4 col-sm-4">
							<span class="wenzi2">香港彩 ¥15</span>
							<img src="img/btn.png"/>
						</div>
						
						<div class="anniu col-md-4 col-sm-4">
							<span class="wenzi2">七乐彩 ¥10</span>
							<img src="img/btn.png"/>
						</div>
						<div class="anniu col-md-4 col-sm-4">
							<span class="wenzi2">3D ¥15</span>
							<img src="img/btn.png"/>
						</div>
						<div class="anniu col-md-4 col-sm-4">
							<span class="wenzi2">排列五 ¥15</span>
							<img src="img/btn.png"/>
						</div>
						-->
					</div>
				</div>
				
				<!--
                	作者：3207105634@qq.com
                	时间：2018-12-13
                	描述：个人中心
                -->
                <div class="person-center row">
                	<div class="col-md-3 col-sm-4 anniu2"  onclick='location="${pageContext.request.contextPath}/userinfo.do?p=gerenxinxi"'>
                		<span class="wenzi3">个人信息</span>
						<img src="img/person-btn.png"/>
					</div>
					 <div class="col-md-3 col-sm-4 anniu2"  onclick='location="${pageContext.request.contextPath}/goods.do?p=getAllVideoGoods"'>
                		<span class="wenzi3">名师说彩</span>
						<img src="img/person-btn.png"/>
					</div>
<!-- 
					<div class="col-md-3 col-sm-4 anniu2">
						<span class="wenzi3">我的订单</span>
						<img src="img/person-btn.png"/>
					</div>
 -->
					<div class="col-md-3 col-sm-4 anniu2" onclick="aboutme()">
						<span class="wenzi3">联系我们</span>
						<img src="img/person-btn.png"/>
					</div>
                </div>
				
			</div>
		</div>
	</body>
</html>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
	function go(cid) {
		var url = "${pageContext.request.contextPath}/yuche.do?p=go";
		var data = {
			cid : cid
		};
		var callback = function(data) {
			var json = eval("(" + data + ")");
			var result = json.result;
			if (result == "0") {
				layer
						.msg(
								json.msg,
								{
									icon : 5,
									time : 1500
								},
								function() {

									if (json.msg == "没有登录") {
										var url = '${pageContext.request.contextPath}/pc/yonghudenglu/denglu_yuche.jsp?yid=' + json.yid;
										layer_show("登录", url, 800, 500);
									} else if (json.msg == "还没有购买") {
										var url = '${pageContext.request.contextPath}/yuche.do?p=toPayView&yid=' + json.yid;
										layer_show("购买", url, 800, 500);
									}

								});

			} else {

				layer.open( {
					title : json.caipiaoType.name+"第"+json.caipiaoQishu+"期预测",
					//skin : 'layui-layer-rim', //加上边框
					area : [ '900px', '600px' ], //宽高
					content : json.neirong,
					type:1
				});

			}
		}
		$.post(url, data, callback);
	}
	function aboutme()
	{
	   var url = '${pageContext.request.contextPath}/aboutme.do?p=get';
	   var callback = function(data)
	   {
	           layer.open( {
					title : "关于我们",
					//skin : 'layui-layer-rim', //加上边框
					area : [ '900px', '600px' ], //宽高
					content : data,
					type:1
				});
	   }
	   $.post(url,callback);
	}
</script>
