/** **********前三走势图********* */
getTableData();

var table_canvas;
isInitOk = false;
y_head = -1;
var backcolor = ["#FE0000", "#333300", "#FF6600", "#81007F", "#008001",
		"#010080"];
// 尾号走势画线
$("#zhexian").click(function() {
			if (!isInitOk) { // 没有初始化
				drawWhzs();
			} else {// 已初始化
				$("svg").remove(); // 直接移除控件
				isInitOk = false;
			}

		});


function paddingData(tableData) {
	console.log(tableData)
	var $table = $("#gwsTu");
	for (var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); // 底色
		var trArr = tableData[i];
		// 数据
		var tdArr = trArr[i];
		console.log(tdArr)
		// 期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[0]);
		$tr.append($td);
		for (var j = 1; j <= 5; j++) { // 列数
			var $td = $("<td></td>").toggleClass("num");
			$td.css("color", "white"); // 字体颜色
			$td.text(tdArr[j]);
			console.log("输出的是："+tdArr[j])
			$td.css("background-color", "#0000FF"); // 红球
			$tr.append($td);
				if (tdArr[0] == tdArr[1]
				|| tdArr[0] == tdArr[2]
				|| tdArr[0] == tdArr[3]
				|| tdArr[0] == tdArr[4]
				|| tdArr[1] == tdArr[2]
				|| tdArr[1] == tdArr[3]
				|| tdArr[1] == tdArr[4]
				|| tdArr[2] == tdArr[3]
				|| tdArr[2] == tdArr[4]
				|| tdArr[3] == tdArr[4]
				) {
					$td.css("background-color", "#D45837"); // 红球
					$td.prev().css("background-color", "#D45837"); // 红球
					$td.prev().prev().css("background-color", "#D45837"); // 红球
				} else {
					$td.css("background-color", "#5695D4");// "#0063B1"); //蓝球
					$td.prev().css("background-color", "#5695D4"); // 蓝球
					$td.prev().prev().css("background-color", "#5695D4"); // 蓝球
				}}
			$tr.append($td);
		// 1号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[1])) {
				$td.text("  ");
				$td.css("background-color", "#F7F0F0");
			} else {
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[1]);
				$td.css("background-color", "#FE0000"); // 球的背景颜色
				$td.toggleClass("zhexian1");
			}
			$tr.append($td);
		}
		// 2号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[2])) {
				$td.text("  ");
			} else {
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[2]);
				$td.css("background-color", "#333300"); // 球的背景颜色
				$td.toggleClass("zhexian2");
			}
			$tr.append($td);
		}
		// 3号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[3])) {
				$td.text("  ");
				$td.css("background-color", "#F7F0F0");
			} else {
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[3]);
				$td.css("background-color", "#FF6600"); // 球的背景颜色
				$td.toggleClass("zhexian3");
			}
			$tr.append($td);
		}
		// 4号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[4])) {
				$td.text("  ");
			} else {
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[4]);
				$td.css("background-color", "#81007F"); // 球的背景颜色
				$td.toggleClass("zhexian4");
			}
			$tr.append($td);
		}
		// 5号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[5])) {
				$td.text("  ");
				$td.css("background-color", "#F7F0F0");
			} else {
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[5]);
				$td.css("background-color", "#008001"); // 球的背景颜色
				$td.toggleClass("zhexian5");
			}
			$tr.append($td);
			
		}
		$table.append($tr);
		
	}
	for (var i = 0; i < 1; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); // 底色
		var trArr = tableData[i];
		var tdArr = trArr[i];
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[0]);
		$tr.append($td);
		for (var j = 1; j <= 5; j++) { // 列数
			var $td = $("<td></td>").toggleClass("num");
			$td.css("color", "rgb(247, 240, 240)"); 
			$td.css("background-color", "#CFDFF3"); // 红球
			$tr.append($td);
		}
			$tr.append($td);
		// 1号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").addClass("one1");
				$td.css("color", "rgb(247, 240, 240)"); // 字体颜色
				$td.text(j);
				$td.css("background-color", "rgb(247, 240, 240)");
			$tr.append($td);
		}
		// 2号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").addClass("one2");
				$td.text(j);
				$td.css("color", "rgb(234, 238, 238)");
				$td.css("background-color", "rgb(234, 238, 238)"); // 球的背景颜色
				$tr.append($td);
		}
		// 3号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").addClass("one3");
				$td.text(j);
				$td.css("color", "#F7F0F0"); 
				$td.css("background-color", "#F7F0F0");
				$tr.append($td);
		}
		// 4号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").addClass("one4");
				$td.text(j);
				$td.css("color", "rgb(234, 238, 238)"); 
				$td.css("background-color", "rgb(234, 238, 238)");
			$tr.append($td);
		}
		// 5号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").addClass("one5");
				$td.text(j);
				$td.css("background-color", "#F7F0F0");
				$td.css("color", "#F7F0F0");
			$tr.append($td);
		}
		$table.append($tr);
		
	}
	for (var i = 0; i < 2; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); // 底色
		var trArr = tableData[i];
		var tdArr = trArr[i];
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[0]);
		$tr.append($td);
		for (var j = 1; j <= 5; j++) { // 列数
			var $td = $("<td></td>").toggleClass("num");
			$td.css("color", "rgb(247, 240, 240)"); 
			$td.css("background-color", "#CFDFF3"); // 红球
			$tr.append($td);
		}
			$tr.append($td);
		// 1号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
				$td.css("color", "rgb(247, 240, 240)"); // 字体颜色
				$td.css("background-color", "rgb(247, 240, 240)");
			$tr.append($td);
		}
		// 2号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
				$td.css("color", "rgb(234, 238, 238)");
				$td.css("background-color", "rgb(234, 238, 238)"); // 球的背景颜色
				$tr.append($td);
		}
		// 3号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
				$td.css("color", "#F7F0F0"); 
				$td.css("background-color", "#F7F0F0");
				$tr.append($td);
		}
		// 4号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
				$td.css("color", "rgb(234, 238, 238)"); 
				$td.css("background-color", "rgb(234, 238, 238)");
			$tr.append($td);
		}
		// 5号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
				$td.css("background-color", "#F7F0F0");
				$td.css("color", "#F7F0F0");
			$tr.append($td);
		}
		$table.append($tr);
		
	}
	drawWhzs();
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
// ["2017100",1,23,15,8,19,5],["2017101",2,32,11,14,25,7]
function getTableData() {
	var isTest = false;
	var tableData = []; // 解析后的数据的二维数组,一维放一行的数据（[]）,二维放列的值
	{
		$.ajax(getRootPath() + "/5d.do?p=get3d1", {
					type : 'post',
					timeout : 10000,
					dataType : 'json',
					success : function(data) {
						var trArr = [];
						for (var i = 0; i < data.length; i++) {
							var tdArr = [];
							tdArr[0] = data[i][0]; // 期号
							for (var j = 1; j < 7; j++) {
								tdArr[j] = (data[i][j]);
								if (tdArr[j] / 10 >= 1) {
									tdArr[j] = (data[i][j] + "").substring(1);
								}
							}
							// tdArr.sort(function(a, b) {
							// return a - b
							// });
							trArr.push(tdArr);
							tableData.push(trArr);
						}
						paddingData(tableData);

					},
					error : function(xhr, type, errorThrown) {
						// 异常处理；
						alert("您好，请检查一下您的网络是否异常！");
					}

				});
		return tableData;
	}
}

function drawWhzs() {
	table_canvas = new draw2d.Canvas("gwsTu");
	isInitOk = true;
	// 得到圆的圆点X+圆点Y+圆半径 并画图
	table_canvas = new draw2d.Canvas("gwsTu");// if(!table_canvas)
	$("svg").css("top", "75px");
	$("svg").css("left", "0px");// 由于自带样式中绝对定位有偏移
	$("svg").css("width", "100%");
	var tableHeight = $("tbody").height()-63;
	$("svg").css("height", tableHeight);
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
			table_canvas.addFigure(new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null));
		}
		lastPoints[index] = X + "-" + Y;
	})

	$(".zhexian2").each(function(index, ele) {
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
			table_canvas.addFigure(new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null));
		}
		lastPoints[index] = X + "-" + Y;
	})

	$(".zhexian3").each(function(index, ele) {
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
			table_canvas.addFigure(new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null));
		}
		lastPoints[index] = X + "-" + Y;
	})

	$(".zhexian4").each(function(index, ele) {
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
			table_canvas.addFigure(new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null));
		}
		lastPoints[index] = X + "-" + Y;
	})

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
			table_canvas.addFigure(new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null));
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
			}
		});

function show(a) {
	var song = document.querySelectorAll(".song");
	for (var i = 0; i < song.length; i++) {
		if (i == a) {
			song[i].style.display = "block";
		} else {
			song[i].style.display = "none";
		}
	}
}

var ctcount = 3;

function changct(cti) {
	for (i = 1; i <= ctcount; i++) {
		ct = document.getElementById("ctab" + i);
		cc = document.getElementById("ccontent" + i);
		if (i == cti) {
			ct.className = "active";
			cc.className = "activecontent";
		} else {
			ct.className = "";
			cc.className = "hiddencontent";
		}
	}
}

var ctcount = 3;
function changct(cti) {
	for (i = 1; i <= ctcount; i++) {
		ct = document.getElementById("ctab" + i);
		cc = document.getElementById("ccontent" + i);
		if (i == cti) {
			ct.className = "active";
			cc.className = "activecontent";
		} else {
			ct.className = "";
			cc.className = "hiddencontent";
		}
	}
}
/** **********vip选号********* */

window.setTimeout(function(){
	$("#ul>li").removeClass("active");
},200);
$(document).on("click",".one1",function(){
	$(this).toggleClass("active1");
})
$(document).on("click",".one2",function(){
	$(this).toggleClass("active2");
})
$(document).on("click",".one3",function(){
	$(this).toggleClass("active3");
})
$(document).on("click",".one4",function(){
	$(this).toggleClass("active4");
})
$(document).on("click",".one5",function(){
	$(this).toggleClass("active5");
})
$(".qingkong").click(function() {
		$(".active1").removeClass("active1");
		$(".active2").removeClass("active2");
		$(".active3").removeClass("active3");
		$(".active4").removeClass("active4");
		$(".active5").removeClass("active5");
	});
$(".left").click(function() {
	var $tdindex1 = $(".active1");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one1").removeClass("active1");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==0){
			$(".one1").eq(9).addClass("active1");
		}
		else{  
			$(".one1").eq(act1*1-1).toggleClass("active1");
		}
	}
	var $tdindex1 = $(".active2");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one2").removeClass("active2");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==0){
			$(".one2").eq(9).addClass("active2");
		}
		else{  
			$(".one2").eq(act1*1-1).toggleClass("active2");
		}
	}
	var $tdindex1 = $(".active2");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one3").removeClass("active3");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==0){
			$(".one3").eq(9).addClass("active3");
		}
		else{  
			$(".one3").eq(act1*1-1).toggleClass("active3");
		}
	}
	var $tdindex1 = $(".active4");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one4").removeClass("active4");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==0){
			$(".one4").eq(9).addClass("active4");
		}
		else{  
			$(".one4").eq(act1*1-1).toggleClass("active4");
		}
	}
	var $tdindex1 = $(".active5");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one5").removeClass("active5");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==0){
			$(".one5").eq(9).addClass("active5");
		}
		else{  
			$(".one5").eq(act1*1-1).toggleClass("active5");
		}
	}
})
$(".right").click(function() {
	var $tdindex1 = $(".active1");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one1").removeClass("active1");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==9){
			$(".one1").eq(0).addClass("active1");
		}
		else{  
			$(".one1").eq(act1*1+1).toggleClass("active1");
		}
	}
	var $tdindex1 = $(".active2");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one2").removeClass("active2");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==9){
			$(".one2").eq(0).addClass("active2");
		}
		else{  
			$(".one2").eq(act1*1+1).toggleClass("active2");
		}
	}
	var $tdindex1 = $(".active3");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one3").removeClass("active3");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==9){
			$(".one3").eq(0).addClass("active3");
		}
		else{  
			$(".one3").eq(act1*1+1).toggleClass("active3");
		}
	}
	var $tdindex1 = $(".active4");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one4").removeClass("active4");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==9){
			$(".one4").eq(0).addClass("active4");
		}
		else{  
			$(".one4").eq(act1*1+1).toggleClass("active4");
		}
	}
	var $tdindex1 = $(".active5");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one5").removeClass("active5");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==9){
			$(".one5").eq(0).addClass("active5");
		}
		else{  
			$(".one5").eq(act1*1+1).toggleClass("active5");
		}
	}
})




