<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" />
		<style>
			* {
				margin: 0 auto;
			}
			
			body {
				width: 80%;
				margin: auto;
			}
			
			#main {
				/*border: 1px palevioletred solid;*/
			}
			
			.h2-single {
				font-size: 14px;
				color: #014d7f;
				background-color: #f3f8fe;
				height: 40px;
				line-height: 30px;
			}
			
			.entity {
				padding-left: 110px;
				font-size: 16px;
				color: #014d7f;
				background-color: #f3f8fe;
				height: 30px;
				line-height: 40px;
				font-weight: 700;
			}
			.t1{
				position: relative;
				padding-bottom: 10px;
				margin-top: 20px;
			}
			.titl{
				padding-left: 110px;
				color: #fc6210;
				font-size: 14px;
			}
			.titl2{
				padding-left: 10px;
				font-size: 14px;
			}
			.lables{
					color: red;
					font-size: 14px;
					font-weight: 400;
				}
		</style>
	</head>
<% if (session.getAttribute("userinfo")==null) response.sendRedirect("/ShuangSeQiu/pc/yonghudenglu/denglu.jsp");%>
	<body>
		<div id="main">
			<h2 class="h2-single">
				<span class="entity">收货地址</span>
			</h2>

			<div class="t1 item">
				<span class="titl">新增收货地址</span>
				<span class="titl2">以下内容均为必填项</span>
			</div>

<div class="div_div2">
           <form class="form-horizontal" role="form">
    <div class="form-group row">
    <label for="inputEmail3" class="col-sm-2 control-label">所在地区</label>
    <div class="col-sm-10 control-label">
       <select id="province" onchange="getCity()" class="form-control">
				<option value="-1">---请选择---</option>	
       </select>
		<select id="city" onchange="getArea()" class="form-control">
				<option value="-1">---请选择---</option>
		</select>
		<select id="area" class="form-control">
				<option value="-1">---请选择---</option>
		</select>
    </div>
  </div>
  	
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">详细地址</label>
    <div class="col-sm-10">
      <textarea class="form-control" autocomplete="off" rows="3" id="div_xxaddress" onblur="checkxxaddress()" placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码，楼层和房间号等信息"></textarea>
     <label id="xxaddress" class="lables"></label>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">收货人姓名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="div_name" onblur="checkusername()" placeholder="收货人姓名长度为2-20个字符">
      <label id="name" class="lables"></label>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">电话号码</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="div_phone" onblur="checkphone()" placeholder="请输入正确的手机号">
      <label id="phone" class="lables"></label>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox" name="DefaultAddress"> 设置为默认的收货地址
        </label>
      </div>
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input type="button" class="btn btn-primary" id="button_click" value="保存" onclick="return checkgo()" />
      <button type="reset" class="btn btn-default">重置</button>
    </div>
  </div>
  
</form>
</div>
		</div>
	</body>
<script type="text/javascript" src="../js/jquery.js" ></script>
<script src="../js/jquery-2.1.4.min.js" type="text/javascript"></script> 
<script src="${pageContext.request.contextPath}/lib/lib/layer/2.1/layer.js"></script>

<script>
//地址三级级联
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
										self.location=document.referrer;
										//window.parent.location.reload();
										//	location.replace(location.href);
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
		
		
	//验证详细地址
	function checkxxaddress(){
		var btn=document.getElementById("div_xxaddress").value;
		if(btn.length==0){
			document.getElementById("xxaddress").innerHTML="请填写好详细地址";
			return false;
			
		}
		else{
			document.getElementById("xxaddress").innerHTML="";
			 return true;
		}
	}
   
   //验证收货人姓名
var username;
var cn;

function checkusername() {
    username = document.getElementById("div_name").value;
    var reg =  /^([a-zA-Z0-9\u4e00-\u9fa5\·]{1,10})$/; //可以输入用户名,但必须是非数字开头，长度为5-12位;
    if (reg.test(username) == false) {
         document.getElementById('name').innerHTML = "请正确输入用户名";
         return false;
    } else {
    	 document.getElementById('name').innerHTML = "";
    	 return true;
    }

}
   
 //验证手机号码
	function checkphone(){
		var btn=document.getElementById("div_phone").value;
		var reg=/^1[34578]\d{9}$/;
		if(reg.test(btn))
		{
			document.getElementById("phone").innerHTML="";
			 return true;
		}
		else
		{
			document.getElementById("phone").innerHTML="请输入正确的手机号";
			return false;
		}
	}  
   

   
   
   
	
</script>
</html>