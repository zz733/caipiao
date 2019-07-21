/************红球走势图**********/
//初始化数据
getTableData();
//得到工程路径
function getRootPath() {
	//http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	//uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	//http://localhost:8083
	var localhostPaht = curWwwPath.substring(0, pos);
	// uimcardprj
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	if (projectName == "/pc" || projectName == "/admin" || projectName == "/weixin")
		projectName = "";

	return (localhostPaht + projectName);
}
function paddingData(tableData) {
	var $table = $("#hqzsTu");
	for(var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); //底色
		var trArr = tableData[i];
		//数据
		var tdArr = trArr[i];
		//期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[tdArr.length - 1]);
		$tr.append($td)
		var trArrIndex = 0;
		var x = 0 ;
		var y = 0 ;
		var z = 0 ;
		//红球
		for(var j = 1; j < 34; j++) { //列数
			var $td = $("<td></td>");
			if(j != parseInt(tdArr[trArrIndex])) {
				if(j<=11)
					$td.css("background-color", "#B6FBBB"); 
				else if(12 <= j && j <= 22)
					$td.css("background-color", "#EAC4CF");				   
				else if(23 <= j && j <= 33)
				  $td.css("background-color", "#C7E7E6"); 
				  $td.text("  ");
			} else {
				$td.css("color", "white"); //字体颜色
				if(j <= 11){
					$td.text(tdArr[trArrIndex]);
				    x++;
				}
				else if(12 <= j && j <= 22){
					$td.text(tdArr[trArrIndex]);
				    y++;
				}
				else if(23 <= j && j <= 33){
					$td.text(tdArr[trArrIndex]);
				    z++;
				}
				$td.css("background-color", "#AE0000"); //球的背景颜色
				if(trArrIndex != tdArr.length- 1 ) trArrIndex++;
			}
			$tr.append($td);
		}
		for(var j = 0; j < 3; j++) { //列数
			var $td = $("<td></td>");
			if(j==0)
				$td.text(x);
			else if(j==1)
			  $td.text(y);
			  else if(j==2)
			  $td.text(z);
			$tr.append($td);
		}
		$table.append($tr);
	}
//	
	for(var i = 0; i < 1; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); //底色
		var trArr = tableData[i];
		//数据
		var tdArr = trArr[i];
		//期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text("模拟选号");
		$tr.append($td)
		var trArrIndex = 0;
		var x = 0 ;
		var y = 0 ;
		var z = 0 ;
		//红球
		for(var j = 1; j < 34; j++) { //列数
			var $td = $("<td></td>");
			if(j != parseInt(tdArr[trArrIndex])) {
				if(j<=11)
					$td.css("background-color", "#B6FBBB").addClass("one").addClass("one1").css("color","#B6FBBB"); 
				else if(12 <= j && j <= 22)
					$td.css("background-color", "#EAC4CF").addClass("two").addClass("one1").css("color","#EAC4CF");
				else if(23 <= j && j <= 33)
					  $td.css("background-color", "#C7E7E6").addClass("one1").css("color","#C7E7E6").addClass("three"); 
					  $td.text("  ");
			} else {
				
				$td.css("color", "white"); //字体颜色
				if(j <= 11){
					$td.css("background-color", "rgb(182, 251, 187)").addClass("one1").addClass("one").css("color","rgb(182, 251, 187)");
					x++;
				}
				else if(12 <= j && j <= 22){
					$td.css("background-color", "rgb(234, 196, 207)").addClass("one1").addClass("two").css("color","rgb(234, 196, 207)");
					y++;
				}
				else if(23 <= j && j <= 33){
					$td.css("background-color", "rgb(199, 231, 230)").addClass("one1").addClass("three").css("color","rgb(199, 231, 230)");
					z++;
				}
				 //球的背景颜色
				if(trArrIndex != tdArr.length- 1 ) trArrIndex++;
			}
			$tr.append($td);
			$td.text(j)
		}
		
		$table.append($tr);
	}
//	
	for(var i = 0; i <2; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); //底色
		var trArr = tableData[i];
		//数据
		var tdArr = trArr[i];
		//期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text("");
		$tr.append($td)
		var trArrIndex = 0;
		var x = 0 ;
		var y = 0 ;
		var z = 0 ;
		//红球
		for(var j = 1; j < 34; j++) { //列数
			var $td = $("<td></td>");
			
			if(j != parseInt(tdArr[trArrIndex])) {
				if(j<=11)
					$td.css("background-color", "#B6FBBB");
					
				else if(12 <= j && j <= 22)
					$td.css("background-color", "#EAC4CF");				   
				else if(23 <= j && j <= 33)
				  $td.css("background-color", "#C7E7E6"); 
				  $td.text("  ");
			} else {
				$td.css("color", "white"); //字体颜色
				if(j <= 11){
					$td.css("background-color", "rgb(182, 251, 187)");
				    x++;
				}
				else if(12 <= j && j <= 22){
					$td.css("background-color", "rgb(234, 196, 207)");
				    y++;
				}
				else if(23 <= j && j <= 33){
					$td.css("background-color", "rgb(199, 231, 230)");
				    z++;
				}
				 //球的背景颜色
				if(trArrIndex != tdArr.length- 1 ) trArrIndex++;
			}
			$tr.append($td);
		}
		
		$table.append($tr);
	}
}
$(document).on("click",".one",function(){
	$(this).toggleClass("active");
})
$(document).on("click",".two",function(){
	$(this).toggleClass("active2");
})
$(document).on("click",".three",function(){
	$(this).toggleClass("active3");
});
$(".qingkong").click(function(){
	$(".active").removeClass('active');
	$(".active2").removeClass('active2');
	$(".active3").removeClass('active3');
})


/**  
	右边被点击激活了的按钮；点击中的数字为左边哪一个区哪一个档的当中的以该数字开头的数组
 */
$(function(){
	$(".btnul").css("margin-left"," 32px").css("margin-top","-32px");
	for(var i=1;i<4;i++){//左右箭头包括左右箭头中间的数值
		$(".btnul").append("<li class=numli"+i+">"+[i]+"</li>");
		//在ul标签上动态添加li标签
		$(".numli"+i).attr("class",'btnnum btn');
		$(".btnnum").css("border-radius",'2px').css("border","1px solid #428bca");	
		$(".btnul li:eq(2)").hide();
	}
	$(".btnul").append("<button  id='btnRight' type='button'  class='right_index btn-primary btn-sm' >▶</button>")
	//在进行生成了左边的按钮之后进行生成右边的6个按钮
	getFive(0,0,2);
})
	

//当几区几档时右边的数字按钮的取值
	/**
	 for(var i=6;i<7;i++){// 确定最后一个格子是几+
		$(".btnnum2").css("border-radius",'2px');	
		$(".btnnum2"+i).attr("class",'four btn btn-primary');
	}
	 */
/**
 * @param y   如果y的取值为0则定值为6个按钮；反之不一定
 * @param  endIndex 以哪一个数字下标为最后一个按钮的取值
 * @param startIndex  以哪一个数字下标为第一个按钮的取值
 */
function getFive(startIndex,endIndex,y){//右边的几个数值按钮的生成
	$(".btnul2").html("");
	if(y==0){
		var index=0;
		for(var i=startIndex;i<=endIndex ;i++){//是右边的四个小格子
			if(startIndex!=endIndex){
			$(".btnul2").append("<li class=btnnum2"+i+">"+i+"</li>");
			}else{
				$(".btnul2").append("<li class=btnnum2"+i+">"+i+"+</li>");
			}
			$(".btnnum2").css("border-radius",'2px');	
			//给每一个数字按钮进行添加class选择器
			$(".btnnum2"+i).attr("class",'four btn btn-primary');
			index++;
			if(index==6){
				break;
			}
		}
	}else{
		var xxx=[1,2,3,11,12,13];//,21,22,23,31,32,33
		for(var i=0;i<xxx.length;i++){
			$(".btnul2").append("<li class=btnnum2"+xxx[i]+">"+xxx[i]+"</li>");
			$(".btnnum2").css("border-radius",'2px');	
			$(".btnnum2"+xxx[i]).attr("class",'four btn btn-primary');
		}
	}
}
	


	
	

//获取数据
function getTableData() {
	var tableData = []; //解析后的数据的二维数组,一维放一行的数据（[]）,二维放列的值
	$.ajax(getRootPath() +"/red.do?p=getRed", {
		type: 'get',
		timeout: 10000,
		dataType: 'json',
		success: function(data) {
				var trArr =  [];
				for (var i = 0; i < data.length; i++) {
 						var tdArr =  [];
 						tdArr[0] = data[i][0]; //期号
 						for (var j = 1; j < 7; j++) {
 							tdArr[j] = (data[i][j]);
 						}
 						tdArr.sort(function(a, b) {
							return a - b
						});
 						trArr.push(tdArr);
 						tableData.push(trArr);
				}
				paddingData(tableData);
		},
		error: function(xhr, type, errorThrown) {
			//异常处理；
			alert("您好，请检查一下您的网络是否异常！")
		}
	});
	//返回二维数组结果
	return tableData;
}

//生成随机数字	
function randomNodumpDigital(trArr) {
	var r = Math.floor(Math.random() * (10)) + 1;
	for(var i = 0; i < trArr.length; i++) {
		if(trArr[i] == r) {
			return randomNodumpDigital(trArr);
			break;
		}
	}
	if(r < 10) r = "0" + r;
	return r;
}

//隐藏和显示期数
$("#yincang").click(function() {
	var yincangF = $("#yincang");
	var yincangS = $(".tdIssue");
	if(yincangF.css("display") === "none") {
		yincangF.show();
		yincangS.show();
	} else {
		yincangF.hide();
		yincangS.hide();
	}
});

$(document).ready(function() {
	$(".tdIssue").click(function() {
		$(this).animate({
			opacity: "hide"
		}, "slow");
	});
});

//
//if(x[i]<x[j]){
//array.push(x[i]);
//array.push(x[j]);
//}else{
//array.push(x[j]);
//array.push(x[i]);
//}
/**两位数
 * for(var min = 1; min <= 33 - m; min++) {
	var arr2 = [];
	arr2.push(min);
	arr2.push(min + m);
	arry.push(arr2);
}
 * @param m
 * @param preValue 
 * 该值代表着
 * 如果存在该值为0，则返回的数组当中不必以哪一个值开头；
 * 如果存在该值不为0，则说明需要返回的数组将以preValue进行开头的数组
 * @returns {Array}
 */
function go2(m,preValue) {//固定二挡，只能是1.2.3.11.12.13.21.22.23.31.32.33
var arry = [];
var x=[1,2,3,11,12,13,21,22,23,31,32,33];
for(var i=0;i<x.length;i++){
	for(var j=0;j<i;j++){
		var array=[];
		array.push(x[j]);
		array.push(x[i]);
		
		if(preValue==0){
			arry.push(array);
		}else{
		if(array[0]==preValue){
			arry.push(array);
		}
		}
	}
}	
return arry;
}






function go4(m) {
	var arry = [];
	for(var min = 1; min <= 11 - m; min++) {
		var arr2 = [];
		arr2.push(min);
		arr2.push(min + m);
		arry.push(arr2);
	}
	return arry;
	}



//if(x[i]<x[j]){
//if(x[j]<x[o]){
//array.push(x[i]);
//array.push(x[j]);
//array.push(x[o]);
//}else{
//array.push(x[i]);
//array.push(x[o]);
//array.push(x[j]);
//}
//}else{
//array.push(x[o]);
//array.push(x[j]);
//array.push(x[i]);
//}
/**
 * 固定三挡
 *  for (var min=1; min<=33-m;min++)
		 {
			var max = min+m;
			for (var i=min+1;i<max;i++)
			{       
			        var arr2 = [];
			        arr2.push(min);
					arr2.push(i);
					arr2.push(max);
					arry.push(arr2);
			}
		 }
 * @param m
 * @returns {Array}
 */
function go3(m,preValue)
{
       var arry = [];
       var x=[1,2,3,11,12,13,21,22,23,31,32,33];
		for(var i=0;i<x.length;i++){
			for(var j=0;j<i;j++){
			    for(var o=0;o<j;o++){
					var array=[];
					array.push(x[o]);
					array.push(x[j]);
					array.push(x[i]);
					if(preValue==0){
						arry.push(array);
					}else{
					if(array[0]==preValue){
						arry.push(array);
					}
					}
				}
			}
		}
		console.log("打印以"+preValue+"开头的数组");
		console.log(array);
   return arry;
}

function go5(m)
{
       var arry = [];
		 for (var min=1; min<=11-m;min++)
		 {
			var max = min+m;
			for (var i=min+1;i<max;i++)
			{       
			        var arr2 = [];
			        arr2.push(min);
					arr2.push(i);
					arr2.push(max);
					arry.push(arr2);
			}
		 }
   return arry;
}
function go6(m) {
	var arry = [];
	for(var min = 12; min <= 22 - m; min++) {
		var arr2 = [];
		arr2.push(min);
		arr2.push(min + m);
		arry.push(arr2);
	}
	return arry;
}
function go7(m)
{
       var arry = [];
		 for (var min=12; min<=22-m;min++)
		 {
			var max = min+m;
			for (var i=min+1;i<max;i++)
			{       
			        var arr2 = [];
			        arr2.push(min);
					arr2.push(i);
					arr2.push(max);
					arry.push(arr2);
			}
		 }
   return arry;
}
function go8(m) {
	var arry = [];
	for(var min = 23; min <= 33 - m; min++) {
		var arr2 = [];
		arr2.push(min);
		arr2.push(min + m);
		arry.push(arr2);
	}
	return arry;
}
function go9(m)
{
       var arry = [];
		 for (var min=23; min<=33-m;min++)
		 {
			var max = min+m;
			for (var i=min+1;i<max;i++)
			{       
			        var arr2 = [];
			        arr2.push(min);
					arr2.push(i);
					arr2.push(max);
					arry.push(arr2);
			}
		 }
   return arry;
}
var arry2 = go2(1);//固定二档
var arry3 = go3(2);//固定三档
var arry4 = go4(1);//一区二档
var arry5 = go5(2);//一区三档
var arry6 = go6(1);//二区二档
var arry7 = go7(2);//二区三档
var arry8 = go8(1);//三区二档
var arry9 = go9(2);//三区三档
var index = 0;




$(function(){//默认显示的是固定二档
	if(index==0){
		  $("#btnLeft").attr("disabled","disabled");
	  }else{
		  $("#btnLeft").removeAttr("disabled");
	  }
	 if(index>=arry2.length-1){
		   $("#btnRight").attr("disabled","disabled");
	   }else{
		   $("#btnRight").removeAttr("disabled");
	   }
	 if($('.Selectbig option:selected').text()=="固定二档"){//当取值为固定二挡的时候
		 $("#btnRight").removeAttr("disabled");
			$(".btnul li:eq(2)").hide();
			arry2 = go2(1,0);//第一次的时候返回的数组为任意值开头的二维数组
			index = 0;
			$(".btnul li:eq(0)").text(arry2[index][0]);
			$(".btnul li:eq(1)").text(arry2[index][1]);
			showVIP(arry2[index],2);
			$("#btnRight").unbind("click");
			$("#btnLeft").unbind("click");
			$(function(){
				var three=document.querySelectorAll(".four");//获取所有类选择器为four的按钮
				for(var i=0;i<three.length;i++){//进行循环
				(function(m){ 
				       $(".four").eq(m).click(function(){//第几个按钮的点击事件
				    	   index = 0;//二维数组当中的第0个数组
				    	   var preValue=$(".four").eq(m).html();//点击以什么开头的值
				    	   arry2 = go2(m+1,preValue);//二维数组 
				    	   console.log("[获取二维数组]");
				    			$(".btnul li:eq(0)").text(arry2[index][0]);//左边格子当中的值
				    			$(".btnul li:eq(1)").text(arry2[index][1]);//右边格子当中的值
				    			showVIP(arry2[index],2);
				    	   if(index==0){
				    		   $("#btnLeft").attr("disabled","disabled");
				    	   }else{
				    		   $("#btnLeft").removeAttr("disabled");
				    		}
				    	   if(index>=arry2.length-1){  //
			   				   $("#btnRight").attr("disabled","disabled");
			   			   }else{
			   				$("#btnRight").removeAttr("disabled");
			   			   }
				      }); 
				   })(i);
				}
			})
			$("#btnRight").unbind("click");
			$("#btnRight").click(function(){
				index++;
		    	   $(".btnul li:eq(0)").text(arry2[index][0]);
				   $(".btnul li:eq(1)").text(arry2[index][1]);
				   showVIP(arry2[index],2);
				   $("#btnLeft").removeAttr("disabled");
				   if(index>=(arry2.length-1)){
					   $("#btnRight").attr("disabled","disabled");
				   }else{
					   $("#btnRight").removeAttr("disabled");
				   }
		      }); 
			$("#btnLeft").unbind("click");
		     $("#btnLeft").click(function(){
		    	   index--;
		    	   $(".btnul li:eq(0)").text(arry2[index][0]);
				   $(".btnul li:eq(1)").text(arry2[index][1]);
				   showVIP(arry2[index],2);
				   $("#btnRight").removeAttr("disabled");
				  if(index==0){
					  $("#btnLeft").attr("disabled","disabled");
				  }else{
					  $("#btnLeft").removeAttr("disabled");
				  }
		      });
		}
	 $("#btnRight").unbind("click");
	$("#btnRight").click(function(){
		index++;
    	   $(".btnul li:eq(0)").text(arry2[index][0]);
		   $(".btnul li:eq(1)").text(arry2[index][1]);
		   showVIP(arry2[index],2);
		   $("#btnLeft").removeAttr("disabled");
		   if(index  >= (arry2.length-1)){ 
			   $("#btnRight").attr("disabled","disabled");
		   }else{
			   $("#btnRight").removeAttr("disabled");
		   }
      });
	$("#btnLeft").unbind("click");
	$("#btnLeft").click(function(){
 	   index--;
 	   	   $(".btnul li:eq(0)").text(arry2[index][0]);
		   $(".btnul li:eq(1)").text(arry2[index][1]);
		   showVIP(arry2[index],2);
		   $("#btnRight").removeAttr("disabled");
		  if(index==0){
			  $("#btnLeft").attr("disabled","disabled");
		  }else{
			  $("#btnLeft").removeAttr("disabled");
		  }
   });
})






/**
 * 当下拉列表变动取值的时候
 * level:下拉列表选中的值
 * m:调用go方法需要的m值
 * preValue:获取的数组是全部还是以preValue开头第一个数值的数组
 * showVip1:点击右箭头时；
 * showVip2:点击左箭头时；
 * startIndex：右边格子当中的第一个值
 * endIndex:右边格子当中的最后一个值
 * y:y为0，则右边格子的取值为startIndex与endIndex的中间值；否则为固定数值
 */
function change(){
	var level=0;
	var m=0;
	var preValue=0;
	var showVip1=0;
	var showVip2=0;
	var startIndex=0;
	var endIndex=0;
	var y=0;
	if($('.Selectbig option:selected').text()=="固定二档"){
		$("#btnRight").removeAttr("disabled");
		 level=2;
		 m=1;
		 preValue=0;
		 showVip1=2;
		 showVip2=2;
		 startIndex=0;
		 endIndex=0;
		 y=2;
	}
	if($('.Selectbig option:selected').text()=="固定三档"){
		 level=3;
		 m=2;
		 preValue=0;
		 showVip1=3;
		 showVip2=3;
		 startIndex=0;
		 endIndex=0;
		 y=3;
	}
	if($('.Selectbig option:selected').text()=="一区二档"){
		$("#btnRight").removeAttr("disabled");
		 level=4;
		 m=1;
		 preValue=0;
		 showVip1=2;
		 showVip2=2;
		 startIndex=1;
		 endIndex=10;
		 y=0;
	}
	if($('.Selectbig option:selected').text()=="一区三档"){
		 level=5;
		 m=2;
		 preValue=0;
		 showVip1=3;
		 showVip2=3;
		 startIndex=1;
		 endIndex=9;
		 y=0;
	}
	if($('.Selectbig option:selected').text()=="二区二档"){
		 $("#btnRight").removeAttr("disabled");
		 level=6;
		 m=1;
		 preValue=0;
		 showVip1=2;
		 showVip2=2;
		 startIndex=12;
		 endIndex=21;
		 y=0;
	}
	if($('.Selectbig option:selected').text()=="二区三档"){
		 level=7;
		 m=2;
		 preValue=0;
		 showVip1=3;
		 showVip2=3;
		 startIndex=12;
		 endIndex=20;
		 y=0;
	}
	if($('.Selectbig option:selected').text()=="三区二档"){
		 level=8;
		 m=1;
		 preValue=0;
		 showVip1=2;
		 showVip2=3;
		 startIndex=23;
		 endIndex=32;
		 y=0;
	}
	if($('.Selectbig option:selected').text()=="三区三档"){
		 level=9;
		 m=2;
		 preValue=0;
		 showVip1=3;
		 showVip2=3;
		 startIndex=23;
		 endIndex=30;
		 y=0;
	}
	 var array=step1(level,m,preValue);
	 step2(level);
	 step3(array,showVip1,showVip2,level);
	 step4(startIndex,endIndex,y);
}

/**
 * 当点击右边的格子时；更换数组
 */
$(".four").click(function(){
	console.log("[被点击]");
	var level=getLevel();
       step2(level);
}); 




$(".right").click(function() {
	var $tdindex1 = $(".active");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one").removeClass("active");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==11){
			$(".one").eq(0).addClass("active");
		}
		else{  
			$(".one").eq(act1*1).toggleClass("active");
		}
	}
	var $tdindex1 = $(".active2");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".two").removeClass("active2");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==22){
			$(".two").eq(0).addClass("active2");
		}
		else{  
			$(".two").eq(act1*1-11).toggleClass("active2");
		}
	}
	var $tdindex1 = $(".active3");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".three").removeClass("active3");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==33){
			$(".three").eq(0).addClass("active3");
		}
		else{  
			$(".three").eq(act1*1-22).toggleClass("active3");
		}
	}

})
$(".left").click(function() {
	var $tdindex1 = $(".active");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one").removeClass("active");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==0){
			$(".one").eq(11).addClass("active");
		}
		else{  
			$(".one").eq(act1*1-2).toggleClass("active");
		}
	}
	var $tdindex1 = $(".active2");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".two").removeClass("active2");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==12){
			$(".two").eq(10).addClass("active2");
		}
		else{  
			$(".two").eq(act1*1-2-11).toggleClass("active2");
		}
	}
	var $tdindex1 = $(".active3");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".three").removeClass("active3");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==23){
			$(".three").eq(10).addClass("active3");
		}
		else{  
			$(".three").eq(act1*1-2-22).toggleClass("active3");
		}
	}
	
})
function showVIP(param,n)
{
//	var array=[0,1,2,3,4];
	$(".one").removeClass("active");//原来选中的红色格子
	$(".two").removeClass("active");//原来选中的红色格子
	$(".three").removeClass("active");//原来选中的红色格子
	$(".two").removeClass("active2");//原来选中的红色格子
	$(".three").removeClass("active3");//原来选中的红色格子
	$(".one1").removeClass("active");
	for(var i=0;i<11;i++){
		$(".one1").eq(param[i]-1).addClass("active");
	}
}




/*param
 * level:下拉列表选中的级别值
 * m:调用go x()方法所需要的m
 * preValue:该数组是所有的数组还是以preValue值开头的数组
 * ind:index 取出二维数组当中的第index个数组
 * 
 * return
 * array:返回该数组
 * */
function getArry(level,m,preValue,ind){
	index = ind;
	var array;
	if(level==2){
		arry2 = go2(m,preValue);
		array = arry2;
		showVIP(arry2[index],2);
	}else if(level==3){
		arry3 = go3(m,preValue);
		array = arry3;
		showVIP(arry3[index],3);
	}else if(level==4){
		arry4 = go4(m,preValue);
		array = arry4;
		showVIP(arry4[index],2);
	}else if(level==5){
		arry5 = go5(m,preValue);
		array = arry5;
		showVIP(arry5[index],3);
	}else if(level==6){
		arry6 = go6(m,preValue);
		array = arry6;
		showVIP(arry6[index],2);
	}else if(level==7){
		arry7 = go9(m,preValue);
		array = arry7;
		showVIP(arry7[index],3);
	}else if(level==8){
		arry8 = go8(m,preValue);
		array = arry8;
		showVIP(arry8[index],2);
	}else if(level==9){
		arry9 = go9(m,preValue);
		array = arry9;
		showVIP(arry9[index],3);
	}
	if(level==3 || level==5 || level==7 || level==9){
		$(".btnul li:eq(0)").text(array[index][0]);
		   $(".btnul li:eq(1)").text(array[index][1]);
		   $(".btnul li:eq(2)").text(array[index][3]);
	}else{
		   $(".btnul li:eq(0)").text(array[index][0]);
		   $(".btnul li:eq(1)").text(array[index][1]);
		   $(".btnul li:eq(2)").hide();
	}
	console.log(array);
	return array;
}
/*param  
 * level：表示的是下拉列表选取的是哪一个值
 * m：表示的是go方法当中的m
 * preValue：表示的是全部的数组；还是以prValue值开头的所有数组
 * 
 * return
 * array：返回的数组是该下拉列表所选取的哪一个具体的数组
 * */
function step1(level,m,preValue){
	index=0;
	if(level==2 || level==4 || level==6){
		$("#btnRight").removeAttr("disabled");
	}
	$(".btnul li:eq(2)").show();
	$(".btnul2 li:eq(0)").hide();
	var array=getArry(level,m,preValue,index);
	$("#btnRight").unbind("click");
	$("#btnLeft").unbind("click");
	return array;
}

/**
 * 获取该右边的几个格子按钮；查看是否当中的某一个格子按钮被点击；如被点击则
 * @param level
 */
function step2(level){
	$(function(){
		var three=document.querySelectorAll(".four");
		for(var i=0;i<three.length;i++){
		(function(m){ 
		       $(".four").eq(m).click(function(){
		    	   console.log("m:"+m);
		    	   index = 0;
		    	   var preValue=$(".four").eq(m).html();
		    	   var m2=0;
		    	   if(level==2){
		    			m2=m+4;
		    		}else if(level==4){
		    			m2=m+1;
		    		}else if(level==3||level==5||level==6||level==7 ||level==8 || level==9){
		    			m2=m+2;
		    		}
		    	   var array=getArry(level,m2,preValue,index);
		    	   
		    	   //最大值最小值处理
		    	   if($(".btnul li:eq(0)").text()==1){
		    		   $("#btnLeft").attr("disabled","disabled");
		    	   }else{
		    		   $("#btnLeft").removeAttr("disabled");
		    		}
		    	   if(index>=array.length-1){
	   				   $("#btnRight").attr("disabled","disabled");
	   			   }else{
	   				$("#btnRight").removeAttr("disabled");
	   			   }
		      }); 
		   })(i);
		}
	})
}


/**
 * 右边的箭头按钮以及左边的箭头按钮；按下之后中间两个格子显示的值
 * @param array     二维数组
 * @param showVip1  右边的箭头按钮点击；则该数组当中的第index++个数组取值，填入箭头按钮中间
 * @param showVip2  左边的箭头按钮点击；则该数组当中的第index--个数组取值，填入箭头按钮中间
 */
function step3(array,showVip1,showVip2,level){
	$("#btnRight").click(function(){
		index++;
		if(level==3 || level==5 || level==7 || level==9){
			   $(".btnul li:eq(0)").text(array[index][0]);
			   $(".btnul li:eq(1)").text(array[index][1]);
			   $(".btnul li:eq(2)").show();
			   $(".btnul li:eq(2)").text(array[index][2]);
		}else{
			  $(".btnul li:eq(0)").text(array[index][0]);
			   $(".btnul li:eq(1)").text(array[index][1]);
			   $(".btnul li:eq(2)").hide();
		}
    	   
		   showVIP(array[index],showVip1==2?2:3);
		   $("#btnLeft").removeAttr("disabled");
		   if(index>=(array.length-1)){
			   $("#btnRight").attr("disabled","disabled");
		   }else{
			   $("#btnRight").removeAttr("disabled");
		   }
      }); 
     $("#btnLeft").click(function(){
    	   index--;
    	   if(level==3 || level==5 || level==7 || level==9){
   			  $(".btnul li:eq(0)").text(array[index][0]);
   			   $(".btnul li:eq(1)").text(array[index][1]);
   			$(".btnul li:eq(2)").show();
   			   $(".btnul li:eq(2)").text(array[index][2]);
   		}else{
   			$(".btnul li:eq(0)").text(array[index][0]);
   			   $(".btnul li:eq(1)").text(array[index][1]);
   			$(".btnul li:eq(2)").hide();
   		}
		   showVIP(array[index],showVip2==2?2:3);
		   $("#btnRight").removeAttr("disabled");
		  if(index==0){
			  $("#btnLeft").attr("disabled","disabled");
		  }else{
			  $("#btnLeft").removeAttr("disabled");
		  }
      });
}

/**
 * 用于获取右边的5个格子
 * @param startIndex
 * @param endIndex
 * @param y        
 */
function step4(startIndex,endIndex,y){
	getFive(startIndex,endIndex,y);//生成了右边的按钮之后在进行添加
	$(function(){
		var three=document.querySelectorAll(".four");//获取所有类选择器为four的按钮
		for(var i=0;i<three.length;i++){//进行循环
		(function(m){ 
		       $(".four").eq(m).click(function(){//第几个按钮的点击事件
		    	   index = 0;//二维数组当中的第0个数组
		    	   var preValue=$(".four").eq(m).html();//点击以什么开头的值
		    	   var level=getLevel();
		    	  var  array=getArry(level,m+1,preValue,index);
//		    	   arry2 = go2(m+1,preValue);//二维数组 
//		    	   console.log("[获取二维数组]");
//		    			$(".btnul li:eq(0)").text(arry2[index][0]);//左边格子当中的值
//		    			$(".btnul li:eq(1)").text(arry2[index][1]);//右边格子当中的值
//		    			showVIP(arry2[index],2);
		    	   if(index==0){
		    		   $("#btnLeft").attr("disabled","disabled");
		    	   }else{
		    		   $("#btnLeft").removeAttr("disabled");
		    		}
		    	   if(index>=arry2.length-1){  //
	   				   $("#btnRight").attr("disabled","disabled");
	   			   }else{
	   				$("#btnRight").removeAttr("disabled");
	   			   }

		    	   $("#btnRight").unbind("click");
					$("#btnRight").click(function(){
						index++;
//				    	   $(".btnul li:eq(0)").text(arry2[index][0]);
//						   $(".btnul li:eq(1)").text(arry2[index][1]);
						 if(level==3 || level==5 || level==7 || level==9){
				   			  $(".btnul li:eq(0)").text(array[index][0]);
				   			   $(".btnul li:eq(1)").text(array[index][1]);
				   			$(".btnul li:eq(2)").show();
				   			   $(".btnul li:eq(2)").text(array[index][2]);
				   		}else{
				   			$(".btnul li:eq(0)").text(array[index][0]);
				   			   $(".btnul li:eq(1)").text(array[index][1]);
				   			$(".btnul li:eq(2)").hide();
				   		}
						
						   showVIP(arry2[index],2);
						   $("#btnLeft").removeAttr("disabled");
						   if(index>=(arry2.length-1)){
							   $("#btnRight").attr("disabled","disabled");
						   }else{
							   $("#btnRight").removeAttr("disabled");
						   }
				      }); 
					$("#btnLeft").unbind("click");
				     $("#btnLeft").click(function(){
				    	   index--;
//				    	   $(".btnul li:eq(0)").text(arry2[index][0]);
//						   $(".btnul li:eq(1)").text(arry2[index][1]);
				    	   if(level==3 || level==5 || level==7 || level==9){
				    			  $(".btnul li:eq(0)").text(array[index][0]);
				    			   $(".btnul li:eq(1)").text(array[index][1]);
				    			$(".btnul li:eq(2)").show();
				    			   $(".btnul li:eq(2)").text(array[index][2]);
				    		}else{
				    			$(".btnul li:eq(0)").text(array[index][0]);
				    			   $(".btnul li:eq(1)").text(array[index][1]);
				    			$(".btnul li:eq(2)").hide();
				    		}
				    	   
						   showVIP(arry2[index],2);
						   $("#btnRight").removeAttr("disabled");
						  if(index==0){
							  $("#btnLeft").attr("disabled","disabled");
						  }else{
							  $("#btnLeft").removeAttr("disabled");
						  }
				      });
		    	   
		    	   
		      }); 
		   })(i);
		}
	})
}

/**
 * 获取当前下拉列表当中的取值
 */
function getLevel(){
	var level=0;
	var value=$('.Selectbig option:selected').text();
		if(value=="固定二档"){level=2;}
		if(value=="固定三档"){level=3;}
		if(value=="一区二档"){level=4;}
		if(value=="一区三档"){level=5;}
		if(value=="二区二档"){level=6;}
		if(value=="二区三档"){level=7;}
		if(value=="三区二档"){level=8;}
		if(value=="三区三档"){level=9;}
		return level;
}



window.setTimeout(function(){
	$("#ul>li").removeClass("active");
	
},300);
