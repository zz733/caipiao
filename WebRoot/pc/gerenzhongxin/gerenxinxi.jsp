<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE jsp>

<%  if (session.getAttribute("userinfo")==null) response.sendRedirect("../yonghudenglu/denglu.jsp");%> 

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人中心</title>
<link href="${pageContext.request.contextPath }/pc/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/pc/css/style.css" type="text/css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath }/pc/css/nprogress.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/jsp5shiv.min.js" type="text/javascript"></script>
    <script src="js/respond.min.js" type="text/javascript"></script>
    <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->

<link rel="stylesheet" href="${pageContext.request.contextPath }/pc/css/gerenxinxi.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery-3.2.1.js" ></script>
<script type="text/javascript">
//判断浏览器是否支持jsp5

</script>
</head>
<body>
<section class="container user-select">
  <header>
    <div class="hidden-xs header"><!--超小屏幕不显示-->
      <h1 class="logo"> <a href="#" ></a> </h1>
      <ul class="nav hidden-xs-nav">
        <li class="active"><a href="${pageContext.request.contextPath }/userinfo.do?p=gerenxinxi"><span
							class="glyphicon glyphicon-user"></span>个人信息</a></li>
					<li><a href="${pageContext.request.contextPath}/userinfo.do?p=findByUsid&id=${userinfo.usersId}"><span
							class="glyphicon glyphicon-tags"></span>绑定支付宝</a></li>
					<li><a href="${pageContext.request.contextPath}/weixinguanzhu.do?w=idandUrltoT2D"><span
							class="glyphicon glyphicon-tags"></span>绑定微信</a></li>
					<li><a href="${pageContext.request.contextPath}/address.do?p=getAll"><span
							class="glyphicon glyphicon-tags"></span>管理收获地址</a></li>
					<li><a href="${pageContext.request.contextPath }/shiyong.do?p=FindByIdduihuan"><span class="glyphicon glyphicon-tags"></span>商品兑换记录</a></li>
					<li><a href="${pageContext.request.contextPath}/address.do?p=getAll"><span class="glyphicon glyphicon-tags"></span>管理我的视频</a></li>
					<li><a href="${pageContext.request.contextPath }/shiyong.do?p=FindByIdjcjl&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝使用记录</a></li>
					<li><a href="${pageContext.request.contextPath }/chongzhi.do?p=FindByIdchongzhirecord&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝充值记录</a></li>
					<li><a href="${pageContext.request.contextPath }/tixian.do?p=Alltixianrecord"><span class="glyphicon glyphicon-tags"></span>福贝提现记录</a></li>
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
					<li><a href="${pageContext.request.contextPath }/shiyong.do?p=FindByIdduihuan"><span class="glyphicon glyphicon-tags"></span>商品兑换记录</a></li>
					<li><a href="${pageContext.request.contextPath}/address.do?p=getAll"><span
							class="glyphicon glyphicon-tags"></span>管理我的视频</a></li>
					<li><a href="${pageContext.request.contextPath }/shiyong.do?p=FindByIdjcjl&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝使用记录</a></li>
					<li><a href="${pageContext.request.contextPath }/chongzhi.do?p=FindByIdchongzhirecord&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝充值记录</a></li>
					<li><a href="${pageContext.request.contextPath }/tixian.do?p=Alltixianrecord"><span class="glyphicon glyphicon-tags"></span>福贝提现记录</a></li>
					</ul>
       
      </div>
    </div>
  </header>
  <!--/超小屏幕可见-->
  <div class="content-wrap"><!--内容-->
    <div class="content">
			<div id="header" style="margin-top: -10px;"><span id="header_span">个人信息</span></div>
			<div id="leirong">
			  <div id="touxiang">
			  	
			  	<img src="${pageContext.request.contextPath }/pc/img/img09.jpg.png"/>
			  	
			  </div>
			  <hr />
			  
			
				<div style="margin-top: 30px;margin-left: 50px;width:600px;">
				<c:forEach items="${xinximap.list}" var="xx" varStatus="i" >
				    <div class="div_fg"><span class="div_span">用户账号：</span> <span class="div_span2" id="tel">${xx.usersPhone}</span></div>
					<div class="div_fg"><span class="div_span">用户昵称：</span> <span class="div_span2">${xx.usersName}</span><a onclick="xiugainame('修改昵称','${pageContext.request.contextPath}/pc/gerenzhongxin/xiugainicheng.jsp','480','300')"  style="margin-left: 50px;color: red;">修改昵称</a></div>
					<div class="div_fg"><span class="div_span">登录密码：</span> <span class="div_span2">******</span><a onclick="xiugaipassword('修改密码','${pageContext.request.contextPath}/pc/gerenzhongxin/userxiugaipwd.jsp','500','350')" style="margin-left:57px;color: red;">修改密码</a></div>
					<div class="div_fg">
					<c:choose>
						<c:when test="${xx.usersType==0}">
							<div class="div_fg"><span class="div_span">用户类型：</span> <span class="div_span2">普通用户 </span><span style="color: #3399CC;"><a onclick="vipchongzhi('会员充值','${pageContext.request.contextPath}/chongzhi.do?p=vipchongzhi','765','490')">开通会员</a></span></div>
						</c:when>
						<c:when test="${xx.usersType==1}">
							<div class="div_fg"><span class="div_span">用户类型：</span> <span class="div_span2">VIP用户</span><span style="margin-left: 170px;color: #3399CC;">到期时间：<fmt:formatDate value="${xx.usersEndtime}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;</span> <a onclick="vipchongzhi('会员充值','${pageContext.request.contextPath}/chongzhi.do?p=vipchongzhi','765','490')">续费</a></div>
						</c:when>
					</c:choose>
					</div>
					
					<div class="div_fg">
					<span class="div_span">福贝余额：</span> <span class="div_span2">${xx.usersFubei}</span>
					<a onclick="fbchongzhi('福贝充值','${pageContext.request.contextPath}/userinfo.do?p=gerenxinxitochongzhi','800','600')" style="color: red;">&nbsp;&nbsp;充值</a> 
					<a onclick="fubeimaichu('福贝卖出','${pageContext.request.contextPath}/userinfo.do?p=gerenxinxitotixian','800','450')" style="margin-left: 10px;color: red;">卖出&nbsp;&nbsp;</a>&nbsp;&nbsp;
					</div>
					
					<div class="div_fg">
					<c:choose>
						<c:when test="${not empty xx.usersZhifubao}">
							<span class="div_span">支付帐号：</span> <span class="div_span2">${xx.usersZhifubao}</span><a onclick="xiugaizhifubao('修改昵称','${pageContext.request.contextPath}/pc/gerenzhongxin/xiugaizhifubao.jsp','480','300')" style="margin-left: 34px;color: red;">修改账号</a>
						</c:when>
						<c:when test="${empty xx.usersZhifubao}">
							<span class="div_span">支付帐号：</span> <a style="margin-left: 34px;color: red;">立即绑定</a>
						</c:when>
					</c:choose>
					</div>
					<div class="div_fg">
					<c:choose>
						<c:when test="${not empty xx.usersWeixin}">
							<span class="div_span">微信帐号：</span> <span class="div_span2">已绑定</span>
						</c:when>
						<c:when test="${empty xx.usersWeixin}">
							<span class="div_span">微信帐号：</span> <a style="margin-left: 34px;color: red;">立即绑定</a>
						</c:when>
					</c:choose>
					</div>
					
				</c:forEach>
				</div>
			
            </div>
	    </div>
  </div>
 
  <!--/右侧>992px显示-->

</section>
<div><a href="javascript:;" class="gotop" style="display:none;"></a></div>
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
<script type="text/javascript">
function fbchongzhi(title,url,w,h){
	layer_show(title,url,w,h);
}
function vipchongzhi(title,url,w,h){
	layer_show(title,url,w,h);
}
function xiugaipassword(title,url,w,h){
	layer_show(title,url,w,h);
}
function xiugainame(title,url,w,h){
	layer_show(title,url,w,h);
}
function xiugaizhifubao(title,url,w,h){
	layer_show(title,url,w,h);
}
function fubeimaichu(title,url,w,h){
	layer_show(title,url,w,h);
}

//页面加载
$('body').show();
//返回顶部按钮
$(function(){
	$(window).scroll(function(){
		if($(window).scrollTop()>100){
			$(".gotop").fadeIn();	
		}
		else{
			$(".gotop").hide();
		}
	});
	$(".gotop").click(function(){
		$('jsp,body').animate({'scrollTop':0},500);
	});
});
//提示插件启用
$(function () {
  $('[data-toggle="popover"]').popover();
});
$(function () {
	$('[data-toggle="tooltip"]').tooltip();
});
//鼠标滑过显示 滑离隐藏
$(function(){
	$(".carousel").hover(function(){
		$(this).find(".carousel-control").show();
	},function(){
		$(this).find(".carousel-control").hide();
	});
});
$(function(){
	$(".hot-content ul li").hover(function(){
		$(this).find("h3").show();
	},function(){
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
						position: "fixed", //固定定位,即不再跟随滚动 
						top: 0 //距离页面顶部为0 
					}).addClass("shadow"); //加上阴影样式.shadow 
				} else { //如果是ie6 
					element.css({ 
						top: scrolls  //与页面顶部距离 
					});     
				} 
			}else { 
				element.css({ //如果当前元素element未滚动到浏览器上边缘，则使用默认样式 
					position: pos, 
					top: top 
				}).removeClass("shadow");//移除阴影样式.shadow 
			} 
		}); 
	}; 
	return $(this).each(function() { 
		position($(this));                          
	}); 
}; 
//启用页面元素智能定位
$(function(){
	$("#search").smartFloat();
});
//异步加载更多内容
jQuery("#pagination a").on("click", function ()
{
    var _url = jQuery(this).attr("href");
    var _text = jQuery(this).text();
    jQuery(this).attr("href", "javascript:viod(0);");
    jQuery.ajax(
    {
        type : "POST",
        url : _url,
        success : function (data)
        {
            //将返回的数据进行处理，挑选出class是news-list的内容块
            result = jQuery(data).find(".row .news-list");
            //newHref获取返回的内容中的下一页的链接地址
            nextHref = jQuery(data).find("#pagination a").attr("href");
            jQuery(this).attr("href", _url);
            if (nextHref != undefined)
            {
                jQuery("#pagination a").attr("href", nextHref);
            }
			else
            {
                jQuery("#pagination a").jsp("下一页没有了").removeAttr("href")
            }
            // 渐显新内容
            jQuery(function ()
            {
                jQuery(".row").append(result.fadeIn(300));
                jQuery("img").lazyload(
                {
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
