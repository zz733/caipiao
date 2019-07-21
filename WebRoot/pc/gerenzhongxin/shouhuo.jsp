<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理收获地址</title>
<link href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/pc/css/style.css" type="text/css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/pc/css/nprogress.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/pc/css/main.css" rel="stylesheet" type="text/css" />
<!--必要样式-->
  <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/pc/css/city-picker.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/shouhuo.css" /> 
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
		window.location.href="ie.html";
	}
}
</script>
<style>
	.logo{
		margin-top: -1px;
	}
</style>
</head>

<% if (session.getAttribute("userinfo")==null) response.sendRedirect("/ShuangSeQiu/pc/yonghudenglu/denglu.jsp");%>
<body>
<section class="container user-select">
  <header>
    <div class="hidden-xs header"><!--超小屏幕不显示-->
      <h1 class="logo"> <a href="#" > </h1>
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
					<li><a href="${pageContext.request.contextPath }/shiyong.do?p=FindByIdjcjl&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝使用记录</a></li>
					<li><a href="${pageContext.request.contextPath }/chongzhi.do?p=FindByIdchongzhirecord&id=${userinfo.usersId}"><span class="glyphicon glyphicon-tags"></span>福贝充值记录</a></li>
					<li><a href="${pageContext.request.contextPath }/tixian.do?p=Alltixianrecord"><span class="glyphicon glyphicon-tags"></span>福贝提现记录</a></li>
					</ul>
      </div>
    </div>
  </header>
  <div class="content-wrap"><!--内容-->
    <div class="content">
  <div id="main">
			<div id=header><span>管理收货地址</span></div>
			<div id="content">
			<div id="div_zi"><span class="div_span2 div_span"> 新增收货地址</span><span class="div_span2">下面都为必填项</span>
		    </div>
		    <div id="div_body">
		    	<form>
		    	<div class="div_address2">
		    	    <span class="div_span2">所在地址</span><i class="div_span">*</i>
		    	   <div id="" class="div_div2">
					<select id="province" onchange="getCity()">
					<option value="-1">---请选择---</option>
					</select>
					<select id="city" onchange="getArea()">
					<option value="-1">---请选择---</option>
					</select>
					<select id="area">
					<option value="-1">---请选择---</option>
					</select>
		    	    </div>
		    	
		    	<div class="div_address2">
		    	<span class="div_span2">详细地址</span><span class="div_span"></span>
		    	<div id="" class="div_div2">
		    	<textarea rows="2" cols="40" 
		    		autocomplete="off"  id="div_xxaddress" onblur="checkxxaddress()"  placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码，楼层和房间号等信息"></textarea><label id="xxaddress"></label></div>
		    	   
		    	</div>
		    	<div class="div_address2">
		        <span class="div_span2">收货人姓名</span><i class="div_span">*</i>
		        <div class="div_div2"><input type="text"  id="div_name" onblur="checkusername()"  placeholder="收货人姓名长度为2-20个字符" /><label id="name"></label></div>
		         
		        </div>
		        <div class="div_address2">
		        <span class="div_span2">手机号码</span><span class="div_span"></span>
		        <div id="" class="div_div2"><input type="text" id="div_phone" onblur="checkphone()"  placeholder="请输入正确的手机号"/><label id="phone"></label></div>
		        </div>
		       <div class="div_address2">
		        <span class="div_span2"></span><span class="div_span"></span>
		        <div id="div_addr"><input type="checkbox" name="DefaultAddress"/><label>设置为默认的收获地址</label></div>
		        </div>
		        <div class="div_address2">
		        <!--<span class="div_span2"></span><span class="div_span"></span>-->
		        <div id="div_button" >
		        <input type="button" class="btn btn-primary" id="button_click" value="保存" onclick="return checkgo()" /><input type="reset" class="btn btn-primary" value="重置"  /></div>
		        </div>
		    </div>	
		    </form>
		</div>
		<div id="down">
			<table  class="table">
				<tbody>
				<tr align="center"  id="table_tr">
					<td>收货人</td>
					<td>所在地址</td>
					<td>详细地址</td>
					<!--<td>邮编</td>-->
					<td>手机</td>
					<td>操作</td>
					<td><td>
				</tr>
				<c:forEach items="${list }" var="a">
				<tr align="center">
					<td class="td">${a.adName }</td>
					<td class="td">${a.areas.areaName }</td>
					<td class="td">${a.adDetail }</td>
					<!--<td class="td">400231</td>-->
					<td class="td">${a.adphone }</td>
					<td class="td"><a href="${pageContext.request.contextPath}/address.do?p=getAddressById&adId=${a.adId }">修改</a>|<a href="javascript:deleteById(${a.adId })">删除</a></td>
					<td>
					<c:choose>
							<c:when test="${a.adStatus==0}">
								<a href="javascript:setMoren(${a.adId })"><button style="margin-top: 6px;" class="btn btn-primary">设为默认</button></a>
							</c:when>
							<c:otherwise>
								<button style="margin-top: 6px;" class="btn btn-success">已默认</button>
							</c:otherwise>
					</c:choose> 
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
				
			
		</div>
		</div>
		<div><a href="javascript:;" class="gotop" style="display:none;"></a></div>
<script src="${pageContext.request.contextPath}/pc/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/pc/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/pc/js/shouhuo.js"></script>
<script src="${pageContext.request.contextPath}/pc/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/pc/js/city-picker.data.js"></script>
<script src="${pageContext.request.contextPath}/pc/js/city-picker.js"></script>
<script src="${pageContext.request.contextPath}/pc/js/main.js"></script>
<script src="${pageContext.request.contextPath}/pc/js/jquery-2.1.4.min.js" type="text/javascript"></script> 
<script src="${pageContext.request.contextPath}/pc/js/nprogress.js" type="text/javascript" ></script> 
<script src="${pageContext.request.contextPath}/lib/lib/layer/2.1/layer.js"></script>

<script type="text/javascript">


function setMoren(id)
{
    $.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/address.do?p=setMoren",
			data : {id:id},
			success : function() {
				layer.msg("设置成功！",{icon:6,time:1000},function(){
				location.replace(location.href);
				});
			},
			error : function() { 
				layer.msg("设置失败 ！",{icon:6,time:1000});
 
			}
		});
}

     var province = $("#province");
		$(function(){
		      
				$.getJSON("${pageContext.request.contextPath}/address.do?p=getProvinces", function(arry) {
					for ( var i = 0; i < arry.length; i++) {
						var op = new Option(arry[i].proName,arry[i].proId);
						province.append(op);
					}
				});
		}	);
  
	var city = $("#city");
		function getCity()
		{
			var id =  province.val();
			
			city.prop("length", 0);
			$.getJSON("${pageContext.request.contextPath}/address.do?p=getCity", {
				id : id
			}, function(arry) {
				for ( var i = 0; i < arry.length; i++) {
					var op = new Option(arry[i].cityName,arry[i].cityId);
					city.append(op);
				}
			});
		}
		
		function getArea(){
			var id = city.val();
			var area = $("#area");
			area.prop("length", 0);
			$.getJSON("${pageContext.request.contextPath}/address.do?p=getArea", {
				id : id
			}, function(arry) {
				for ( var i = 0; i < arry.length; i++) {
					var op = new Option(arry[i].areaName,arry[i].areaId);
					area.append(op);
				}
			});
			
		}

   
   function checkgo() {
	
	var xxaddress = checkxxaddress();
	var phone = checkphone();
	
	var name = checkusername();
	  if( xxaddress==true && phone==true  && name==true){
		  var address2 = $("#area").val();
			var xxaddress2 = $("#div_xxaddress").val();
			var shrName = $("#div_name").val();
			var phoneNumber = $("#div_phone").val();
			var status = 0;
			var defaultAddress = $("input[name=DefaultAddress]").prop("checked");
			if(defaultAddress==true)
			{
			    status = 1;
			}
			else
			{
			    status = 0;
			}
			
			layer.confirm("确定要保存吗？",function(){
				
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/address.do?p=addAddress",
					data : {
						address2 : address2,
						xxaddress2 : xxaddress2,
						shrName : shrName,
						phoneNumber : phoneNumber,
						status:status,
					},
					success : function() {
						
						layer.msg("保存成功！",{icon:6,time:1000},function(){
						location.replace(location.href);
						});

					},
					error : function() { 
						layer.msg("保存失败 ！",{icon:6,time:1000});
		 
					}
				});
				
			});
      }
      else{
      	alert("以上必填项你还没有填完");
		location.href="#";
      	return false;
      }
	
	

}
 //重置按钮
	function resetcheck(){
//		
		document.getElementById("div_phone").innerHTML="";
		
	}
function deleteById(id)
{
   layer.confirm("确定要删除吗？",function(){
   
       $.ajax({
          type:"post",
          url:"${pageContext.request.contextPath}/address.do?p=deleteById",
          data:{adId:id},
          success:function()
          {
             layer.msg("删除成功！",{icon:6,time:1000},function(){
             location.replace(location.href);
             });
          },
          error:function()
          {
             layer.msg("删除失败！",{icon:6,time:1000});
          }
       })
       
   })
   
}


//页面加载
$('body').show();
$('.version').text(NProgress.version);
NProgress.start();
setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
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
		$('html,body').animate({'scrollTop':0},500);
	});
});
//提示插件启用
//$(function () {
//$('[data-toggle="popover"]').popover();
//});
//$(function () {
//	$('[data-toggle="tooltip"]').tooltip();
//});
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
                jQuery("#pagination a").html("下一页没有了").removeAttr("href")
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
