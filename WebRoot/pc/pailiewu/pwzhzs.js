/*浏览器兼容*/
function myBrowser() {  
	var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
	var isOpera = userAgent.indexOf("Opera") > -1;
	if(userAgent.indexOf("Firefox") > -1) { //判断是否Firefox浏览器
		return "FF";
	}
	if(userAgent.indexOf("Chrome") > -1) {
		return "Chrome";
	}
}
/*以下是调用上面的函数*/
var mb = myBrowser();
$(function(){
	if("FF" == mb) {
	$(".moni_xh").css("width","119px");
	$(".wrap ul li").css("width","24.15px");
	$(".wrap1 ul li").css("width","24.15px");
}
if("Chrome" == mb) {
	var center = document.getElementById("center");
	$('.moni_xh').css("width","121px");
}
})

// 初始化数据
getTableData();
var size = 0;
function paddingData(tableData) {
	var $table = $("#hswsTu");
	for (var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); // 底色
		var trArr = tableData[i];
		// 数据
		var tdArr = trArr[i];
		// 期号
		var $td = $("<td></td>");
		$td.toggleClass("c");
		$td.text(tdArr[5]);
		$tr.append($td);
		var trArrIndex = 0;
		var last = -1;
		// 0-9的尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdFirst");
			for (var k=0;k<5;k++)
			{
				if (j == parseInt(tdArr[k])) {
					$td.css("color", "white"); // 字体颜色
					$td.text(tdArr[k]);
					$td.css("background-color", "#107C10"); // 球的背景颜色
					break;
				} else {
					$td.text("  ");
					$td.css("background-color", "#FFFACD"); // 球的背景颜色
				}
			}
			//$td.css("background-color", "#EAC4CF"); // 球的背景颜色
			$tr.append($td);
		}

		trArrIndex = 0;
		last = -1;
		// 0-4的尾数
		for (var j = 0; j < 5; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdFirst");
			for (var k=0;k<3;k++)
			{
				if (j == parseInt(tdArr[k])) {
					$td.css("color", "white"); // 字体颜色
					$td.text(tdArr[k]);
					$td.css("background-color", "#107C10"); // 球的背景颜色
					break;
				} else {
					$td.text("  ");
					$td.css("background-color", "#FFFACD"); // 球的背景颜色
				}
			}
			//$td.css("background-color", "#EAC4CF"); // 球的背景颜色
			$tr.append($td);
			
		}
		//空白处
		for (var j = 0; j < 1; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
				$td.css("background-color", "#FFFFFF");
			 // 球的背景颜色
			$tr.append($td);
		}
		//个数
		for ( var j = 0; j < 1; j++) {
			var $td = $("<td></td>").toggleClass("tdSecond");
//			var n = tdArr[5] % 3;
				$td.text(tdArr[6]);
				$td.css("color", "#000000").css("font-weight", "bold"); // 字体颜色
				$td.css("background-color", "#EAEEEE"); // 球的背景颜色
			$tr.append($td);
		}
		for ( var j = 0; j < 1; j++) {
			var $td = $("<td></td>").toggleClass("tdSecond");
				$td.text(tdArr[7]);
				$td.css("color", "#000000").css("font-weight", "bold"); // 字体颜色
				$td.css("background-color", "#EAEEEE"); // 球的背景颜色
			$tr.append($td);
		}
		for ( var j = 0; j < 1; j++) {
			var $td = $("<td></td>").toggleClass("tdSecond");
				$td.text(tdArr[8]);
				$td.css("color", "#000000").css("font-weight", "bold"); // 字体颜色
				$td.css("background-color", "#EAEEEE"); // 球的背景颜色
			$tr.append($td);
		}
		//个数结束
//		跨度
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if (j != parseInt(tdArr[9]%10)){
				$td.text("  ");
				$td.css("background-color", "#CDFCBA");
			} else {
				$td.css("color","white").css("font-weight","bold")
				$td.addClass("zhexian1");  // 字体颜色
				$td.text(j);
				$td.css("background-color","#107C10");
			}
			$tr.append($td);
		}
		$table.append($tr);
	}
	
	/*my*/
	for (var i = 0; i < 3; i++) {
		var $tr = $("<tr></tr>");
		if (i==0)
			$tr.toggleClass("trStyle oneMoni");
		else
			$tr.toggleClass("trStyle");
		$table.append($tr);
		$tr.css("background-color", "#EAEEEE"); // 底色
		var $td = $("<td></td>");
		$td.toggleClass("c");
		if (i==0)
		$td.text("模拟选号");
		$tr.append($td);
		// 0-9的尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdFirst");
			$td.text(j)
			$td.css("background-color", "#FFFACD").css("color","#FFFACD"); // 球的背景颜色
			$tr.append($td);
			if (i == 0) {
				$td.toggleClass("one");
			}
		}
		trArrIndex = 0;
		last = -1;
		// 0-4的尾数
		for (var j = 0; j < 5; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
				$td.text(j)
				$td.css("background-color", "#FFFACD").css("color","#FFFACD"); // 球的背景颜色
			$tr.append($td);
			if (i == 0) {
				$td.toggleClass("two");
			}
		}
		/*跨度*/
		for (var j = 0; j < 1; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			$td.text(j)
			$td.css("background-color", "#FFFFFF").css("color","#FFFFFF"); // 球的背景颜色
			$tr.append($td);
		}
		//个数
		for (var j = 0; j < 3; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			$td.text(j);
			$td.css("background-color", "#EAEEEE").css("color","#EAEEEE"); // 球的背景颜色
			$tr.append($td);
		}
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			$td.text(j);
			$td.css("background-color", "#CDFCBA").css("color","#CDFCBA"); // 球的背景颜色
			$tr.append($td);
		}
		$table.append($tr);
	}
	$(function(){
	var Next = $(".two");
	var Pre = $(".one");
	for(var i=0;i<Pre.length;i++){
		(function(m){         
			Pre.eq(m).click(function(){
				Pre.eq(m).toggleClass("active") 
				if(Pre.eq(m).toggleClass("active")){
					Next.eq(m).toggleClass("active2");
				}else{
					Next.eq(m).ClassName("mnxhqh_"+i+" ");
				}
				Pre.eq(m).toggleClass("active")
				if($('.active').length>3){
		    		  //$(this).removeClass("active");
		    		  //Next.eq(m).removeClass("active2");
		    		  //layer.msg('0-9尾数最多只能选择3个哦');
		    		 // return;
		    	  }
		      }); 
		   })(i);
	}
});
	drawWhzs(); //画折线
	
}
 /*得到工程路径*/
function getRootPath() {
	// http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	// uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	// http://localhost:8083
	var localhostPaht = curWwwPath.substring(0, pos);
	// uimcardprj
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	if (projectName == "/pc" || projectName == "/admin"
			|| projectName == "/weixin")
		projectName = "";

	return (localhostPaht + projectName);
}
// 获取数据
function getTableData() {
	var isTest = false;
	var tableData = [];
	$.ajax(getRootPath() + "/5d.do?p=get3d2", {
				type : 'post',
				timeout : 10000,
				dataType : 'json',
				success : function(data) {
					var trArr = [];
					for (var i = 0; i < data.length; i++) {
						var tdArr = [];
						tdArr[0] = data[i][0]; // 期号
						//期号，1-3  跨度，和尾
						for (var j = 1; j < 6; j++) {
							     tdArr[j] = (data[i][j])%10; // (data[i][j])
						}
						tdArr.sort(function(a, b) {
									return a - b
								});
								
					    for (var j=6;j<10;j++)
					    {
					    	tdArr[j] =  data[i][j];
					    }
						
						trArr.push(tdArr);
						tableData.push(trArr);
					}
					paddingData(tableData);
					
				},
				error : function(xhr, type, errorThrown) {
					// 异常处理
					alert("您好，请检查一下您的网络是否异常！")
				}
			});
}
function drawLqzs() {
//	table_canvas = new draw2d.Canvas("zhwsTu");
	isInitOk = true;

	// 得到圆的圆点X+圆点Y+圆半径 并画图
	table_canvas = new draw2d.Canvas("zhwsTu");// if(!table_canvas)
	$("svg").css("top", "45px");
	$("svg").css("left", "0px");// 由于自带样式中绝对定位有偏移
	$("svg").css("width", "80%");
	var tableHeight = $("#zhwsTu")[0].offsetHeight-40;
//	console.log("sdsds:"+tableHeight)
	
	$("svg").css("height", tableHeight);
	var lastPoints = new Array();
	var linePositons = new Array();
	var lastAngles = new Array();
	$(".zhexian").each(
			function(index, ele) {
				var ceilWidth = $(this).width() / 2;
				var ceilHeight = $(this).height() / 2;
				var X = $(this).position().left + ceilWidth;
				var Y = $(this).position().top + ceilHeight;
				if (y_head == -1) {
					y_head = $(this).position().top;
					Y = Y - y_head;
				} else {
					Y = Y - y_head;
				}
				var lastPoint = lastPoints[index - 1];
				if (lastPoint) {
					var lastPointArr = lastPoint.split("-");
					var preX = parseFloat(lastPointArr[0]);
					var preY = parseFloat(lastPointArr[1]);
					var lineX = X;
					var lineY = Y;
					var angle = (X - preX) / (Y - preY);
					var lastAngle = lastAngles[index - 1];
					lastAngles[index] = angle;
					if (angle == 0) {
						preY = preY + ceilHeight;
						lineY -= ceilHeight;
					} else if (angle > 0) {// 顺梯
						if (Math.abs(lineX - preX) < (ceilWidth * 3)) {// 角对角
							lineY = lineY - ceilHeight;
							preX = preX + ceilWidth;
						} else {// 分离
							preX += ceilWidth;
							lineX -= ceilWidth;
						}
					} else if (angle < 0) {// 逆梯
						if (Math.abs(lineX - preX) < (ceilWidth * 3)) {// 角对角
							lineY -= ceilHeight;
							preX -= ceilWidth;
						} else {// 分离
							preX -= ceilWidth;
							lineX += ceilWidth;
						}
					}
					// alert(preX+"--"+preY+"--"+lineX+"--"+lineY);
					table_canvas.addFigure(new draw2d.shape.basic.Line(preX,
							preY, lineX, lineY, null));
				}
				lastPoints[index] = X + "-" + Y;
			})
};

/** **********VIP选号********* */
var zuhe_Arr = [];
var qhArr_temp = [];
var sepeator = "-";

function vip_zx() {

	var $input_group = $(".input_group"); // 得到输入组的div

	// 生成输入框组
	for (var i = 0; i < 3; i++) {
		var $input = $("<input type='text' class='form-control in inputClass' onchange='repeat(this)'/>");
		$input_group.append($input);
	}
}

// 判断用户输入的值是否重复
function repeat(obj) {
	var objValue = obj.value;
	var isCheckOk = true;
	var arrTemp = [];
	// 遍历用户输入的值
	$.each($(".inputClass"), function(index, item) {
				if (obj != item) { // 排除自己与自己在数组中的值比较
					var itemValue = item.value;
					if (objValue == itemValue) { // 当前用户输入的值与其他的值相同时
						isCheckOk = false;
						return;
					}
					if (itemValue)
						arrTemp.push(itemValue*1);
				}
			});
	if (isCheckOk) {
		arrTemp.push(objValue*1);
		// 给输入框中的值排序
		// arrTemp.sort(function(l,n){
		// if(parseInt(l)>parseInt(n)){
		// return 1;
		// }else{
		// return -1;
		// }
		// });
		// 覆盖数组
		qhArr_temp = arrTemp;
	} else {
		// 清空
		obj.value = "";
		// 提示不能重复
		layer.msg('不能输入重复的尾数');
	}
}

function _xuanN(num) {
	xbIndex = 0;
	xuanN(num);
}

function xuanN(num) {

	// 将num的值变为全局变量
	xuanNum = num;

	if (qhArr_temp.length < 4) {
		layer.msg('尾数不能小于4个');
		return;
	}

	// 自动生成组合，并放到data数组中
	var data = combineData(qhArr_temp, num);
	size = data.length;
	// 从data数组中取出第一个组合
	var dataArr = data[xbIndex];
	// 移除上一个组合的样式
	var id = ".mnxhqh_";
	for (var i = 0; i < 10; i++) {
		$(id + i).removeClass("active");
	}
	chooseIndexs = [];
	// 生成li组合并设置样式
	var $ul = $(".ul_xh"); // 得到ul
	$ul.empty();
	for (var j = 0; j < dataArr.length; j++) {
		var $li = $("<li>" + dataArr[j] + "</li>").toggleClass("li_lf");
		var idName = id + dataArr[j];
		var mnStyle_qh1 = $(idName).toggleClass("active");
		$ul.append($li);
		chooseIndexs.push(mnxh.indexOf(dataArr[j]));
	}

	var $left_index = $(".left_index");
	var $right_index = $(".right_index");
	$left_index.removeAttr("disabled");
	$right_index.removeAttr("disabled");
	if (xbIndex == 0) {
		$left_index.attr({
					"disabled" : "disabled"
				});
	} else if (xbIndex == (data.length - 1)) {
		$right_index.attr({
					"disabled" : "disabled"
				});
	}
}
$(function(){
	var $ul = $(".ul_xh"); // 得到ul
	xbIndex = 0;
	vip_zx();
	// 左右移的下标加减
	var $right_index = $(".right_index");
	$right_index.click(function() {
		        if (size==xbIndex)
		               return;		   
				xbIndex++;
				$ul.empty(); // 清空上一个选项的内容
				xuanN(xuanNum);
			});
	var $left_index = $(".left_index");
	$left_index.click(function() {
		
		        if (xbIndex<0) return;
				xbIndex--;
				$ul.empty(); // 清空上一个选项的内容
				xuanN(xuanNum);
			});
});
var table_canvas;
isInitOk = false;
y_head = -1;
function drawWhzs() {
	//alert(1)
	//table_canvas = new draw2d.Canvas("hswsTu");
	isInitOk = true;
    
	// 得到圆的圆点X+圆点Y+圆半径 并画图
	table_canvas = new draw2d.Canvas("hswsTu");// if(!table_canvas)
	$("svg").css("top", "54px");
	$("svg").css("left", "0px");// 由于自带样式中绝对定位有偏移
	$("svg").css("width", "100%");
//	$("svg").css("height",tableData.length*25);
	var tableHeight = $("tbody").height()-75;
	
	$("svg").css("height",tableHeight);
	var lastPoints = new Array();
	var linePositons = new Array();
	var lastAngles = new Array();

	

	$(".zhexian1").each(function(index, ele) {
		var ceilWidth = $(this).width() / 2;
		var ceilHeight = $(this).height() / 2;
		var X = $(this).position().left + ceilWidth;
		var Y = $(this).position().top + ceilHeight;
		if (y_head == -1) {
			y_head = $(this).position().top;
			Y = Y - y_head;
		} else {
			Y = Y - y_head;
		}
		var lastPoint = lastPoints[index - 1];
		if (lastPoint) {
			var lastPointArr = lastPoint.split("-");
			var preX = parseFloat(lastPointArr[0]);
			var preY = parseFloat(lastPointArr[1]);
			var lineX = X;
			var lineY = Y;
			var angle = (X - preX) / (Y - preY);
			var lastAngle = lastAngles[index - 1];
			lastAngles[index] = angle;
			if (angle == 0) {
				preY = preY + ceilHeight;
				lineY -= ceilHeight;
			} else if (angle > 0) {// 顺梯
				if (Math.abs(lineX - preX) < (ceilWidth * 3)) {// 角对角
					lineY = lineY - ceilHeight;
					preX = preX + ceilWidth;
				} else {// 分离
					preX += ceilWidth;
					lineX -= ceilWidth;
				}
			} else if (angle < 0) {// 逆梯
				if (Math.abs(lineX - preX) < (ceilWidth * 3)) {// 角对角
					lineY -= ceilHeight;
					preX -= ceilWidth;
				} else {// 分离
					preX -= ceilWidth;
					lineX += ceilWidth;
				}
			}
			// alert(preX+"--"+preY+"--"+lineX+"--"+lineY);
			//setColor
			var line = new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null);
			//line.setColor("#FF7900");
			table_canvas.addFigure(line);
		}
		lastPoints[index] = X + "-" + Y;
	})
};

$(window).resize(function() {
			if (isInitOk) {
				// 先删除历史
				//$("svg").remove(); // 直接移除控件
				// 重写测画
				//drawWhzs();
				//isInitOk = false;
			}
		});
/*选择组三*/
//[ [0,1,3] , [0,2,3]
/*跨度为m的三个数*/
function go3(m)
{
    var arry = [];
		 for (var min=0; min<=9-m;min++)
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
//选择组四  四位数
function go4(m) {
	if(m < 4 || m > 9) {
		return;
	}
	var arry = [];
	for(var i = 0; i <= 9; i++) {
		for(var j = 0; j < i; j++) {
			if(i - j == m) {
				var array = [];
				for(var x = j + 1; x < i; x++) {
					array.push(x);
				}
				for(var o = 0; o < array.length; o++) {
					for(var z = 0; z < o; z++) {
						if(array[z] < array[o]) {
							var arr2 = [];
							arr2.push(j);
							arr2.push(array[z]);
							arr2.push(array[o]);
							arr2.push(i);
							arry.push(arr2);
						}
					}
				}
			}
		}
	}
	return arry;
}
//选择组五  五位数
function go5(m) {
if(m<4 || m>9){
return;
}
var arry = [];
for(var i = 0; i <= 9; i++) {
for(var j=0; j < i; j++){
	if(i-j==m){
		var array=[];
			for(var x=j+1;x<i;x++){
			array.push(x);
			}
			for(var o=0;o<array.length;o++){
				for(var z=0;z<o;z++){
					for(var p=0;p<z;p++){
					if(array[p]<array[z]  &&  array[z]<array[o]){
					var arr2 = [];
					arr2.push(j);
					arr2.push(array[p]);
					arr2.push(array[z]);
					arr2.push(array[o]);
					arr2.push(i);
					arry.push(arr2);
				}
					}
				}
			}}
}
}
return arry;
}
var arry2 = go3(4);
var arry4 = go4(4);
var arry5 = go5(4);
var index = 0;
$(function(){
	for(var i=0;i<5;i++){
		$(".btnul").append("<li class=numli"+i+">"+[i]+"</li>");	//在ul标签上动态添加li标签
		$(".numli").css("border-radius",'2px');	
		$(".numli"+i).attr("class",'btnnum btn');
	}
	for(var i=4;i<10;i++){
		$(".btnul2").append("<li class=btnnum2"+i+">"+[i]+"</li>");
		$(".btnnum2").css("border-radius",'2px');	
		$(".btnnum2"+i).attr("class",'three btn btn-primary');
	}
	}) 
$(function(){
	if($('#group option:selected').text()=="选三"){
		$(".btnul li:eq(3)").hide();
		$(".btnul li:eq(4)").hide();
		arry2 = go3(4);
		$(".left2").attr("disabled","disabled");
		$(".right2").removeAttr("disabled");
		index = 0;
		$(".btnul li:eq(0)").text(arry2[index][0]);
		$(".btnul li:eq(1)").text(arry2[index][1]);
		$(".btnul li:eq(2)").text(arry2[index][2]);
		showVIP(arry2[index],3);
		 $(".right2").unbind("click");
		$(".right2").click(function(){
			index++;
	    	   $(".btnul li:eq(0)").text(arry2[index][0]);
			   $(".btnul li:eq(1)").text(arry2[index][1]);
			   $(".btnul li:eq(2)").text(arry2[index][2]);
			   showVIP(arry2[index],3);
			   $(".left2").removeAttr("disabled");
			   if(index>=arry2.length-1){
				   $(".right2").attr("disabled","disabled");
			   }else{
				   $(".right2").removeAttr("disabled");
			   }
	      }); 
		 $(".left2").unbind('click');
	     $(".left2").click(function(){
	    	   index--;
	    	   $(".btnul li:eq(0)").text(arry2[index][0]);
			   $(".btnul li:eq(1)").text(arry2[index][1]);
			   $(".btnul li:eq(2)").text(arry2[index][2]);
			   showVIP(arry2[index],3);
			   $(".right2").removeAttr("disabled");
			  if(index<=0){
				  $(".left2").attr("disabled","disabled");
			  }else{
				  $(".left2").removeAttr("disabled");
			  }
	      });
		
		 $(function(){
				var three=document.querySelectorAll(".three");
				for(var i=0;i<three.length;i++){
				(function(m){         
					 $(".three").eq(m).unbind("click");
				       $(".three").eq(m).click(function(){
				    	   index = 0
				    	   arry2 = go3(m+4);
				    			$(".btnul li:eq(0)").text(arry2[index][0]);
				    			$(".btnul li:eq(1)").text(arry2[index][1]);
				    			$(".btnul li:eq(2)").text(arry2[index][2]);
				    			showVIP(arry2[index],3);
				    	   if($(".btnul li:eq(0)").text()==0){
				    		   $(".left2").attr("disabled","disabled");
				    	   }else{
				    		   $(".left2").removeAttr("disabled");
				    	   }
				    	   if(index>arry2.length-1){
				    		   $(".right2").attr("disabled","disabled");
				    	   }else{
				    		   $(".right2").removeAttr("disabled");
				    	   }
				      }); 
				   })(i);
				}
			})
	}
})
$('#group').change(function(){
	if($('#group option:selected').text()=="选三"){
		$(".btnul li:eq(3)").hide();
		$(".btnul li:eq(4)").hide();
		arry2 = go3(4);
		$(".left2").attr("disabled","disabled");
		$(".right2").removeAttr("disabled");
		index = 0;
		$(".btnul li:eq(0)").text(arry2[index][0]);
		$(".btnul li:eq(1)").text(arry2[index][1]);
		$(".btnul li:eq(2)").text(arry2[index][2]);
		showVIP(arry2[index],3);
		 $(".right2").unbind("click");
		$(".right2").click(function(){
			index++;
	    	   $(".btnul li:eq(0)").text(arry2[index][0]);
			   $(".btnul li:eq(1)").text(arry2[index][1]);
			   $(".btnul li:eq(2)").text(arry2[index][2]);
			   showVIP(arry2[index],3);
			   $(".left2").removeAttr("disabled");
			   if(index>=arry2.length-1){
				   $(".right2").attr("disabled","disabled");
			   }else{
				   $(".right2").removeAttr("disabled");
			   }
	      }); 
		 $(".left2").unbind('click');
	     $(".left2").click(function(){
	    	   index--;
	    	   $(".btnul li:eq(0)").text(arry2[index][0]);
			   $(".btnul li:eq(1)").text(arry2[index][1]);
			   $(".btnul li:eq(2)").text(arry2[index][2]);
			   showVIP(arry2[index],3);
			   $(".right2").removeAttr("disabled");
			  if(index<=0){
				  $(".left2").attr("disabled","disabled");
			  }else{
				  $(".left2").removeAttr("disabled");
			  }
	      });
		
		 $(function(){
				var three=document.querySelectorAll(".three");
				for(var i=0;i<three.length;i++){
				(function(m){         
					 $(".three").eq(m).unbind("click");
				       $(".three").eq(m).click(function(){
				    	   index = 0
				    	   arry2 = go3(m+4);
				    			$(".btnul li:eq(0)").text(arry2[index][0]);
				    			$(".btnul li:eq(1)").text(arry2[index][1]);
				    			$(".btnul li:eq(2)").text(arry2[index][2]);
				    			showVIP(arry2[index],3);
				    	   if($(".btnul li:eq(0)").text()==0){
				    		   $(".left2").attr("disabled","disabled");
				    	   }else{
				    		   $(".left2").removeAttr("disabled");
				    	   }
				    	   if(index>arry2.length-1){
				    		   $(".right2").attr("disabled","disabled");
				    	   }else{
				    		   $(".right2").removeAttr("disabled");
				    	   }
				      }); 
				   })(i);
				}
			})
	}
	if($('#group option:selected').text()=="选四"){
		
		$(".btnul li:eq(3)").show();
		$(".btnul li:eq(4)").hide();
		arry4 = go4(4);
		$(".left2").attr("disabled","disabled");
		$(".right2").removeAttr("disabled");
		index = 0;
		$(".btnul li:eq(0)").text(arry4[index][0]);
		$(".btnul li:eq(1)").text(arry4[index][1]);
		$(".btnul li:eq(2)").text(arry4[index][2]);
		$(".btnul li:eq(3)").text(arry4[index][3]);
		showVIP(arry4[index],4);
		 $(".right2").unbind("click");
		$(".right2").click(function(){
			index++;
	    	   $(".btnul li:eq(0)").text(arry4[index][0]);
			   $(".btnul li:eq(1)").text(arry4[index][1]);
			   $(".btnul li:eq(2)").text(arry4[index][2]);
			   $(".btnul li:eq(3)").text(arry4[index][3]);
			   showVIP(arry4[index],4);
			   $(".left2").removeAttr("disabled");
			   if(index>=arry4.length-1){
				   $(".right2").attr("disabled","disabled");
			   }else{
				   $(".right2").removeAttr("disabled");
			   }
	      }); 
		 $(".left2").unbind('click');
	     $(".left2").click(function(){
	    	   index--;
	    	   $(".btnul li:eq(0)").text(arry4[index][0]);
			   $(".btnul li:eq(1)").text(arry4[index][1]);
			   $(".btnul li:eq(2)").text(arry4[index][2]);
			   $(".btnul li:eq(3)").text(arry4[index][3]);
			   showVIP(arry4[index],4);
			   $(".right2").removeAttr("disabled");
			  if(index<=0){
				  $(".left2").attr("disabled","disabled");
			  }else{
				  $(".left2").removeAttr("disabled");
			  }
	      });
		
		 $(function(){
				var three=document.querySelectorAll(".three");
				for(var i=0;i<three.length;i++){
				(function(m){         
					 $(".three").eq(m).unbind("click");
				       $(".three").eq(m).click(function(){
				    	   index = 0
				    	   arry4 = go4(m+4);
				    			$(".btnul li:eq(0)").text(arry4[index][0]);
				    			$(".btnul li:eq(1)").text(arry4[index][1]);
				    			$(".btnul li:eq(2)").text(arry4[index][2]);
				    			$(".btnul li:eq(3)").text(arry4[index][3]);
				    			showVIP(arry4[index],4);
				    	   if($(".btnul li:eq(0)").text()==0){
				    		   $(".left2").attr("disabled","disabled");
				    	   }else{
				    		   $(".left2").removeAttr("disabled");
				    	   }
				    	   if(index>arry4.length-1){
				    		   $(".right2").attr("disabled","disabled");
				    	   }else{
				    		   $(".right2").removeAttr("disabled");
				    	   }
				      }); 
				   })(i);
				}
			})
	}
	if($('#group option:selected').text()=="选五"){
		$(".btnul li:eq(3)").show();
		$(".btnul li:eq(4)").show();
		arry5 = go5(4);
		$(".left2").attr("disabled","disabled");
		$(".right2").removeAttr("disabled");
		index = 0;
		$(".btnul li:eq(0)").text(arry5[index][0]);
		$(".btnul li:eq(1)").text(arry5[index][1]);
		$(".btnul li:eq(2)").text(arry5[index][2]);
		$(".btnul li:eq(3)").text(arry5[index][3]);
		$(".btnul li:eq(4)").text(arry5[index][4]);
		showVIP(arry5[index],5);
		 $(".right2").unbind("click");
		$(".right2").click(function(){
			index++;
			$(".btnul li:eq(0)").text(arry5[index][0]);
			$(".btnul li:eq(1)").text(arry5[index][1]);
			$(".btnul li:eq(2)").text(arry5[index][2]);
			$(".btnul li:eq(3)").text(arry5[index][3]);
			$(".btnul li:eq(4)").text(arry5[index][4]);
			   showVIP(arry5[index],5);
			   $(".left2").removeAttr("disabled");
			   if(index>=arry5.length-1){
				   $(".right2").attr("disabled","disabled");
			   }else{
				   $(".right2").removeAttr("disabled");
			   }
	      }); 
		 $(".left2").unbind('click');
	     $(".left2").click(function(){
	    	   index--;
	    	   $(".btnul li:eq(0)").text(arry5[index][0]);
		   		$(".btnul li:eq(1)").text(arry5[index][1]);
		   		$(".btnul li:eq(2)").text(arry5[index][2]);
		   		$(".btnul li:eq(3)").text(arry5[index][3]);
		   		$(".btnul li:eq(4)").text(arry5[index][4]);
			   showVIP(arry5[index],3);
			   $(".right2").removeAttr("disabled");
			  if(index<=0){
				  $(".left2").attr("disabled","disabled");
			  }else{
				  $(".left2").removeAttr("disabled");
			  }
	      });
		
		 $(function(){
				var three=document.querySelectorAll(".three");
				for(var i=0;i<three.length;i++){
				(function(m){         
					 $(".three").eq(m).unbind("click");
				       $(".three").eq(m).click(function(){
				    	   index = 0
				    	   arry5 = go5(m+4);
				    	   $(".btnul li:eq(0)").text(arry5[index][0]);
					   		$(".btnul li:eq(1)").text(arry5[index][1]);
					   		$(".btnul li:eq(2)").text(arry5[index][2]);
					   		$(".btnul li:eq(3)").text(arry5[index][3]);
					   		$(".btnul li:eq(4)").text(arry5[index][4]);
				    			showVIP(arry5[index],5);
				    	   if($(".btnul li:eq(0)").text()==0){
				    		   $(".left2").attr("disabled","disabled");
				    	   }else{
				    		   $(".left2").removeAttr("disabled");
				    	   }
				    	   if(index>arry5.length-1){
				    		   $(".right2").attr("disabled","disabled");
				    	   }else{
				    		   $(".right2").removeAttr("disabled");
				    	   }
				      }); 
				   })(i);
				}
			})
	}
})
//VIP号 显示在模拟区
function showVIP(param,n)
{
	$(".one").removeClass("active");
	$(".two").removeClass("active2");
	$(".active4").removeClass("active4");
	$(".active3").removeClass("active3");
	
	for (var i=0;i<n;i++)
	{
		$(".oneMoni>td").each(function(j,li){
			//alert(j)
			if (param[i]==j-1)
			{
				//alert(j);
				$(li).addClass("active");
		        if (j-1<5)
		        {
		            $(".oneMoni>.tdSecond").eq(j-1).addClass("active2");
		        }
			}
			
		});
	   	
	}
	
}

$(function(){
	if($('#group option:selected').text()=="组三"){
		$(function(){
			var three=document.querySelectorAll(".three");
			for(var i=0;i<three.length;i++){
			(function(m){   
				   $(".three").eq(m).unbind("click");
			       $(".three").eq(m).click(function(){
			    	   index = 0;
			    	   arry = go2(m+4);
			    			$(".btnul li:eq(0)").text(arry[index][0]);
			    			$(".btnul li:eq(1)").text(arry[index][1]);
			    			$(".btnul li:eq(2)").text(arry[index][2]);
			    			showVIP(arry[index],3);
			    	   if($(".btnul li:eq(0)").text()==0){
			    		   $(".left2").addClass("disabled");
			    	   }else{
			    		   $(".left2").removeClass("disabled");
			    		}
			    	   if(index>=arry.length){
			    		   $(".right2").addClass("disabled");
			    	   }else{
			    		   $(".right2").removeClass("disabled");
			    	   }
			    	   if($(".btnul li:eq(2)").text()>=9){
							$(".right2").addClass("disabled");
						}else{
							$(".right2").removeClass("disabled");
						}
			      }); 
			   })(i);
			}
		})
		$('.left2').click(function(){
			$(".right2").removeClass("disabled");
			if($(".btnul li:eq(2)").text()>=9){
				$(".right2").addClass("disabled");
			}else{
				$(".right2").removeClass("disabled");
			}
		})
		
	}
	})

$(function(){
	var len = $("#ul-ul-ul li").length
	for(var i=0;i<len;i++){
		(function(m){         
			$("#ul-ul-ul li").eq(m).click(function(){
				$("#ul-ul-ul li").eq(m).toggleClass("active") 
		    	  if($('.active').length>1){
		    		 // $(this).removeClass("active");
		    		 // layer.msg('和尾最多只能选择1个哦');
		    		 // return;
		    	  }
		      }); 
		   })(i);
	}
})
$(function(){
	var len = $("#ul-ul li").length
	for(var i=0;i<len;i++){
		(function(m){         
			$("#ul-ul li").eq(m).click(function(){
				$("#ul-ul li").eq(m).toggleClass("active2") 
		    	  if($('.active2').length>1){
		    		 // $(this).removeClass("active2");
		    		 // layer.msg('跨度最多只能选择1个哦');
		    		 // return;
		    	  }
		      }); 
		   })(i);
	}
})
var sum = 0;
$(function(){
	var Next = $("#ul li").slice(10,15).addClass("cc");
	var Pre = $("#ul li").slice(0,10);
	for(var i=0;i<Pre.length;i++){
		(function(m){         
			Pre.eq(m).click(function(){
				Pre.eq(m).toggleClass("active3") 
				if(Pre.eq(m).toggleClass("active3")){
					Next.eq(m).toggleClass("active4");
				}else{
					Next.eq(m).ClassName("mnxhqh_"+i+" ");
				}
				Pre.eq(m).toggleClass("active3")
				if($('.active3').length>3){
					
		    	  }
		      }); 
		   })(i);
	}
})
$(".qingkong").click(function() {
	$(".active").removeClass("active");
	$(".active2").removeClass("active2");
	$(".active4").removeClass("active4");
	$(".active3").removeClass("active3");
});
$(".left").click(function(){
	
	var $tdindex2 = $(".active4");
	var tmp2 = [];
	for(var i=$tdindex2.length-1;i>=0;i--){
	    tmp2.push($tdindex2.eq(i).html());	
	}
	$(".bb").removeClass("active4");
	for(var i=0;i<tmp2.length;i++){
		var act3 = tmp2[i];
		if(act3==0){
			$(".bb").eq(9).addClass("active4");
		}else{
			$(".bb").eq(act3*1-1).addClass("active4");
		}
	}
	var $tdindex3 = $(".active3");
	var tmp3 = [];
	for(var i=$tdindex3.length-1;i>=0;i--){
	    tmp3.push($tdindex3.eq(i).html());	
	}
	$(".aa").removeClass("active3");
	for(var i=0;i<tmp3.length;i++){
		var act3 = tmp3[i];
		if(act3==0){
			$(".aa").eq(9).addClass("active3");
		}else{
			$(".aa").eq(act3*1-1).addClass("active3");
		}
	}
	var $tdindex4 = $(".active");
	var tmp = [];
	for(var i=$tdindex4.length-1;i>=0;i--){
	    tmp.push($tdindex4.eq(i).html());	
	}
	$(".one").removeClass("active");
	$(".two").removeClass("active2");
	
	for(var i=0;i<tmp.length;i++){
		var act3 = tmp[i];
		
		if(act3==0){
			$(".one").eq(9).addClass("active");
		}else{
			$(".one").eq(act3*1-1).addClass("active");
		}
		// 0 ,1 2 3 4
		if (1*act3<=5 && 1*act3>0)
		{
			$(".oneMoni>td").eq(10+1*act3).addClass("active2");;
		}
	}
})
$(".right").click(function(){
	
	var $tdindex2 = $(".active4");
	var tmp2 = [];
	for(var i=$tdindex2.length-1;i>=0;i--){
	    tmp2.push($tdindex2.eq(i).html());	
	}
	$(".bb").removeClass("active4");
	for(var i=0;i<tmp2.length;i++){
		var act3 = tmp2[i];
		if(act3==9){
			$(".bb").eq(0).addClass("active4");
		}else{
			$(".bb").eq(act3*1+1).addClass("active4");
		}
	}
	
	var $tdindex3 = $(".active3");
	var tmp3 = [];
	for(var i=$tdindex3.length-1;i>=0;i--){
	    tmp3.push($tdindex3.eq(i).html());	
	}
	$(".aa").removeClass("active3");
	for(var i=0;i<tmp3.length;i++){
		var act3 = tmp3[i];
		if(act3==9){
			$(".aa").eq(0).addClass("active3");
		}else{
			$(".aa").eq(act3*1+1).addClass("active3");
		}
	}
	if($(".active").text() != ""){
		var $tdindex4 = $(".active");
		var tmp = [];
		for(var i=$tdindex4.length-1;i>=0;i--){
		    tmp.push($tdindex4.eq(i).html());	
		}
		// 0,1
		
		$(".one").removeClass("active");
		$(".two").removeClass("active2");
		
		for(var i=0;i<tmp.length;i++){
			var act3 = tmp[i];
			if(act3==9){
				$(".one").eq(0).addClass("active");
				$(".two").eq(0).addClass("active2");
			}else{
				$(".one").eq(act3*1+1).addClass("active");
			}
			if (act3<4)
			{
				$(".oneMoni>td").eq(12+1*act3).addClass("active2");;
			}
			else if (act3==9)
			{
			}
		}
	}
	if($(".active2").text() != ""){
	}
})

