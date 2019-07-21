function checkgo(){
//		var address=checkaddress();
		var xxaddress=checkxxaddress();
		var phone=checkphone();
//		var map=checkmap();
		var name=checkusername();
		
        if( xxaddress==true && phone==true  && name==true){
        }
        else{
        	alert("以上必填项你还没有填完");
		location.href="#";
        	return false;
        }
     
	}
	
	//重置按钮
	function resetcheck(){
//		document.getElementById("address").innerHTML="";
		document.getElementById("xxaddress").innerHTML="";
//		document.getElementById("map").innerHTML="";
		document.getElementById("name").innerHTML="";
		document.getElementById("phone").innerHTML="";
		
	}
	
	//验证地址
//	function checkaddress(){
//		var btn=document.getElementById("city-picker3").value;
//		if(btn.length==0){
//			document.getElementById("address").innerHTML="请填写好地址"
//		}
//		else{
//			document.getElementById("address").innerHTML="";
//		}
//		
//	}
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
	//邮政编码
//	function checkmap(){
//		var btn=document.getElementById("div_map").value;
//		var re= /^[1-9][0-9]{5}$/;
//      if(re.test(btn)){
//      	document.getElementById("map").innerHTML="";
//      	 return true;
//      }
//		else{
//			document.getElementById("map").innerHTML="请填写好邮政编码"
//			return false;
//		}
//	}
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
	