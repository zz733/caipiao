<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta charset="utf-8">
<title>易乐智能选号系统注册</title>
<link rel="stylesheet" href="../css/zhuce.css"  type="text/css">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
 <script type="text/javascript" src="${pageContext.request.contextPath}/pc/lib/jquery/1.9.1/jquery.min.js"></script> 
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60502",secure:"60507"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1315" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/yonghudenglu/zhuce.jsp">
 
 <div class="head_border" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1315" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/yonghudenglu/zhuce.jsp"></div>
 <section class="w12 login">
 <em class="fr">已经有账号，请&nbsp;&nbsp;<a class="db logbtn fr" href="denglu.jsp">前往登录</a> </em>
 </section>
 <section class="main w12">
   <div class="title"><a class="title1 db fl">注册账号</a></div>
   <div class="fr tit2"><span class="arr"></span></div>
   
   
   
   <div id="f1">
   <form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">手机号码:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="请输入11位手机号码" name="tel" id="identify0" autocomplete="off" maxlength="11" onfocus="usercenter_check.hide_note('tel-tip')" onblur="usercenter_check.check_tel()" style="ime-mode:disabled" onClick="if(value==defaultValue){value='';this.style.color='#333'}" onkeyup="checkMobile()">
       <span  id="tishi1"></span>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="identify" name="mima" value="" onClick="if(value==defaultValue){value='';this.style.color='#333'}" onkeyup="Yz()">
      <span id="tishi0"></span>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="identify1" name="" value="" onClick="if(value==defaultValue){value='';this.style.color='#333'}" onkeyup="validate()">
      <span id="tishi">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">验证码</label>
    <div class="col-sm-4">
      <input style="width: 200px" type="text" class="form-control" id="identify2" name="yzm" placeholder="请输入校验码" onClick="if(value==defaultValue){value='';this.style.color='#333'}">
    </div>
    <div class="col-sm-6">
    <a class="btn btn-default" id="btnYz">获取验证码</a>
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-success btn-lg" id="button">完成注册</button>
    </div>
  </div>
</form>
   </div>
   
   
   
 <!--   <div class="w12 step"></div>
   <div class="inputsec">
   <form name="mobileform" method="post" id="m" class="m">
     <ul>
       <li><label class="fl mr2">手机号码：</label><span>
           <input  class="fl yzm" type="text" tabindex="3" name="tel" id="identify0" autocomplete="off" maxlength="11" onfocus="usercenter_check.hide_note('tel-tip')" onblur="usercenter_check.check_tel()" style="ime-mode:disabled" class="txt-m fl " value="请输入11位手机号码" onClick="if(value==defaultValue){value='';this.style.color='#333'}" onkeyup="checkMobile()" >
      <span  id="tishi1"></span>
          </li> 
       <li><label class="fl mr2">密码：</label><span class="fl yzm"><input type="password" class="fl txt-y" id="identify" name="mima" value="" onClick="if(value==defaultValue){value='';this.style.color='#333'}" onkeyup="Yz()"/></span>
         <span id="tishi0"></span> </li>
       <li><label class="fl mr2">确认密码：</label><span class="fl yzm"><input type="password" class="fl txt-y" id="identify1" name="" value="" onClick="if(value==defaultValue){value='';this.style.color='#333'}" onkeyup="validate()"/></span>
        <span id="tishi"></span> </li>
     <li><label class="fl mr2">验证码：</label><span class="fl yzm2"><input type="text" class="fl txt-j" id="identify2" name="yzm" value="请输入校验码" onClick="if(value==defaultValue){value='';this.style.color='#333'}"/>
    </span>
       <a class="db fl chg send" id="btnYz">获取验证码</a>
       </li>
      <li><label class="fl">&nbsp;</label><p style=" line-height: 28px; "><input type="checkbox" name="checkbox1" value="1">我已阅读并同意<a style="text-decoration:underline;">《会商宝服务条款协议》</a></p></li>
     </ul>
     </form>
          <li class="clr"><label class="db fl">&nbsp;</label><button class="db fl next"  id="button">完成注册</button></li> 
     
   </div> -->
 </section>
</body>
<script type="text/javascript">

function checkMobile(){
    var sMobile = document.getElementById("identify0").value;
   /*  alert(sMobile); */ 
     if(!(/^(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/.test(sMobile)  && sMobile!==null)){ 
     /*alert("不是完整的11位手机号或者正确的手机号前七位"); */
   document.getElementById("tishi1").innerHTML="<font color='red'>手机号不正确</font>";
        document.mobileform.tel.focus();
       
        return false;
    }
    else{
     document.getElementById("tishi1").innerHTML="";
    }
} 

function Yz() {
 var Yzpwd = document.getElementById("identify").value;
   if(Yzpwd.length<6){
			 document.getElementById("tishi0").innerHTML="<font color='red'>密码长度不能低于6位</font>";
				Yzpwd.val("");	
	}
	else{
	 document.getElementById("tishi0").innerHTML="";
	
	}

}
function validate() {
    var pwd1 = document.getElementById("identify").value;
    var pwd2 = document.getElementById("identify1").value;
 

    if(pwd1 == pwd2)
     {
        document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
        document.getElementById("button").disabled = false;
     }
else {
        document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
        document.getElementById("button").disabled = true;
     }
}



        var miao = 50; //获取验证码等待10s后可再用,值会变
	 	var Maxtime = 50; //获取验证码总等待10s，值不变
		//获取元素
		var uname = $("#identify0"); //用户名Object
		var pwd = $("#identify"); //密码Object
		var pwd2 = $("#identify1"); //确认密码Object
		var yzm = $("#identify2"); //验证码Object
	
		var newsid=null;
		
		
		
		
		
	$("#btnYz").click(function() {
			var reg = /^(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/;
			if (!reg.test(uname.val())) {
				  $.MsgBox.Alert("消息", "请输入正确的手机号！");
				return;
			}
			$.ajax("${pageContext.request.contextPath}/register.do?method=get&iphone=" + uname.val(),{
				type: "post",
				timeout:30000,
				success: function(data) {
				/* alert("success"); */
					if (data == "false") {
					/* 	mui.toast("该手机号已经被注册!"); */
					$.MsgBox.Alert("消息", "该手机号已经被注册!");
					 
						return;
					} else {
						$("#btnYz").attr("disabled", true);
						$("#btnYz").css("pointer-events","none");
						jishi = setInterval(function() {
							$("#btnYz").text(miao + "s后再次发送");
							miao = miao - 1;
							if (miao == 0) {
								$("#btnYz").attr("disabled", false);
								$("#btnYz").css("pointer-events","auto");
								$("#btnYz").text("获取验证码");
								miao = Maxtime;
								clearTimeout(jishi);
							}
						}, 1000);
					}
				},
			
			});
		});
	
		
		
		
		
$("#button").click(function() {
			
			var  uname = $("#identify0").val();
			var mima = $("#identify1").val(); //确认密码Object
			
			var yzcode = $.trim(yzm.val()); //输入的验证码值
			
			$.ajax({
			url:"${pageContext.request.contextPath}/register.do?method=code",
			type:"post",
			data:{
			yzcode:yzcode,
			uname:uname,
			mima:mima
			},
			 success:function(data){
			 if(data=="1"){
			    $.MsgBox.Alert("消息", "注册成功！");
			   /*  window.location.hash = "denglu.jsp"; */
			     window.navigate("denglu.jsp");  
			}
			else{
			 $.MsgBox.Alert("消息", "验证码错误!");
			/*  alert("验证码错误");  */
			 yzm.val("");
			}
			},
			
		    
			});
			
			
		});		
			
			
		
	/* 弹出框样式 */	
		(function () {  
    $.MsgBox = {  
        Alert: function (title, msg) {  
            GenerateHtml("alert", title, msg);  
            btnOk();  //alert只是弹出消息，因此没必要用到回调函数callback  
            btnNo();  
        },  
        Confirm: function (title, msg, callback) {  
            GenerateHtml("confirm", title, msg);  
            btnOk(callback);  
            btnNo();  
        }  
    }  
    //生成Html  
    var GenerateHtml = function (type, title, msg) {  
        var _html = "";  
        _html += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title + '</span>';  
        _html += '<a id="mb_ico">x</a><div id="mb_msg">' + msg + '</div><div id="mb_btnbox">';  
        if (type == "alert") {  
            _html += '<input id="mb_btn_ok" type="button" value="确定" />';  
        }  
        if (type == "confirm") {  
            _html += '<input id="mb_btn_ok" type="button" value="确定" />';  
            _html += '<input id="mb_btn_no" type="button" value="取消" />';  
        }  
        _html += '</div></div>';  
        //必须先将_html添加到body，再设置Css样式  
        $("body").append(_html);   
        //生成Css  
         GenerateCss();  
    }  
  
    //生成Css  
    var GenerateCss = function () {  
        $("#mb_box").css({ width: '100%', height: '100%', zIndex: '99999', position: 'fixed',  
            filter: 'Alpha(opacity=60)', backgroundColor: 'black', top: '0', left: '0', opacity: '0.6'  
        });  
        $("#mb_con").css({ zIndex: '999999', width: '400px', position: 'fixed',  
            backgroundColor: 'White', borderRadius: '15px'  
        });  
        $("#mb_tit").css({ display: 'block', fontSize: '14px', color: '#444', padding: '10px 15px',  
            backgroundColor: '#DDD', borderRadius: '15px 15px 0 0',  
            borderBottom: '3px solid #009BFE', fontWeight: 'bold'  
        });  
        $("#mb_msg").css({ padding: '20px', lineHeight: '20px',  
            borderBottom: '1px dashed #DDD', fontSize: '13px'  
        });  
        $("#mb_ico").css({ display: 'block', position: 'absolute', right: '10px', top: '9px',  
            border: '1px solid Gray', width: '18px', height: '18px', textAlign: 'center',  
            lineHeight: '16px', cursor: 'pointer', borderRadius: '12px', fontFamily: '微软雅黑'  
        });  
        $("#mb_btnbox").css({ margin: '15px 0 10px 0', textAlign: 'center' });  
        $("#mb_btn_ok,#mb_btn_no").css({ width: '85px', height: '30px', color: 'white', border: 'none' });  
        $("#mb_btn_ok").css({ backgroundColor: '#168bbb' });  
        $("#mb_btn_no").css({ backgroundColor: 'gray', marginLeft: '20px' });  
        //右上角关闭按钮hover样式  
        $("#mb_ico").hover(function () {  
            $(this).css({ backgroundColor: 'Red', color: 'White' });  
        }, function () {  
            $(this).css({ backgroundColor: '#DDD', color: 'black' });  
        });  
        var _widht = document.documentElement.clientWidth;  //屏幕宽  
        var _height = document.documentElement.clientHeight; //屏幕高  
        var boxWidth = $("#mb_con").width();  
        var boxHeight = $("#mb_con").height();  
        //让提示框居中  
        $("#mb_con").css({ top: (_height - boxHeight) / 2 + "px", left: (_widht - boxWidth) / 2 + "px" });  
    }  
    //确定按钮事件  
    var btnOk = function (callback) {  
        $("#mb_btn_ok").click(function () {  
            $("#mb_box,#mb_con").remove();  
            if (typeof (callback) == 'function') {  
                callback();  
            }  
        });  
    }  
    //取消按钮事件  
    var btnNo = function () {  
        $("#mb_btn_no,#mb_ico").click(function () {  
            $("#mb_box,#mb_con").remove();  
        });  
    }  
})();  	
			
	
	
  
</script>



</html>