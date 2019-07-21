﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  if (session.getAttribute("userinfo")==null) response.sendRedirect("../yonghudenglu/denglu.jsp");%> 


<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人中心</title>
<link href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/pc/css/style.css" type="text/css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/pc/css/nprogress.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.min.js" type="text/javascript"></script>
    <script src="js/respond.min.js" type="text/javascript"></script>
    <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/pc/images/icon/icon.png">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/pc/images/icon/favicon.ico">
<meta name="Keywords" content="" />
<meta name="description" content="" />
<script type="text/javascript">
	//判断浏览器是否支持HTML5
	window.onload = function() {
		if (!window.applicationCache) {
			window.location.href = "ie.html";
		}
	}
</script>
</head>
<body>
	<section class="container user-select">
		<header>
			<div class="hidden-xs header">
				<!--超小屏幕不显示-->
				<h1 class="logo">
					<a href="#" >
				</h1>
				<ul class="nav hidden-xs-nav">
					<li class="active"><a href="${pageContext.request.contextPath }/userinfo.do?p=gerenxinxi"><span
							class="glyphicon glyphicon-user"></span>个人信息</a></li>
					
					<li><a href="${pageContext.request.contextPath}/userinfo.do?p=findByUsid&id=${userinfo.usersId}"><span
							class="glyphicon glyphicon-tags"></span>绑定支付宝</a></li>
					<li><a href="${pageContext.request.contextPath}/weixinguanzhu.do?w=idandUrltoT2D"><span
							class="glyphicon glyphicon-tags"></span>绑定微信</a></li>
					<li><a href="${pageContext.request.contextPath}/address.do?p=getAll"><span
							class="glyphicon glyphicon-tags"></span>管理收获地址</a></li>
					<li><a href="${pageContext.request.contextPath }/order.do?p=getAllOrder&statusID=1"><span class="glyphicon glyphicon-tags"></span>商品兑换记录</a></li>
					<li><a href="${pageContext.request.contextPath}/shiyong.do?p=FindByIdjcjl&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝使用记录</a></li>
					<li><a href="${pageContext.request.contextPath}/chongzhi.do?p=FindByIdchongzhirecord&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝充值记录</a></li>
					<li><a href="${pageContext.request.contextPath}/tixian.do?p=Alltixianrecord"><span class="glyphicon glyphicon-tags"></span>福贝提现记录</a></li>
				</ul>
			</div>
			<!--/超小屏幕不显示-->
			<div class="visible-xs header-xs">
				<!--超小屏幕可见-->
				<div class="navbar-header header-xs-logo">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#header-xs-menu"
						aria-expanded="false" aria-controls="navbar">
						<span class="glyphicon glyphicon-menu-hamburger"></span>
					</button>
				</div>
				<div id="header-xs-menu" class="navbar-collapse collapse">
					<ul class="nav navbar-nav header-xs-nav">
						<li class="active"><a href="${pageContext.request.contextPath }/userinfo.do?p=gerenxinxi"><span
							class="glyphicon glyphicon-user"></span>个人信息</a></li>
					
					<li><a href="${pageContext.request.contextPath}/userinfo.do?p=findByUsid&id=${userinfo.usersId}"><span
							class="glyphicon glyphicon-tags"></span>绑定支付宝</a></li>
					<li><a href="${pageContext.request.contextPath}/weixinguanzhu.do?w=idandUrltoT2D"><span
							class="glyphicon glyphicon-tags"></span>绑定微信</a></li>
					<li><a href="${pageContext.request.contextPath}/address.do?p=getAll"><span
							class="glyphicon glyphicon-tags"></span>管理收获地址</a></li>
					<li><a href="${pageContext.request.contextPath }/order.do?p=getAllOrder&statusID=1"><span class="glyphicon glyphicon-tags"></span>商品兑换记录</a></li>
					<li><a href="${pageContext.request.contextPath }/shiyong.do?p=FindByIdjcjl&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝使用记录</a></li>
					<li><a href="${pageContext.request.contextPath }/chongzhi.do?p=FindByIdchongzhirecord&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝充值记录</a></li>
					<li><a href="${pageContext.request.contextPath }/tixian.do?p=Alltixianrecord"><span class="glyphicon glyphicon-tags"></span>福贝提现记录</a></li>
					</ul>
				
				</div>
			</div>
		</header>
		<!--/超小屏幕可见-->
		<div class="content-wrap">
			<!--内容-->
			<div class="content"></div>
		</div>
		<!--/右侧>992px显示-->
		
	</section>
	<div>
		<a href="javascript:;" class="gotop" style="display:none;"></a>
	</div>
	<!--/返回顶部-->
	<script src="js/jquery-2.1.4.min.js" type="text/javascript"></script>
	<script src="js/nprogress.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	
		//页面加载
		$('body').show();
		$('.version').text(NProgress.version);
		NProgress.start();
		setTimeout(function() {
			NProgress.done();
			$('.fade').removeClass('out');
		}, 1000);
		//返回顶部按钮
		$(function() {
			$(window).scroll(function() {
				if ($(window).scrollTop() > 100) {
					$(".gotop").fadeIn();
				} else {
					$(".gotop").hide();
				}
			});
			$(".gotop").click(function() {
				$('html,body').animate({
					'scrollTop' : 0
				}, 500);
			});
		});
		//提示插件启用
		$(function() {
			$('[data-toggle="popover"]').popover();
		});
		$(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
		//鼠标滑过显示 滑离隐藏
		$(function() {
			$(".carousel").hover(function() {
				$(this).find(".carousel-control").show();
			}, function() {
				$(this).find(".carousel-control").hide();
			});
		});
		$(function() {
			$(".hot-content ul li").hover(function() {
				$(this).find("h3").show();
			}, function() {
				$(this).find("h3").hide();
			});
		});
		//页面元素智能定位
		$.fn.smartFloat = function() {
			var position = function(element) {
				var top = element.position().top; //当前元素对象element距离浏览器上边缘的距离 
				var pos = element.css("position"); //当前元素距离页面document顶部的距离
				$(window).scroll(function() { //侦听滚动时 
					var scrolls = $(this).scrollTop();
					if (scrolls > top) { //如果滚动到页面超出了当前元素element的相对页面顶部的高度 
						if (window.XMLHttpRequest) { //如果不是ie6 
							element.css({ //设置css 
								position : "fixed", //固定定位,即不再跟随滚动 
								top : 0
							//距离页面顶部为0 
							}).addClass("shadow"); //加上阴影样式.shadow 
						} else { //如果是ie6 
							element.css({
								top : scrolls
							//与页面顶部距离 
							});
						}
					} else {
						element.css({ //如果当前元素element未滚动到浏览器上边缘，则使用默认样式 
							position : pos,
							top : top
						}).removeClass("shadow");//移除阴影样式.shadow 
					}
				});
			};
			return $(this).each(function() {
				position($(this));
			});
		};
		//启用页面元素智能定位
		$(function() {
			$("#search").smartFloat();
		});
		//异步加载更多内容
		jQuery("#pagination a").on(
				"click",
				function() {
					var _url = jQuery(this).attr("href");
					var _text = jQuery(this).text();
					jQuery(this).attr("href", "javascript:viod(0);");
					jQuery.ajax({
						type : "POST",
						url : _url,
						success : function(data) {
							//将返回的数据进行处理，挑选出class是news-list的内容块
							result = jQuery(data).find(".row .news-list");
							//newHref获取返回的内容中的下一页的链接地址
							nextHref = jQuery(data).find("#pagination a").attr(
									"href");
							jQuery(this).attr("href", _url);
							if (nextHref != undefined) {
								jQuery("#pagination a").attr("href", nextHref);
							} else {
								jQuery("#pagination a").html("下一页没有了")
										.removeAttr("href")
							}
							// 渐显新内容
							jQuery(function() {
								jQuery(".row").append(result.fadeIn(300));
								jQuery("img").lazyload({
									effect : "fadeIn"
								});
							});
						}
					});
					return false;
				});
	</script>
</body>
</html>
