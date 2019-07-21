
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>易乐智能彩票选号系统</title>

</head>

<% if (session.getAttribute("admin")==null) response.sendRedirect("login.jsp");%> 
<body>

	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top">
			<div class="container-fluid cl">
				<a class="logo navbar-logo f-l mr-10 hidden-xs" href="#">易乐智能彩票选号系统后台管理</a>
				<a class="logo navbar-logo-m f-l mr-10 visible-xs"
					href="/aboutHui.shtml">H-ui</a> <span
					class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> <a
					aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
					href="javascript:;">&#xe667;</a>

				<nav id="Hui-userbar"
					class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li><c:if test="${sessionScope.admin.adminPower==1}">
						超级管理员
						</c:if> <c:if test="${sessionScope.admin.adminPower==2}">
						普通管理员
						</c:if></li>
						<li class="dropDown dropDown_hover"><a href="#"
							class="dropDown_A">${sessionScope.admin.adminName}<i
								class="Hui-iconfont">&#xe6d5;</i>
						</a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a
									onclick="update_pwd('修改密码','${pageContext.request.contextPath }/admin/adminxiugaipwd.jsp')"
									href="javascript:;">修改密码</a></li>
								<li><a
									href="${pageContext.request.contextPath}/admin/login.jsp">切换账户</a>
								</li>
								<li><a
									href="${pageContext.request.contextPath}/admin/login.jsp">退出</a>
								</li>
							</ul></li>
						<li id="Hui-msg"><a href="#" title="消息"><span
								class="badge badge-danger">1</span><i class="Hui-iconfont"
								style="font-size: 18px">&#xe68a;</i> </a></li>
						<li id="Hui-skin" class="dropDown right dropDown_hover"><a
							href="javascript:;" class="dropDown_A" title="换肤"><i
								class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i> </a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" data-val="default"
									title="默认（黑色）">默认（黑色）</a></li>
								<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
								</li>
								<li><a href="javascript:;" data-val="green" title="绿色">绿色</a>
								</li>
								<li><a href="javascript:;" data-val="red" title="红色">红色</a>
								</li>
								<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
								</li>
								<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a>
								</li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<aside class="Hui-aside">
		<div class="menu_dropdown bk_2">
			<dl id="menu-cansu">
				<dt>
					<i class="Hui-iconfont">&#xe616;</i> 基础参数 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							data-href="${pageContext.request.contextPath}/jccs.do?p=jccsds"
							data-title="竞猜单双大小的赔率" href="javascript:void(0)">竞猜单双大小的赔率</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/jccs.do?p=jccsfb"
							data-title="1元相当于多少福贝" href="javascript:void(0)">1元相当于多少福贝</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/jccs.do?p=jccsvip"
							data-title="VIP充值价格" href="javascript:void(0)">VIP充值价格</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/jccs.do?p=gyjccs"
							data-title="每天公益竞猜次数" href="javascript:void(0)">每天公益竞猜次数</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/jccs.do?p=jccsqh"
							data-title="竞猜球号的赔率" href="javascript:void(0)">竞猜球号的赔率</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/jccs.do?p=jccsys"
							data-title="竞猜余3的赔率" href="javascript:void(0)">竞猜余3的赔率</a></li>
						<li style="display: none;"><a
							data-href="${pageContext.request.contextPath}/jccs.do?p=yuchejiage"
							data-title="彩票预测价格" href="javascript:void(0)">彩票预测价格</a></li>
						<li style="display: none;"><a
							data-href="${pageContext.request.contextPath}/jccs.do?p=yucehfanxian"
							data-title="预测不中返额" href="javascript:void(0)">预测不中返额</a></li>
					</ul>
				</dd>
			</dl>

			<dl id="menu-logo">
				<dt>
					<i class="Hui-iconfont">&#xe613;</i> LOGO管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							data-href="${pageContext.request.contextPath}/admin/logo/Logo.jsp"
							data-title="LOGO图标" href="javascript:void(0)">LOGO图标</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/admin/logo/Beijingtu.jsp"
							data-title="登录背景图" href="javascript:void(0)">登录背景图</a></li>

						<li><a
							data-href="${pageContext.request.contextPath}/aboutme.do?p=update"
							data-title="关于我们" href="javascript:void(0)">关于我们</a></li>
					</ul>
				</dd>
			</dl>

			<dl id="menu-kaijiang">
				<dt>
					<i class="Hui-iconfont">&#xe613;</i> 彩票类型管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							data-href="${pageContext.request.contextPath}/admin/caipiao_type/addCaipiao_type.jsp"
							data-title="新增彩票类型 " href="javascript:void(0)">新增彩票类型 </a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/caipiaoTypeManager.do?p=findAll"
							data-title="彩票类型管理" href="javascript:void(0)">彩票类型管理</a></li>
					</ul>
				</dd>
			</dl>

			<dl id="menu-kaijiang">
				<dt>
					<i class="Hui-iconfont">&#xe613;</i>彩票预测 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							data-href="${pageContext.request.contextPath}/yucheBack.do?p=toAdd"
							data-title="新增预测" href="javascript:void(0)">新增预测</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/yucheBack.do?p=fenye"
							data-title="预测管理" href="javascript:void(0)">预测管理</a></li>

						<li><a
							data-href="${pageContext.request.contextPath}/yucheOrder.do?p=fenye"
							data-title="预测订单" href="javascript:void(0)">所有预测订单</a></li>

						<li><a
							data-href="${pageContext.request.contextPath}/yucheOrder.do?p=fenye&zonjiang=0"
							data-title="未处理订单" href="javascript:void(0)">未处理订单</a></li>

						<li><a
							data-href="${pageContext.request.contextPath}/yucheOrder.do?p=fenye&zonjiang=1"
							data-title="已中奖订单" href="javascript:void(0)">已中奖订单</a></li>


						<li><a
							data-href="${pageContext.request.contextPath}/yucheOrder.do?p=fenye&zonjiang=2"
							data-title="未中奖订单" href="javascript:void(0)">未中奖订单</a></li>


						<li style="display: none;"><a
							data-href="${pageContext.request.contextPath}/jccs.do?p=yuchejiage"
							data-title="彩票预测价格" href="javascript:void(0)">彩票预测价格</a></li>
						<li style="display: none;"><a
							data-href="${pageContext.request.contextPath}/jccs.do?p=yucehfanxian"
							data-title="预测不中返额" href="javascript:void(0)">预测不中返额</a></li>
					</ul>
				</dd>
			</dl>


			<dl id="menu-kaijiang">
				<dt>
					<i class="Hui-iconfont">&#xe613;</i> 开奖管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							data-href="${pageContext.request.contextPath}/kaijiang.do?p=getAllkaijiang"
							data-title="双色球 中奖号入库" href="javascript:void(0)">双色球入库</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/kaijiang.do?p=zhongjiangjilu"
							data-title="双色球 中奖记录" href="javascript:void(0)">双色球 中奖记录</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/kaijiang3d.do?p=fenye"
							data-title="3D中奖号入库" href="javascript:void(0)">3D入库</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/qianquzoushi3d.do?p=fenye"
							data-title="大乐透 中奖号入库" href="javascript:void(0)">大乐透入库</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/pailiewu.do?p=fenye"
							data-title="排列五 中奖号入库" href="javascript:void(0)">排列五入库</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe620;</i> 管理员管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							data-href="${pageContext.request.contextPath}/admin.do?p=addAdminjsp"
							data-title="添加管理员" href="javascript:void(0)">添加管理员</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/admin.do?p=adminlisting"
							data-title="所有管理员" href="javascript:void(0)">所有管理员</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-yonghu">
				<dt>
					<i class="Hui-iconfont">&#xe622;</i> 用户管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							data-href="${pageContext.request.contextPath}/user.do?p=userlisting&type=2"
							data-title="所有用户" href="javascript:;">所有用户</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/user.do?p=userlisting&type=1"
							data-title="会员用户" href="javascript:;">会员用户</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/user.do?p=userlisting&type=0"
							data-title="普通用户" href="javascript:;">普通用户</a></li>

					</ul>
				</dd>
			</dl>
			<dl id="menu-goods">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> 商品管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a data-href="goods/AddGoods.jsp" data-title="新增商品"
							href="javascript:;">新增商品</a></li>
						<li><a data-href="goods/AddVideo.jsp" data-title="新增视频"
							href="javascript:;">新增视频</a></li>
						<li><a
							data-href="${pageContext.request.contextPath }/goods.do?p=goodsShangjia&gstatua=1"
							data-title="已上架商品" href="javascript:;">已上架商品</a></li>
						<li><a
							data-href="${pageContext.request.contextPath }/goods.do?p=goodsXiajia&gstatua=0"
							data-title="已下架商品" href="javascript:;">已下架商品</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-dingdan">
				<dt>
					<i class="Hui-iconfont">&#xe62d;</i> 订单管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							data-href="${pageContext.request.contextPath }/order.do?p=getAllOrder"
							data-title="所有订单" href="javascript:;">所有订单</a></li>
						<li><a
							data-href="${pageContext.request.contextPath }/order.do?p=getAllOrder&statusID=1"
							data-title="已付款订单" href="javascript:;">已付款订单</a></li>
						<li><a
							data-href="${pageContext.request.contextPath }/order.do?p=getAllOrder&statusID=2"
							data-title="待发货订单" href="javascript:;">待发货订单</a></li>
						<li><a
							data-href="${pageContext.request.contextPath }/order.do?p=getAllOrder&statusID=3"
							data-title="已发货订单" href="javascript:;">已发货订单</a></li>
						<li><a
							data-href="${pageContext.request.contextPath }/order.do?p=getAllOrder&statusID=4"
							data-title="已完成订单" href="javascript:;">已完成订单</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-peisong">
				<dt>
					<i class="Hui-iconfont">&#xe61a;</i> 配送公司 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a data-href="peisong/addCompany.jsp" data-title="新增配送公司"
							href="javascript:;">新增配送公司</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/peisong.do?p=fenye"
							data-title="配送公司" href="javascript:;">配送公司</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-zhifu">
				<dt>
					<i class="Hui-iconfont">&#xe62e;</i> 支付管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							data-href="${pageContext.request.contextPath}/alipaycs.do?p=alipaycs"
							data-title="支付宝参数" href="javascript:;">支付宝参数</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/weixinpaycs.do?p=weixinpaycs"
							data-title="微信参数" href="javascript:;">微信参数</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-chongzhi">
				<dt>
					<i class="Hui-iconfont">&#xe62e;</i> 充值管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							data-href="${pageContext.request.contextPath}/rechargerecord.do?p=Allchongzhirecord"
							data-title="所有充值记录" href="javascript:;">所有充值记录</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/rechargerecord.do?p=Allviprecord"
							data-title="会员充值记录" href="javascript:;">会员充值记录</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-tixian">
				<dt>
					<i class="Hui-iconfont">&#xe62e;</i> 提现管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							data-href="${pageContext.request.contextPath}/tixianrecord.do?p=Alltixianrecord"
							data-title="所有提现记录" href="javascript:;">所有提现记录</a></li>
						<li><a
							data-href="${pageContext.request.contextPath}/tixianrecord.do?p=Allshenqingrecord"
							data-title="提现申请" href="javascript:;">提现申请</a></li>
					</ul>
				</dd>
			</dl>
		</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);"
			onClick=displaynavbar(this);></a>
	</div>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
					<li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span>
						<em></em></li>
				</ul>
			</div>
			<div class="Hui-tabNav-more btn-group">
				<a id="js-tabNav-prev" class="btn radius btn-default size-S"
					href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i> </a><a
					id="js-tabNav-next" class="btn radius btn-default size-S"
					href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i> </a>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<iframe scrolling="yes" frameborder="0"
					src="${pageContext.request.contextPath}/tongji.do?p=tongjilisting"></iframe>
			</div>
		</div>
	</section>

	<div class="contextMenu" id="Huiadminmenu">
		<ul>
			<li id="closethis">关闭当前</li>
			<li id="closeall">关闭全部</li>
		</ul>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
	<script type="text/javascript">
	//修改密码
	function update_pwd(title, url) {
		layer.open( {
			area : [ '1163px', '554px' ],
			offset : [ '78px', '200px' ],
			shade : 0.0,
			type : 2,
			move : false,
			title : title,
			content : url
		});
		layer.full(index);
	}
</script>
	<script type="text/javascript">
	function showMessage(a) {
		var _href = $(a).attr('_href');
		var topWindow = $(window.parent.document);
		var iframe_box = $(window.parent.document.getElementById("iframe_box"))
				.find("iframe");
		iframe_box.attr("src", _href);
	}
</script>