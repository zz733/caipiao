$(function(){ 
   
    
    $("#wizard").scrollable({ 
        onSeek: function(event,i){ //切换tab样式 
            $("#status li").removeClass("active").eq(i).addClass("active"); 
        }, 
        onBeforeSeek:function(event,i){ //验证表单 
            if(i==1){ 
                var user = $("#user").val(); 
                if(user==""){ 
                    alert("请输入用户名！"); 
                    return false; 
                } 
                var pass = $("#pass").val(); 
                if(pass==""){ 
                    alert("请输入验证码！"); 
                    return false; 
                } 
                /*  if(pass1 != pass){ 
                    alert("两次密码不一致！"); 
                    return false; 
                } */
            } 
        } 
    }); 
    
    $("#sub").click(function(){ 
        var data = $("form").serialize(); //此方法用于使用ajax()一次性提交form表单
       
    }); 
}); 



