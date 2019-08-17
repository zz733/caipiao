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
		$td.text(tdArr[3]);
		$tr.append($td);
		var trArrIndex = 0;
		var last = -1;
		for (var j = 0; j <= 2; j++) { // 列数
			var $td = $("<td></td>").toggleClass("num");
			$td.css("color", "white"); // 字体颜色
			$td.text(tdArr[j]);
			$td.css("background-color", "#0000FF"); // 红球
			$tr.append($td);
			console.log("输出的这个："+tdArr[3])
			if (j == 2) {
				if (tdArr[0] == tdArr[2] || tdArr[1] == tdArr[0]
						|| tdArr[2] == tdArr[1]) {
					$td.css("background-color", "#D45837"); // 红球
					$td.prev().css("background-color", "#D45837"); // 红球
					$td.prev().prev().css("background-color", "#D45837"); // 红球
				} else {
					$td.css("background-color", "#5695D4");// "#0063B1"); //蓝球
					$td.prev().css("background-color", "#5695D4"); // 蓝球
					$td.prev().prev().css("background-color", "#5695D4"); // 蓝球
				}
			}
		}

		// 0-9的尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdFirst");
			for (var k=0;k<3;k++)
			{
				if (j == parseInt(tdArr[k])) {
					$td.css("color", "white"); // 字体颜色
					$td.text(tdArr[k]);
					$td.css("background-color", "#AE0000"); // 球的背景颜色
					break;
				} else {
					$td.text("  ");
					$td.css("background-color", "#CCCCCC"); // 球的背景颜色
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
					$td.css("background-color", "#AE0000"); // 球的背景颜色
					break;
				} else {
					$td.text("  ");
					$td.css("background-color", "#CCCCCC"); // 球的背景颜色
				}
			}
			//$td.css("background-color", "#EAC4CF"); // 球的背景颜色
			$tr.append($td);
			
		}
		
		//跨度
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if (j != parseInt(tdArr[4]%10)){
				$td.text("  ");
				$td.css("background-color", "#C7E7E6");
			} else {
				$td.toggleClass("zhexian5");
				$td.css("color","white").css("font-weight","bold");  // 字体颜色
				$td.text(j);
				$td.css("background-color","#107C10");
			}
			 // 球的背景颜色
			$tr.append($td);
		}
		//和尾
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if (j != parseInt(tdArr[5]%10)) {
				$td.text("  ");
				$td.css("background-color", "#CCFFCC");
			} else {
				$td.toggleClass("zhexian6");
				$td.css("color", "white").css("font-weight","bold").css("background-color", "#0063B1"); // 字体颜色
				$td.text(j);
			}
			//$td.css("background-color", "#EAC4CF"); // 球的背景颜色
			$tr.append($td);
		}
		
		
		//// 期数，球1，球2，球3，跨度，和尾,除3余0个数,除3余1个数,除3余2个数
		       // 单
				var $td = $("<td></td>").toggleClass("tdSecond");
				if (tdArr[5] % 2 != 0)
					$td.text(tdArr[5]);
				else
					$td.text("");
				$tr.append($td);
				$td.css("background-color", "#EAC4CF"); // 球的背景颜色
				// 双
				var $td = $("<td></td>").toggleClass("tdSecond");
				if (tdArr[5] % 2 != 1)
					$td.text(tdArr[5]);
				else
					$td.text("");
				$td.css("background-color", "#C7E7E6"); // 球的背景颜色s
				// $td.css("background-color", "#C7E7E6"); // 球的背景颜色
				$tr.append($td);

				// 和值除3余
				for ( var j = 0; j < 3; j++) {
					var $td = $("<td></td>").toggleClass("tdSecond");
					var n = tdArr[5] % 3;
					if (n != j) {
						$td.text("  ");

					} else {
						$td.css("color", "black").css("font-weight", "bold"); // 字体颜色
						$td.text(n);
					}
					// $td.css("background-color", "#C7E7E6"); // 球的背景颜色
					$tr.append($td);
				}
				// 除3余0
				for ( var j = 0; j < 3; j++) {
					var $td = $("<td></td>").toggleClass("tdSecond");
					$td.text(tdArr[j + 6]);
					$td.css("background-color", "#C7E7E6"); // 球的背景颜色s
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
		for (var j = 0; j <= 2; j++) { // 列数
			var $td = $("<td></td>").toggleClass("num");
//			var $td = $("<td></td>").toggleClass("num");
			$td.css("color", "white"); // 字体颜色
//			$td.text(tdArr[j]);
			$td.css("background-color", "rgb(234, 238, 238) !important"); // 红球
			$tr.append($td);
		}
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdFirst");
			$td.text(j)
			$td.css("background-color", "#CCCCCC").css("color","#CCCCCC"); // 球的背景颜色
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
				$td.css("background-color", "#CCCCCC").css("color","#CCCCCC"); // 球的背景颜色
			$tr.append($td);
			if (i == 0) {
				$td.toggleClass("two");
			}
		}
		/*跨度*/
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			$td.text(j)
			$td.css("background-color", "#C7E7E6").css("color","#C7E7E6"); // 球的背景颜色
			$tr.append($td);
			if (i == 0) {
				$td.toggleClass("aa");
				(function(m){
				     $(".aa").eq(m).click(function(){
				    	  $(".aa").eq(m).toggleClass("active3") 
				    	  if($('.active3').length>1){
				    		  //$(this).removeClass("active3");
				    		  //layer.msg('跨度最多只能选择1个哦');
				    		  //return;
				    	  }
				      }); 
				   })(j);
			}
		}
		//和尾
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			$td.text(j);
			$td.css("background-color", "#CCFFCC").css("color","#CCFFCC"); // 球的背景颜色
			$tr.append($td);
			if (i == 0) {
				$td.toggleClass("bb");
				(function(m){
				     $(".bb").eq(m).click(function(){
				    	  $(".bb").eq(m).toggleClass("active4") 
				    	  if($('.active4').length>1){
				    		 // $(this).removeClass("active4");
				    		 /// layer.msg('和尾最多只能选择1个哦');
				    		  //return;
				    	  }
				      }); 
				   })(j);
			}
		}
		
		//期数，球1，球2，球3，跨度，和尾,除3余0个数,除3余1个数,除3余2个数
		  // 单
		var $td = $("<td></td>").toggleClass("tdSecond");
		if (tdArr[5] % 2 != 0)
			$td.text("");
		else
			$td.text("");
		$tr.append($td);
		$td.css("background-color", "#EAC4CF"); // 球的背景颜色
		// 双
		var $td = $("<td></td>").toggleClass("tdSecond");
		if (tdArr[5] % 2 != 1)
			$td.text("");
		else
			$td.text("");
		$td.css("background-color", "#C7E7E6"); // 球的背景颜色s
		// $td.css("background-color", "#C7E7E6"); // 球的背景颜色
		$tr.append($td);

		// 和值除3余
		for ( var j = 0; j < 3; j++) {
			var $td = $("<td></td>").toggleClass("tdSecond");
			var n = tdArr[5] % 3;
			if (n != j) {
				$td.text("  ");

			} else {
				$td.css("color", "black").css("font-weight", "bold"); // 字体颜色
				$td.text("");
			}
			// $td.css("background-color", "#C7E7E6"); // 球的背景颜色
			$tr.append($td);
		}
		// 除3余0
		for ( var j = 0; j < 3; j++) {
			var $td = $("<td></td>").toggleClass("tdSecond");
			$td.text("");
			$td.css("background-color", "#C7E7E6"); // 球的背景颜色s
			$tr.append($td);
		}
		
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
	$.ajax(getRootPath() + "/5d.do?p=get3d3", {
				type : 'post',
				timeout : 10000,
				dataType : 'json',
				success : function(data) {
					//alert(data)
					console.log(35454657+data);
					var trArr = [];
					for (var i = 0; i < data.length; i++) {
						var tdArr = [];
						tdArr[0] = data[i][0]; // 期号
						//期号，1-3  跨度，和尾
						//期数，球1，球2，球3，跨度，和尾,除3余0个数,除3余1个数,除3余2个数
						for (var j = 1; j < 4; j++) {
							     tdArr[j] = (data[i][j])%10; // (data[i][j])
						}
						tdArr.sort(function(a, b) {
									return a - b
								});
								
					    for (var j=4;j<9;j++)
					    {
					    	tdArr[j] =  data[i][j];
					    }
						//if (tdArr[0]=='18059')
						
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
	console.info(chooseIndexs);
	// 移除上一个组合的样式
	var id = ".mnxhqh_";
	for (var i = 0; i < 10; i++) {
		$(id + i).removeClass("active");
	}
	console.info(chooseIndexs);
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
		console.info(chooseIndexs);
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

	$(".zhexian5").each(function(index, ele) {
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
			var line = new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null);
			//line.setColor("#FF7900");
			table_canvas.addFigure(line);
		}
		lastPoints[index] = X + "-" + Y;
	})

	$(".zhexian6").each(function(index, ele) {
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
var arry = go2(1);
var arry2 = go3(2);
var index = 0;
$(function(){
	for(var i=0;i<2;i++){
		$(".btnul").append("<li class=numli"+i+">"+[i]+"</li>");	//在ul标签上动态添加li标签
		$(".numli").css("border-radius",'2px');	
		$(".numli"+i).attr("class",'btnnum btn');
	}
	for(var i=1;i<10;i++){
		$(".btnul2").append("<li class=btnnum2"+i+">"+[i]+"</li>");
		$(".btnnum2").css("border-radius",'2px');	
		$(".btnnum2"+i).attr("class",'three btn btn-primary');
	}
	}) 

$('#group').change(function(){
	if($('#group option:selected').text()=="组三"){
		arry = go2(1);
		index = 0;
		$(".btnul li:eq(0)").text(arry[index][0]);
		$(".btnul li:eq(1)").text(arry[index][1]);
		showVIP(arry[index],2);
		$(".right2").unbind("click");
		$(".left2").unbind("click");
		$(".btnul2 li:eq(0)").show();
		$(".btnul li:eq(2)").remove();
		$(function(){
			var three=document.querySelectorAll(".three");
			for(var i=0;i<three.length;i++){
			(function(m){   
				   $(".three").eq(m).unbind("click");
				   $(".right2").unbind("click");
					$(".left2").unbind("click");
			       $(".three").eq(m).click(function(){
			    	   index = 0;
			    	   arry = go2(m+1);
			    			$(".btnul li:eq(0)").text(arry[index][0]);
			    			$(".btnul li:eq(1)").text(arry[index][1]);
			    			showVIP(arry[index],2);
			    	   if($(".btnul li:eq(0)").text()==0){
			    		   $(".left2").addClass("disabled");
			    	   }else{
			    		   $(".left2").removeClass("disabled");
			    		}
			    	   if(index>=arry.length-1){
		   				   $(".right2").addClass("disabled");
		   			   }else{
		   				$(".right2").removeClass("disabled");
		   			   }
			      }); 
			   })(i);
			}
		})
		$(".right2").click(function(){
			index++;
			 $(".btnul li:eq(0)").removeClass("active")
	    	   $(".btnul li:eq(0)").text(arry[index][0]);
			   $(".btnul li:eq(1)").text(arry[index][1]);
			   showVIP(arry[index],2);
			   $(".left2").removeClass("disabled");
			   if(index>=arry.length-1){
				   $(".right2").addClass("disabled");
			   }else{
				   $(".right2").removeClass("disabled");
			   }
	      }); 
	     $(".left2").click(function(){
	    	   index--;
	    	   $(".btnul li:eq(0)").text(arry2[index][0]);
			   $(".btnul li:eq(1)").text(arry2[index][1]);
			   $(".btnul li:eq(2)").text(arry2[index][2]);
			   showVIP(arry2[index],3);
			   $(".right2").removeClass("disabled");
			  if(index==0){
				  $(".left2").addClass("disabled");
			  }else{
				  $(".left2").removeClass("disabled");
			  }
	      });
	}
	if($('#group option:selected').text()=="组六"){
		arry2 = go3(2);
		$(".left2").addClass("disabled");
		$(".right2").removeClass("disabled");
		index = 0;
		$(".btnul").append("<li class=numli2>"+3+"</li>");
		$(".numli2").css("border-radius",'2px');	
		$(".numli2").attr("class",'btnnum btn');
		$(".btnul2 li:eq(0)").hide();
		$(".btnul li:eq(0)").text(arry2[index][0]);
		$(".btnul li:eq(1)").text(arry2[index][1]);
		$(".btnul li:eq(2)").text(arry2[index][2]);
		showVIP(arry2[index],3);
		$(".btnul li:eq(2)").removeClass("disabled");
		 $(".right2").unbind("click");
		$(".right2").click(function(){
			index++;
			console.log("下标是right2："+index)
    	    console.log("数组是right2："+arry2)
	    	   $(".btnul li:eq(0)").text(arry2[index][0]);
			   $(".btnul li:eq(1)").text(arry2[index][1]);
			   $(".btnul li:eq(2)").text(arry2[index][2]);
			   showVIP(arry2[index],3);
			   $(".left2").removeClass("disabled");
			   if(index>=arry2.length-1){
				   $(".right2").addClass("disabled");
			   }else{
				   $(".right2").removeClass("disabled");
			   }
	      }); 
		 $(".left2").unbind('click');
	     $(".left2").click(function(){
	    	
	    	   index--;
	    	   console.log("下标是left2："+index)
	    	    console.log("数组是left2："+arry2)
	    	   $(".btnul li:eq(0)").text(arry2[index][0]);
			   $(".btnul li:eq(1)").text(arry2[index][1]);
			   $(".btnul li:eq(2)").text(arry2[index][2]);
			   showVIP(arry2[index],3);
			   $(".right2").removeClass("disabled");
			  if(index<=0){
				  $(".left2").addClass("disabled");
			  }else{
				  $(".left2").removeClass("disabled");
			  }
	      });
		
		 $(function(){
				var three=document.querySelectorAll(".three");
				for(var i=0;i<three.length;i++){
				(function(m){         
					 $(".three").eq(m).unbind("click");
				       $(".three").eq(m).click(function(){
				    	   index = 0
				    	   arry2 = go3(m+1);
				    			$(".btnul li:eq(0)").text(arry2[index][0]);
				    			$(".btnul li:eq(1)").text(arry2[index][1]);
				    			$(".btnul li:eq(2)").text(arry2[index][2]);
				    			showVIP(arry2[index],3);
				    	   if($(".btnul li:eq(0)").text()==0){
				    		   $(".left2").addClass("disabled");
				    	   }else{
				    		   $(".left2").removeClass("disabled");
				    	   }
				    	   if(index>arry2.length-1){
				    		   $(".right2").addClass("disabled");
				    	   }else{
				    		   $(".right2").removeClass("disabled");
				    	   }
				      }); 
				   })(i);
				}
			})
	}else{
		$(".btnul2 li:eq(0)").show();
	}
})

/*选择组三*/
 /**2位数 [ [0,1],[1,]*/
function go2(m)
      {
             var arry = [];
			for (var min=0; min<=9-m;min++)
			{
				var arr2 = [];
				arr2.push(min);
				arr2.push(min+m);
				arry.push(arr2);
			 }
         return arry;
     }
/*选择组六*/
// [ [0,1,3] , [0,2,3]
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

$(function(){
	if( $(".btnul li:eq(0)").text()==0){
			$(".left2").addClass("disabled");
		   }else{
			$(".left2").removeClass("disabled");
		   }
	if($('#group option:selected').text()=="组三"){
		$(".btnul li:eq(0)").text(arry[0][0]);
		$(".btnul li:eq(1)").text(arry[0][1]);
		
		//lgh:数据没有查出来前不显示
		 window.setTimeout(function(){showVIP(arry[0],2);},500);
	    
		 $(".right2").click(function(){
	    	   $(".oneMoni .tdFirst:eq(0)").removeClass("active");
	    	   index++;
	    	   $(".btnul li:eq(0)").text(arry[index][0]);
   			   $(".btnul li:eq(1)").text(arry[index][1]);
   			   showVIP(arry[index],2);
   			   if(index>=arry.length-1){
   				   $(".right2").addClass("disabled");
   			   }else{
   				$(".right2").removeClass("disabled");
   			   }
   			   if($(".btnul li:eq(0)").text()==0){
   				 $(".left2").addClass("disabled");
   			   }else{
   				 $(".left2").removeClass("disabled");
   			   }
   			   
	      }); 
	       $(".left2").click(function(){
	    	   index--;
	    	   console.log("他的下标："+index)
	    	   $(".btnul li:eq(0)").text(arry[index][0]);
   			   $(".btnul li:eq(1)").text(arry[index][1]);
   			   showVIP(arry[index],2);
   			   $(".right").removeClass("disabled");
   			   if($(".btnul li:eq(0)").text()==0){
   				   $(".left2").addClass("disabled");
   			   }else{
   				 $(".left2").removeClass("disabled");
   			   }
	      }); 
	}

})

//VIP号 显示在模拟区
function showVIP(param,n)
{
	
	
	
	var array=[0,1,2,3,4];
	console.log(param);//按钮格子当中的值
	$(".oneMoni td").removeClass("active");//原来选中的红色格子
	/*
	for(var i=0;i<6;i++){//param[i]该值为0-9,即说明可以从0移动到9位
		$(".oneMoni .tdFirst:eq("+param[i]+")").addClass("active");
		for(var j=0;j<array.length;j++){
			if(array[j]==param[i]){
				$(".oneMoni .two:eq("+param[i]+")").addClass("active");
			}
		}
	}*/
	for (var i=0;i<param.length;i++)
	{
		$(".oneMoni .one").eq(param[i]).addClass("active");
		if (param[i]<=4)
		{
			$(".oneMoni .two").eq(param[i]).addClass("active");
		}
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
			    	   arry = go2(m+1);
			    			$(".btnul li:eq(0)").text(arry[index][0]);
			    			$(".btnul li:eq(1)").text(arry[index][1]);
			    			showVIP(arry[index],2);
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
			    	   if($(".btnul li:eq(1)").text()>=9){
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
			if($(".btnul li:eq(1)").text()>=9){
				$(".right2").addClass("disabled");
			}else{
				$(".right2").removeClass("disabled");
			}
		})
		
	}
	if($('#group option:selected').text()=="组六"){
		index = 0;
		$(".btnul li:eq(1)").text(arry2[index][0]);
		$(".btnul li:eq(1)").text(arry2[index][1]);
		$(".btnul li:eq(2)").text(arry2[index][2]);
		showVIP(arry2[index],3)
		 $(function(){
				var three=document.querySelectorAll(".three");
				for(var i=0;i<three.length;i++){
				(function(m){         
					 $(".three").eq(m).unbind("click");
				       $(".three").eq(m).click(function(){
				    	   index = 0;
				    	   arry2 = go3(m+1);
				    			$(".btnul li:eq(0)").text(arry2[index][0]);
				    			$(".btnul li:eq(1)").text(arry2[index][1]);
				    			$(".btnul li:eq(2)").text(arry2[index][2]);
				    			showVIP(arry2[index],3)
				      }); 
				   })(i);
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
		    		  //$(this).removeClass("active3");
		    		 // Next.eq(m).removeClass("active4");
		    		  //layer.msg('0-9尾数最多只能选择3个哦');
		    		 // return;
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

$(".right").click(function(){
	var $tdindex2 = $(".active4");
	var tmp2 = [];
	for(var i=$tdindex2.length-1;i>=0;i--){
	    tmp2.push($tdindex2.eq(i).html());	
	}
	$(".bb").removeClass("active4");
	for(var i=0;i<tmp2.length;i++){
		var act3 = tmp2[i];
		console.log("act3前端"+ act3)
		if(act3==9){
			$(".bb").eq(0).addClass("active4");
		}else{
			$(".bb").eq(act3*1+1).addClass("active4");
		}
	}
	var $tdindex4 = $(".active3");
	var tmp4 = [];
	for(var i=$tdindex4.length-1;i>=0;i--){
	    tmp4.push($tdindex4.eq(i).html());	
	}
	$(".aa").removeClass("active3");
	for(var i=0;i<tmp4.length;i++){
		var act4 = tmp4[i];
		if(act4==9){
			$(".aa").eq(0).addClass("active3");
		}else{
			$(".aa").eq(act4*1+1).addClass("active3");
			console.log("sdsds:"+act4*1-1)
		}
	}
	if($(".active").text() != ""){
		var $tdindex4 = $(".one.active");
		$(".one").removeClass("active");
		$(".two").removeClass("active2");
		$(".two").removeClass("active");
		for(var i=$tdindex4.length-1;i>=0;i--){
			var o=$tdindex4.eq(i).html()*1;
			var one=o<9?o+1:0;
			var two=o<4?o+1:0;
			if(o+1==10){
				$(".two").eq(0).addClass("active2");
			}
			$(".one").eq(one).addClass("active");
			if(o<4 && one==two){
				$(".two").eq(two).addClass("active2");
			}
		}
	}
});
$(".left").click(function() {
	var $tdindex4 = $(".one.active");
	$(".one").removeClass("active");
	$(".two").removeClass("active2");
	$(".two").removeClass("active");
	for(var i=$tdindex4.length-1;i>=0;i--){
		var o=$tdindex4.eq(i).html()*1;
		var one=o>0?o-1:9;
		$(".one").eq(one).addClass("active");
		if(o<=5){
			$(".two").eq(one).addClass("active");
		}
	}

	var $tdindex2 = $(".active2");
	var tmp2 = [];
	for(var i=$tdindex2.length-1;i>=0;i--){
	    tmp2.push($tdindex2.eq(i).html());	
	}
	$(".two").removeClass("active2");
	for(var i=0;i<tmp2.length;i++){
		var act2 = tmp2[i];
		if(act2==0){
			$(".two").eq(9).addClass("active2");
		}else{
			$(".two").eq(act2*1-1).addClass("active2");
		}
	}
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
	var $tdindex4 = $(".active3");
	var tmp4 = [];
	for(var i=$tdindex4.length-1;i>=0;i--){
	    tmp4.push($tdindex4.eq(i).html());	
	}
	$(".aa").removeClass("active3");
	for(var i=0;i<tmp4.length;i++){
		var act4 = tmp4[i];
		if(act4==0){
			$(".aa").eq(9).addClass("active3");
		}else{
			$(".aa").eq(act4*1-1).addClass("active3");
			console.log("sdsds:"+act4*1-1)
		}
	
	}
})











