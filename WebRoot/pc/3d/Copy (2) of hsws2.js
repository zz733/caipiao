/*function myBrowser() {  //浏览器兼容
	var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
	var isOpera = userAgent.indexOf("Opera") > -1;
	if(userAgent.indexOf("Firefox") > -1) {
		return "FF";
	} //判断是否Firefox浏览器
	if(userAgent.indexOf("Chrome") > -1) {
		return "Chrome";
	}
}*/
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
		console.log($td.width())
		$td.text(tdArr[3]);
		$tr.append($td);
		var trArrIndex = 0;
		var last = -1;
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
					$td.css("background-color", "#EAC4CF"); // 球的背景颜色
				}
			}
			//$td.css("background-color", "#EAC4CF"); // 球的背景颜色
			$tr.append($td);
		}

		trArrIndex = 0;
		last = -1;
		// 0-4的尾数
		for (var j = 0; j < 5; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if (j != parseInt(tdArr[trArrIndex])) {
				$td.text("  ");
				if (last==tdArr[trArrIndex])
				{
					trArrIndex++;
				}
				$td.css("background-color", "#EAC4CF"); // 球的背景颜色
			} else {
				last = tdArr[trArrIndex]; 
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[trArrIndex]);
				
				if (trArrIndex != tdArr.length - 2)
					trArrIndex++;
				$td.css("background-color", "#AE0000"); // 球的背景颜色
			}
			$tr.append($td);
		}
		
		//跨度
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if (j != parseInt(tdArr[4]%10)) {
				$td.text("  ");
				
			} else {
				$td.toggleClass("zhexian6");
				$td.css("color", "black").css("font-weight","bold"); // 字体颜色
				
				$td.text(j);
			}
			$td.css("background-color", "#C7E7E6"); // 球的背景颜色
			$tr.append($td);
		}
		/*
		if(j<=11)
			$td.css("background-color", "#B6FBBB"); 
		else if(12 <= j && j <= 22)
			$td.css("background-color", "#EAC4CF");
		   
		else if(23 <= j && j <= 33)
		  $td.css("background-color", "#C7E7E6"); 
		  */
		
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if (j != parseInt(tdArr[5]%10)) {
				$td.text("  ");
			} else {
				$td.toggleClass("zhexian5");
				$td.css("color", "black").css("font-weight","bold");  // 字体颜色
				$td.text(j);
			}
			$td.css("background-color", "#EAC4CF"); // 球的背景颜色
			
			$tr.append($td);
		}
		
		//和尾
		
		
		$table.append($tr);
	}
	
		
	drawWhzs(); //画折线
	
}

// 得到工程路径
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
	$.ajax(getRootPath() + "/3d.do?p=get3d1", {
				type : 'post',
				timeout : 10000,
				dataType : 'json',
				success : function(data) {
                   
					var trArr = [];
					for (var i = 0; i < data.length; i++) {
						var tdArr = [];
						tdArr[0] = data[i][0]; // 期号
						//期号，1-3  跨度，和尾
						for (var j = 1; j < 4; j++) {
							     tdArr[j] = (data[i][j])%10; // (data[i][j])
						}
						tdArr.sort(function(a, b) {
									return a - b
								});
								
					    for (var j=4;j<6;j++)
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
/* 生成随机数字 */
function randomNodumpDigital(trArr) {
	var r = Math.floor(Math.random() * (10)) + 1;
	for (var i = 0; i < trArr.length; i++) {
		if (trArr[i] == r) {
			return randomNodumpDigital(trArr);
			break;
		}
	}
	if (r < 10)
		r = "0" + r;
	return r;
}

// 隐藏和显示期数
$("#yincang").click(function() {
			var yincangF = $("#yincang");
			var yincangS = $(".tdIssue");
			if (yincangF.css("display") === "none") {
				yincangF.show();
				yincangS.show();
			} else {
				yincangF.hide();
				yincangS.hide();
			}
		});
/*
 * choose方法
 * 
 * */
$(document).ready(function() {
	function choose() {
		var $ul = $(this).parent();				//li的父级
		var maxs = $ul.children().slice(0,10);//li中的0-9个
		var max=0;
		for(var i=0;i<maxs.length;i++){	//遍历这9个，1
			if(maxs[i].className=="mnxhqh_"+i+"  active"){
				max+=1;
				console.log("成功")
			}else{
				console.log(maxs[i].className)
			}
		}
		if (max >=3) {
			$(this).removeClass("active");
			layer.msg('最多只能选择3个');
			return; // 增加return，阻止代码继续执行
		}
		$(this).toggleClass("active");
		var text = $(this).text(); // 选中的文本
		var index = mnxh.indexOf(text); // 选中的文本的下标
		if (index <= 4) {
			var rightIndex = index + 10;
			$ul.children("li").eq(rightIndex).toggleClass("active");
		}
		var index2 = mnxh2.indexOf(text);
		if (index >= 10) {
			var leftIndex = index - 10;
			$ul.children("li").eq(rightIndex).toggleClass("cang");
		}
		if (chooseIndexs.indexOf(index) > -1) {
			chooseIndexs.splice(chooseIndexs.indexOf(index), 1);
		} else {
			chooseIndexs.push(index);
		}
		var a = $('#ul-ul-ul li');
		for(var i=0;i<a.length;i++){
			a[i].className=className="mnxhqh_"+i;
		}
		var cstr = $ul.children(".active").text();
		if ($(this).hasClass("active")) {
			$(".myselt").val(cstr);
		} else {
			$(".myselt").val(cstr);;
		}
	}

	/** **********模拟选号********* */
//	1
	mnxh = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
	mnxh2 = ["0", "1", "2", "3", "4"];
	chooseIndexs = []; // 选中的下标
	function render() {
		var str = "";
		var str2 = "";
		var str3 ="";
		console.log(chooseIndexs);
		for (var i = 0; i < mnxh.length; i++) {
			var idValue = "mnxhqh_" + mnxh[i];
			var active = chooseIndexs.indexOf(i) > -1;
			str = str + "<li class='" + idValue + " "
					+ (active ? "active" : "") + "' " + ">" + mnxh[i] + "</li>";
		}
	for (var i = 0; i < mnxh2.length; i++) {
			var idValue = "mnxhqh_" + mnxh2[i];
			var active = chooseIndexs.indexOf(i) > -1;
			str = str + "<li class='" + idValue + " "
					+ (active ? "active" : "") + "'" + ">" + mnxh2[i] + "</li>";
		}
	for (var i = 0; i < mnxh.length; i++) {
		var idValue = "mnxhqh_" + mnxh[i];
		var active = chooseIndexs.indexOf(i) > -1;
		str2 = str2 + "<li class='" + idValue + " "
				+ (active ? "active" : "") + "' " + ">" + mnxh[i] + "</li>";
	}
       
		$(".wrap #ul").html(str);
		$(".wrap #ul-ul").html(str2);
		$(".wrap #ul-ul-ul").html(str2);
		$(".wrap #ul2").html(str);
		$(".wrap1 #ul-ul2").html(str2);
		$(".wrap1 #ul-ul-ul2").html(str2);
		$(".wrap #ul3").html(str);
		$(".wrap1 #ul-ul3").html(str2);
		$(".wrap1 #ul-ul-ul3").html(str2);
		var o = $("#hswsTu").offset();
		var _top = o.top;
		var _left= o.left;
		
//		$("#mmmm")[0].style.position = "absolute";
//		$("#mmmm")[0].style.left = _left;
	}
//	2
	
	function move(direction) {
		var isLeft = direction < 0; // 向左移动
		return function() {
			for (var i = 0; i < chooseIndexs.length; i++) {
				var value = chooseIndexs[i]
				if (isLeft) {
					if (value === 0) {
						chooseIndexs.splice(i, 1, mnxh.length - 1)
					} else {
						chooseIndexs.splice(i, 1, value - 1)
					}

				} else {
					if (value === mnxh.length - 1) {
						chooseIndexs.splice(i, 1, 0)
					} else {
						chooseIndexs.splice(i, 1, value + 1)
					}
				}
			}
			console.log(mnxh)
			render();
//			$(function(){
//				if("FF" == mb) {
//					$("#center").css("width","97%");
//					$("#mmmm").css("width","100%");
//					$(".wrap ul li").css("width","25px");
//					$(".wrap1 ul li").css("width","25px");
//					$("#mmmm").css("margin-left","3px");
//				}
//			})
			var a = $('#ul-ul-ul li');
			for(var i=0;i<a.length;i++){
				a[i].className=className="mnxhqh_"+i;
			}
			var a = $('#ul-ul-ul2 li');
			for(var i=0;i<a.length;i++){
				a[i].className=className="mnxhqh_"+i;
			}
			var a = $('#ul-ul-ul3 li');
			for(var i=0;i<a.length;i++){
				a[i].className=className="mnxhqh_"+i;
			}
		}
	}

	// 模拟选号下的行
	var table_td = "";
	for (var b = 0; b < 15; b++) {
		table_td = table_td + "<li style = 'margin-left:1px'></li>";
	}8
	$(".ul1").html(table_td);

	$(".wrap").on("click", "li", choose);
	$('.right').on('click', move(1));
	$('.left').on('click', move(-1));
	render();

	$(".qingkong").click(function() {
				chooseIndexs.length = 0;
				console.log(chooseIndexs);
				$(".active").removeClass("active");

			});
});

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
	var tableHeight = $("#hswsTu")[0].offsetHeight-54;
	
	
	$("svg").css("height", tableHeight);
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

//以下是调用上面的函数

/*var mb = myBrowser();

$(function(){
	if("FF" == mb) {
	$("#center").css("width","96%");
	$("#mmmm").css("width","100%");
	$(".wrap ul li").css("width","25px");
	$(".wrap1 ul li").css("width","25px");
	$("#mmmm").css("margin-left","3px");
}
if("Chrome" == mb) {
	var center = document.getElementById("center");
	center.style.width ='93%';
	$("#mmmm").css("width","101%");
	$('.moni_xh').css("width","119px");
}
})


*/






