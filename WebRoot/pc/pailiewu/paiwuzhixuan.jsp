<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>各位尾数</title>
		<link rel="stylesheet" href="paiwuzhixuan.css" />
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<script type="text/javascript" src="../js/jquery-3.2.1.js" ></script>
		<script type="text/javascript" src="../js/layer/layer.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js" ></script>
	
	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60502",secure:"60507"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
	<style>	
	.tdIssue{
	background-color:rgb(234, 238, 238) !important;
	}
</style>	
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1305" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/pailiewu/paiwuzhixuan.jsp">
		<div id="main" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1305" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/pailiewu/paiwuzhixuan.jsp">
			<!-- 走势图  -->
			<div id="top">
				<!--<div id="title">
					<h3>易乐智能选号系统尾号走势图</h3>
				</div>-->
				<div id="head" _style="display: none;">
					<span id="headt">标注形式选择：</span>
					<span><input type="checkbox" checked="checked" id="zhexian"><label>带折线</label></span>
				</div>
		    </div>
		 
		    <table class="table_gw" id="gwsTu" onselectstart="javascript:/*IE8 hack*/return false" style="width:1244px;">
               <thead>
							<td rowspan="2" style="font-weight: 900;" id="yincang">期号</td>
							<th rowspan="2" colspan="5">号码</th>
							<th colspan="10">第一个数</th>
							<th colspan="10">第二个数</th>
							<th colspan="10">第三个数</th>
							<th colspan="10">第四个数</th>
							<th colspan="10">第五个数</th>
					</tr>
               		<tr>
               			    <th class="num">0</th>
               			    <th class="num">1</th>
							<th class="num">2</th>
							<th class="num">3</th>
							<th class="num">4</th>
							<th class="num">5</th>
							<th class="num">6</th>
							<th class="num">7</th>
							<th class="num">8</th>
							<th class="num">9</th>
							
							<th class="num">0</th>
               			    <th class="num">1</th>
							<th class="num">2</th>
							<th class="num">3</th>
							<th class="num">4</th>
							<th class="num">5</th>
							<th class="num">6</th>
							<th class="num">7</th>
							<th class="num">8</th>
							<th class="num">9</th>
							
							<th class="num">0</th>
               			    <th class="num">1</th>
							<th class="num">2</th>
							<th class="num">3</th>
							<th class="num">4</th>
							<th class="num">5</th>
							<th class="num">6</th>
							<th class="num">7</th>
							<th class="num">8</th>
							<th class="num">9</th>
							
							<th class="num">0</th>
               			    <th class="num">1</th>
							<th class="num">2</th>
							<th class="num">3</th>
							<th class="num">4</th>
							<th class="num">5</th>
							<th class="num">6</th>
							<th class="num">7</th>
							<th class="num">8</th>
							<th class="num">9</th>
							
							<th class="num">0</th>
               			    <th class="num">1</th>
							<th class="num">2</th>
							<th class="num">3</th>
							<th class="num">4</th>
							<th class="num">5</th>
							<th class="num">6</th>
							<th class="num">7</th>
							<th class="num">8</th>
							<th class="num">9</th>
					</tr>
               </thead>
		    </table>
		<div  class="mn_xuange">
	        <div class="btn btn-group btn_gw">
			        <button type="button" class="left btn btn-success btn-sm">◀</button>
					<button type="button" class="right btn btn-success btn-sm">▶</button>
					<button type="button" class="qingkong btn btn-danger btn-sm">清</button>
             </div>
	    </div>
	    
	    <div style="height: 150px;">
		    </div>
	</body>
	<script type="text/javascript"
		src="../js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.actual.js" ></script>
    <script type="text/javascript" src="../js/raphael/v2.1.0/raphael.js"></script>
	<script type="text/javascript" src="../js/draw2d/jquery-ui-1.8.23.custom.min.js"></script>
	<script type="text/javascript" src="../js/draw2d/Class.js"></script>
	<script type="text/javascript" src="../js/draw2d/draw2d.js"></script>
	<script src="paiwuzhixuan.js?ver=1" ></script>
	
</html>
