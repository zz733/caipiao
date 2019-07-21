<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/pc/css/htmleaf-demo.css">
<link href="${pageContext.request.contextPath}/pc/css/signin.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/pc/css/style.css"
	type="text/css" rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/pc/css/nprogress.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/pc/css/htmleaf-demo.css">
<link href="${pageContext.request.contextPath}/pc/css/signin.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/pc/css/bdingwx.css">
<style>
#header {
	width: 100%;
	height: 40px;
	background: #1692DC;
	padding-top: 5px;
	padding: 10 30px;
	margin-top: -11px;
}

#header span {
	margin: 0px 10px;
	/*margin-top: 100px;*/
	font-size: 24px;
	font-family: "楷体";
	color: white;
}
#main{
 width: 835px;
 height: 500px;
  margin:0 auto;
 
}
#left{
 width: 400px;
 height: 500px;
 display: inline-block;
  margin:0 auto;
}
#right{
width: 400px; 
height: 500px;
display: inline-block;
 margin:0 auto;
}
.T2Dimg{
	padding-top:100px;
}
.logo {
	margin-top: -1px;
}
</style>
</head>
<body>
	<section class="container user-select">
		<header>
			<div class="hidden-xs header">
				<!--超小屏幕不显示-->
				<h1 class="logo">
					<a href="#" ></a>
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
		<div class="content-wrap">
			<!--内容-->
			<div class="content">
				<div class="htmleaf-container">
					<div id=header>
						<span>微信绑定设置</span>
					</div>

					<div class="signin" style="padding: 20px 100px;border:2px red;">
						
				         <div id="main" >
					         <div id="left" class="center">
					         <img src="${pageContext.request.contextPath}/pc/bocayi.jpg" name="T2Dimg"/>
					         <h1 class="center">①关注公众号</h1>
					         </div>
					         <div id="right" class="center">
					         <img src="t2d/${sessionScope.WEIXINT2D}" style="width:240px;height:240px;" name="T2Dimg" id="T2Dimg2"/> 
					         <h1 class="center">②绑定微信号</h1>
					         </div>
					       
						</div>
					</div>
				</div>
			</div>
		</div>
		
</body>
</html>