<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
		<meta charset="UTF-8">
		<title>忘记密码</title>
		<link rel="stylesheet" href="../css/forget.css" type="text/css">
		<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript" src="../js/scrollable.js"></script>
		<!-- <script type="text/javascript" src="../js/forget2.js" ></script> -->
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>

	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60502",secure:"60507"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
	<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1314" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/yonghudenglu/forgetmima.jsp">
		<div id="main" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-1314" data-genuitec-path="/ShuangSeQiu/WebRoot/pc/yonghudenglu/forgetmima.jsp">

			<form action="#" method="post">
				<div id="wizard">
					<ul id="status">
						<li class="active">
							<strong>1.</strong>确认账户
						</li>
						<li>
							<strong>2.</strong>填写密码
						</li>
						<li>
							<strong>3.</strong>完成
						</li>
					</ul>

					<div class="items">
						<div class="page">
							<h3>
								确认用户
								<br>
								<em>请验证您的账户。</em>
							</h3>
							<p class="p">
								<label>
									手机号：
								</label>
								<input type="text" class="input" id="user" name="username"
									onkeyup="checkMobile()">
								<span id="tishi1"></span>
							</p>
							<p class="p">
								<label>
									验证码:
								</label>
								<input type="text" class="input" id="pass" name="password">
								<input type="button" class="next2" value="获取验证码" id="btnYz">
							</p>

							<div class="btn_nav">
								<input type="button" class="next right" value="下一步&raquo;">
							</div>
						</div>
						</li>
						<div class="page">
							<h3>
								填写新密码
								<br />
								<em>请告诉我们您重新设定的密码。</em>
							</h3>
							<p class="p">
								<label>
									新密码：
								</label>
								<input type="password" class="input" name="email" id="email" />
							</p>
							<p class="p">
								<label>
									确认密码：
								</label>
								<input type="password" class="input" name="qq" id="qq"
									onkeyup="validate()" />
								<span id="tishi0"></span>
							</p>

							<div class="btn_nav">
								<input type="button" class="prev  " style="float: left"
									value="&laquo;上一步" />
								<input type="button" class="next right" id="button"
									value="下一步&raquo;" />
							</div>
						</div>
						<div class="page">
							<h3>
								修改密码完成
								<br />
								<em>点击确定返回登录。</em>
							</h3>

							<br />
							<br />
							<br />
							<div class="btn_nav">
								<input type="button" class="prev " style="float: left"
									value="&laquo;上一步" />
								<a id="ok"
									href="${pageContext.request.contextPath}/pc/yonghudenglu/denglu.jsp"><input
										type="button" class="next right" id="sub" value="确定" />
								</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>

	<script type="text/javascript">
	
	
 	 $("#wizard").scrollable({ 
         onSeek: function(event,i){ //切换tab样式 
            $("#status li").removeClass("active").eq(i).addClass("active"); 
        },  
        onBeforeSeek:function(event,i){ //验证表单 
         var str="";
            if(i==1){ 
                var uname = $("#user").val(); 
                var yzcode = $("#pass").val();  //输入的验证码值
                if(uname==""){ 
                    alert("请输入用户名！"); 
                    return false; 
                } 
              
                if(yzcode==""){ 
                    alert("请输入验证码！"); 
                    return false; 
                } 
                
              		
    		   	$.ajax({
    			url:"${pageContext.request.contextPath}/register.do?method=code2",
    			type:"post",
    			async : false,
    			data:{
    			yzcode:yzcode,
    			uname:uname,
    			},
    			 success:function(data){
    			 if(data=="1"){
    					
    			}
    			else{ 		
    				/* alert("失败"); */
    			   str="false";
    			   
    			}
    			
    			}
    		    
    			});
    			
    			
    		   	if(str=="false"){
        		 	alert("验证码错误");
        		 	return false;
        			}
    			 			
    			
    			
    			
            }
    			
          
            
          //验证表单 
            var str2="";
               if(i==2){ 
                   var mima = $("#email").val(); 
                   var mima2 = $("#qq").val();  //确认密码
                   var uname = $("#user").val(); //电话号码
                   if(mima==""){ 
                       alert("请输入密码！"); 
                       return false; 
                   } 
                 
                   if(mima2==""){ 
                       alert("请确认密码！"); 
                       return false; 
                   } 
                   
                 		
       		   	$.ajax({
       			url:"${pageContext.request.contextPath}/yonghuLogin.do?p=forget",
       			type:"post",
       			async : false,
       			data:{
       			mima:mima,
       			uname:uname,
       			},
       			 success:function(data){
       			 if(data=="true"){
       				
       			}
       			else{ 		
       				
       			   str2="false";
       			   
       			}
       			
       			}
       		    
       			});
       			
       			
       		   	if(str2=="false"){
           		 	alert("设置密码失败");
           		 	return false;
           			}
       			 		 
       			
       			
       			
               }
       			
        } ,
            
           
            
            
            
               
        
    });  
    function checkMobile(){
        var sMobile = document.getElementById("user").value;
       /*  alert(sMobile); */ 
         if(!(/^(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/.test(sMobile)  && sMobile!==null)){ 
         /*alert("不是完整的11位手机号或者正确的手机号前七位"); */
       document.getElementById("tishi1").innerHTML="<font color='red'>手机号不正确</font>";
            document.mobileform.tel.focus();
           
            return false;
        }
        else{
         document.getElementById("tishi1").innerHTML="";
       /*   $.ajax({
         		url:"${pageContext.request.contextPath}/register.do?method=code",
    			type:"post",
    			data:{},
    			 success:function(data){},
    			 error:function(){}
         }); */
         
        }
    } 
 $("#btnYz").click(function(){ 
    	
    	var uname = $("#user").val(); 
    	     
    			$.ajax({
    				url:"${pageContext.request.contextPath}/register.do?method=get2",
    				
    				timeout:30000,
    				data:{
    					uname:uname
    					},
    				success: function(data) {
    					
    					if (data == "false") {
    					/* 	mui.toast("该手机号已经被注册!"); */
    					 alert("该手机号还没有注册!");
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
    		
    		
 function validate() {
	    var pwd1 = document.getElementById("email").value;
	    var pwd2 = document.getElementById("qq").value;
	 

	    if(pwd1 == pwd2)
	     {
	        document.getElementById("tishi0").innerHTML="<font color='green'>两次密码相同</font>";
	        document.getElementById("button").disabled = false;
	     }
	else {
	        document.getElementById("tishi0").innerHTML="<font color='red'>两次密码不相同</font>";
	        document.getElementById("button").disabled = true;
	     }
	}
</script>
</html>