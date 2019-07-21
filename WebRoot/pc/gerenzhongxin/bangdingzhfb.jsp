<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/css/htmleaf-demo.css">
	<link href="${pageContext.request.contextPath}/pc/css/signin.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/pc/css/style.css" type="text/css" rel="stylesheet">
	<link type="text/css" href="${pageContext.request.contextPath}/pc/css/nprogress.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pc/css/htmleaf-demo.css">
	<link href="${pageContext.request.contextPath}/pc/css/signin.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/pc/css/bdingwx.css">
	<style>
		#header{
				width: 100%;
				height: 40px;
				background:#1692DC;
				padding-top: 5px;
				padding: 10 30px;
				margin-top: -11px;
				
			}
			#header span{
				margin: 0px 10px;
				/*margin-top: 100px;*/
				font-size: 24px;
				font-family: "楷体";
				color: white;
			}
			.logo{
		margin-top: -1px;
	}
	</style>
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
        <form class="navbar-form" action="search.php" method="post" style="padding:0 25px;">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="请输入关键字">
            <span class="input-group-btn">
            <button class="btn btn-default btn-search" type="submit">搜索</button>
            </span> </div>
        </form>
      </div>
    </div>
  </header>
  <div class="content-wrap"><!--内容-->
    <div class="content">
	<div class="htmleaf-container">
		<div id="header"><span>支付宝绑定设置</span></div>
		
		<div class="signin" style="padding: 0px 80px;">
			
			<!--<div style="background: orange;height: auto;">绑定支付宝</div>-->
			<form method="post" action="${pageContext.request.contextPath}/userinfo.do?p=addzhfb&id=${userinfo.usersId}" class="form-signin" role="form">
				<input name="zhfbid" type="text" class="form-control" placeholder="支付宝账号" required autofocus />
				<input name="zhfbName" type="text" class="form-control" placeholder="支付宝昵称" required autofocus />
				<button class="btn btn-lg btn-primary btn-block" type="submit">绑定</button>
			</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>